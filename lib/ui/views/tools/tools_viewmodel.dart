import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/app/app.router.dart';
import 'package:tools_rental_management/app/app.snackbars.dart';
import 'package:tools_rental_management/domain/entities/tool_entity.dart';
import 'package:tools_rental_management/domain/entities/tooluser_entity.dart';
import 'package:tools_rental_management/domain/usecases/add_tool_usecase.dart';
import 'package:tools_rental_management/domain/usecases/delete_tool_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_all_tools_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_user_usecase.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/status.dart';
import 'package:tools_rental_management/errors/exceptions.dart';
import 'package:tools_rental_management/ui/views/tools/menu_status_filter.dart';

class ToolsViewModel extends BaseViewModel {
  final DialogService _dialogService;
  final NavigationService _navigationService;
  final BottomSheetService _bottomSheetService;
  final SnackbarService _snackbarService;
  final UseCase<ToolUserEntity?, ToolUserIdParam> _getToolUserUseCase;
  final UseCase<List<ToolEntity>?, NoParams> _getAllToolsUseCase;
  final UseCase<int, AddToolParam> _addToolUseCase;
  final UseCase<int, ToolIdParam> _deleteToolUseCase;

  ToolsViewModel(
      {DialogService? dialogService,
      NavigationService? navigationService,
      BottomSheetService? bottomSheetService,
      SnackbarService? snackbarService,
      UseCase<ToolUserEntity?, ToolUserIdParam>? getToolUserUseCase,
      UseCase<List<ToolEntity>?, NoParams>? getAllToolsUseCase,
      UseCase<int, AddToolParam>? addToolUseCase,
      UseCase<int, ToolIdParam>? deleteToolUseCase})
      : _dialogService = dialogService ?? locator<DialogService>(),
        _navigationService = navigationService ?? locator<NavigationService>(),
        _bottomSheetService = bottomSheetService ?? locator<BottomSheetService>(),
        _snackbarService = snackbarService ?? locator<SnackbarService>(),
        _getToolUserUseCase = getToolUserUseCase ?? locator<GetToolUserUseCase>(),
        _getAllToolsUseCase = getAllToolsUseCase ?? locator<GetAllToolsUseCase>(),
        _addToolUseCase = addToolUseCase ?? locator<AddToolUseCase>(),
        _deleteToolUseCase = deleteToolUseCase ?? locator<DeleteToolUseCase>();

  // // this the the new tool that has been constructed from ToolCreatorSheet
  // // remember this newTool does't have an toolId yet, it will be assigned by sqlite so don't think about using it directly here
  // Tool? _newTool;

  /// tool search text form field toggle
  bool _showAppBarSearchField = false;

  int currentSelectedTab = 0;
  // the current selected status filter in the status menu
  MenuStatusFilter currentSelectedStatusFilter = MenuStatusFilter.viewAllTools;

  // hold all tools from database
  List<ToolEntity> tools = [];
  // filtered tools based on their status
  List<ToolEntity> _menuStatusFilteredTools = [];
  // contains all powered tools and un-powered tools
  List<ToolEntity> allToolsTabView =
      []; // represent tools in currentSelectedTab = 0; , can also represent tools that are being searched
  List<ToolEntity> poweredToolsTabView = []; // currentSelectedTab = 1;
  List<ToolEntity> unPoweredToolsTabView = []; // currentSelectedTab = 2;

  /// a map containing toolUser ids as key and toolUser fullname as values;
  /// These names contained here represents toolUsers currently using a specific tool that is being displayed
  /// when view is constructing tools, it should access this map with a specific key(toolUser key) to get
  /// the name of a toolUser for a corresponding tool
  Map<int, String> toolUserNames = {};

// dont forget to initialize tools, currently  it is initialized  by a test list of testTools.
  void initState() async {
    List<ToolEntity>? toolsOrNull = await _fetchAllTools();
    await setToolUserNames(toolsOrNull);
    addTools(toolsOrNull);
  }

  Future setToolUserNames(List<ToolEntity>? tools) async {
    if (tools == null) return;
    for (var tool in tools) {
      int? toolUserId = tool.toolUserId;
      if (toolUserId != null) {
        ToolUserEntity? toolUser = await runBusyFuture(_getToolUserUseCase(ToolUserIdParam(toolUserId: toolUserId)));
        String fullName = '${toolUser?.firstName} ${toolUser?.lastName}';
        toolUserNames[toolUserId] = fullName;
      }
    }
  }

  // will be called after tools? have been fetched from the database and have already been added to the [tools] property
  void updateUi() {
    _filterToolsByStatus(currentSelectedStatusFilter);
    _displayTools(currentSelectedTab);
    rebuildUi();
  }

  bool get showAppBarSearchField => _showAppBarSearchField;

  set showAppBarSearchField(bool value) {
    _showAppBarSearchField = value;
    rebuildUi();
  }

  // will reset allToolsTabView / poweredToolsTabView /unPoweredToolsTabView to the tools thy contained before the user initiated search
  void resetTabViewToolsToDefault() {
    _displayTools(currentSelectedTab);
    rebuildUi();
  }

  void changeTab(int index) {
    currentSelectedTab = index;
    _displayTools(index);
    rebuildUi();
  }

  void onMenuStatusFilter(MenuStatusFilter menuStatusFilter) {
    currentSelectedStatusFilter = menuStatusFilter;
    _filterToolsByStatus(currentSelectedStatusFilter);
    _displayTools(currentSelectedTab);
    rebuildUi();
  }

  void searchForAToolInATabView(String query) {
    // we need to know the current selected tab so that we can search on a specific tabView
    switch (currentSelectedTab) {
      // the user is viewing 'All tab', so filter and set the searched tools in [allToolsTabView]
      case 0:
        allToolsTabView = _menuStatusFilteredTools
            .where(
              (tool) => tool.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
        break;
      // the user is viewing 'Powered tools tab', so filter and set the searched tools in [poweredToolsTabView]
      case 1:
        poweredToolsTabView = _menuStatusFilteredTools.where(
          (tool) {
            // returns true if any tool in _menuStatusFilteredTools contains a name that the user want and
            // we also need to make sure we set poweredToolsTabView with tools whose category is powered since that is what poweredToolsTabView should contain
            // hence both of them must be true
            return (tool.name.toLowerCase().contains(query.toLowerCase()) && tool.category == Category.poweredTool);
          },
        ).toList();
        break;
      // the user is viewing 'Unpowered tools tab', so filter and set the searched tools in [unPoweredToolsTabView]
      case 2:
        unPoweredToolsTabView = _menuStatusFilteredTools.where(
          (tool) {
            return (tool.name.toLowerCase().contains(query.toLowerCase()) && tool.category == Category.unPoweredTool);
          },
        ).toList();
      default:
    }

    rebuildUi();
  }

  // filter tools by there status and add them to [menuStatusFilteredTools]
  void _filterToolsByStatus(MenuStatusFilter menuStatusFilter) {
    // print(tools);
    switch (menuStatusFilter) {
      // contains all the tools regardless of there tool status
      case MenuStatusFilter.viewAllTools:
        _menuStatusFilteredTools = [...tools];
        // print(_menuStatusFilteredTools);
        break;
      case MenuStatusFilter.viewOnlyToolsBeingUsed:
        _menuStatusFilteredTools = tools.where((tool) => tool.status == Status.beingUsed).toList();

        break;
      case MenuStatusFilter.viewOnlyIdleTools:
        _menuStatusFilteredTools = tools.where((tool) => tool.status == Status.idle).toList();

        break;
      case MenuStatusFilter.viewOnlyRetiredTools:
        _menuStatusFilteredTools = tools.where((tool) => tool.status == Status.retired).toList();
        break;
      case MenuStatusFilter.viewOnlyToolsUnderMaintenance:
        _menuStatusFilteredTools = tools.where((tool) => tool.status == Status.underMaintenance).toList();
        break;
      default:
    }
  }

  void _displayTools(int selectedTab) {
    switch (selectedTab) {
      // display both powered and un-powered tools in All tab
      case 0:
        allToolsTabView = [..._menuStatusFilteredTools];
        break;
      // display only powered tools in Powered tab
      case 1:
        poweredToolsTabView = _menuStatusFilteredTools.where((tool) => tool.category == Category.poweredTool).toList();
        break;
      // display only un-powered tools in Unpowered tab
      case 2:
        unPoweredToolsTabView =
            _menuStatusFilteredTools.where((tool) => tool.category == Category.unPoweredTool).toList();
        break;
      default:
    }
  }

  /// return the full name of a toolUser for the given toolUser key
  String? getToolUserFullName(int key) {
    return toolUserNames[key];
  }

// add tools fetched from the database to this.tools list
  void addTools(List<ToolEntity>? tools) {
    if (tools != null) {
      // order the tools in descending order
      // since the toolIds are sequentially incremented, its guaranteed that the newly added tool to the database will have a larger toolId value
      // and therefore we want it get display at the top
      tools.sort((toolA, toolB) => toolB.toolId!.compareTo(toolA.toolId!));
    }
    this.tools = tools == null ? [] : [...tools];
    updateUi();
  }

  // // we are using runBusyFuture function so that it can allow as to check if our viewModel is busy through the isBusy property handling a future function
  // Future _insertTool(Tool newTool) async {}

  Future<List<ToolEntity>?> _fetchAllTools() async {
    // Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    return runBusyFuture(_getAllToolsUseCase(NoParams()));
  }

  // Future<List<Tool>?> _getAllTools() {
  //   return _toolsRepoImp.getAllToolsOrNull();
  // }

  Future<int> _insertNewTool(ToolEntity newTool) {
    // Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    return runBusyFuture(_addToolUseCase(AddToolParam(toolEntity: newTool)));
  }

  void showToolCreatorBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.toolCreator,
      isScrollControlled: true,
      // setting it to false will make sure when you use [SafeArea] when constructing bottomSheet, it won't be ignored.
      ignoreSafeArea: false,
      data: 'passed data', // its not used currently, its just there to remind me that i can send data to the new screen
    );
    // response.data is not null when a user has constructed a new tool
    if (response?.data != null) {
      ToolEntity newTool = response!.data;
      final result = await _insertNewTool(newTool);

      // Tool already exists
      if (result == -1) {
        final dialogService = locator<DialogService>();
        await dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: 'Tool Exists',
          description: 'The tool with unique id ${newTool.toolUniqueId} already exists.',
        );
        return;
      }
      _snackbarService.showCustomSnackBar(
          message: '${newTool.name} created successfully', variant: SnackbarType.success);
      List<ToolEntity>? toolsOrNull = await _fetchAllTools();
      // this will add the tools? gotten from the database to the [tools] property
      addTools(toolsOrNull);
    }
  }

// will be called when the user navigate to toolView then back or when a tool is deleted
// the user might update the tool in toolView therefore we refetch 'all the tools' and update toolsView [yea i know i should only fetch that updated tool but its just a prototype]
  void updateTools() async {
    List<ToolEntity>? toolsOrNull = await _fetchAllTools();
    addTools(toolsOrNull);
  }

  void deleteRetiredTool(ToolEntity tool) async {
    // status of the tool to be used to validate the tool to be deleted is actually retired
    if (tool.status != Status.retired) throw FailedToDeleteATool(message: '$tool is not retired yet');
    // a value on 1 will be will be extracted from awaited future if the deletion was successful

    // Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    await runBusyFuture(_deleteToolUseCase(ToolIdParam(toolId: tool.toolId!)));

    // once the deletion is complete, show a snackbar message to the user
    _snackbarService.showCustomSnackBar(message: '${tool.name} deleted successfully', variant: SnackbarType.success);
    updateTools();
  }

  void navigateToToolView(int toolId) async {
    await _navigationService.navigateToToolView(toolId: toolId);
    // the user might have updated a tool, so we run updateTool to refetch all the tools to display any updates that might have been done on a tool { i know we should only fetch that updated tool instead of the all the tools}
    updateTools();
  }

  void showToolDeleteConfirmDialog(ToolEntity tool) async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.deleteConfirm,
      // pass the name of the tool to be displayed on the DeleteConfirmDialog
      data: tool.name,
    );

    // response.confirm will be true if the user has confirms the tool deletion by pressing confirm or false when the user has pressed cancel
    if (response?.confirmed == true) {
      deleteRetiredTool(tool);
    }
  }
}

// List<ToolEntity> testTools = [
//   ToolEntity(
//       status: Status.beingUsed,
//       category: Category.poweredTool,
//       name: 'Tool1',
//       boughtAt: DateTime(2000),
//       currency: Currency.kes,
//       purchasedPrice: 200,
//       rate: 22,
//       rentCount: 2,
//       toolId: 0,
//       toolImagePath: '',
//       toolUniqueId: 00,
//       toolUserId: 100),
//   ToolEntity(
//       status: Status.idle,
//       category: Category.unPoweredTool,
//       name: 'Tool2',
//       boughtAt: DateTime(2000),
//       currency: Currency.kes,
//       purchasedPrice: 210,
//       rate: 22,
//       rentCount: 2,
//       toolId: 1,
//       toolImagePath: '',
//       toolUniqueId: 01,
//       toolUserId: null),
//   ToolEntity(
//       status: Status.beingUsed,
//       category: Category.poweredTool,
//       name: 'Tool3',
//       boughtAt: DateTime(2000),
//       currency: Currency.kes,
//       purchasedPrice: 200,
//       rate: 22,
//       rentCount: 2,
//       toolId: 2,
//       toolImagePath: '',
//       toolUniqueId: 02,
//       toolUserId: 101),
//   ToolEntity(
//       status: Status.retired,
//       category: Category.unPoweredTool,
//       name: 'Tool4',
//       boughtAt: DateTime(2000),
//       currency: Currency.kes,
//       purchasedPrice: 200,
//       rate: 22,
//       rentCount: 2,
//       toolId: 3,
//       toolImagePath: '',
//       toolUniqueId: 03,
//       toolUserId: null),
//   ToolEntity(
//       status: Status.underMaintenance,
//       category: Category.unPoweredTool,
//       name: 'Tool5',
//       boughtAt: DateTime(2000),
//       currency: Currency.kes,
//       purchasedPrice: 200,
//       rate: 22,
//       rentCount: 2,
//       toolId: 4,
//       toolImagePath: '',
//       toolUniqueId: 04,
//       toolUserId: null),
//   ToolEntity(
//       status: Status.idle,
//       category: Category.poweredTool,
//       name: 'Tool6',
//       boughtAt: DateTime(2000),
//       currency: Currency.kes,
//       purchasedPrice: 200,
//       rate: 22,
//       rentCount: 2,
//       toolId: 5,
//       toolImagePath: '',
//       toolUniqueId: 05,
//       toolUserId: null),
//   ToolEntity(
//       status: Status.beingUsed,
//       category: Category.unPoweredTool,
//       name: 'Tool7',
//       boughtAt: DateTime(2000),
//       currency: Currency.kes,
//       purchasedPrice: 200,
//       rate: 22,
//       rentCount: 2,
//       toolId: 6,
//       toolImagePath: '',
//       toolUniqueId: 06,
//       toolUserId: 102),
//   ToolEntity(
//       status: Status.underMaintenance,
//       category: Category.poweredTool,
//       name: 'Tool8',
//       boughtAt: DateTime(2000),
//       currency: Currency.kes,
//       purchasedPrice: 200,
//       rate: 22,
//       rentCount: 2,
//       toolId: 7,
//       toolImagePath: '',
//       toolUniqueId: 07,
//       toolUserId: null),
//   ToolEntity(
//       status: Status.beingUsed,
//       category: Category.poweredTool,
//       name: 'Tool9',
//       boughtAt: DateTime(2000),
//       currency: Currency.kes,
//       purchasedPrice: 200,
//       rate: 22,
//       rentCount: 2,
//       toolId: 8,
//       toolImagePath: '',
//       toolUniqueId: 08,
//       toolUserId: 103),
//   ToolEntity(
//       status: Status.retired,
//       category: Category.poweredTool,
//       name: 'Tool10',
//       boughtAt: DateTime(2000),
//       currency: Currency.kes,
//       purchasedPrice: 200,
//       rate: 22,
//       rentCount: 2,
//       toolId: 9,
//       toolImagePath: '',
//       toolUniqueId: 09,
//       toolUserId: null),
//   ToolEntity(
//       status: Status.underMaintenance,
//       category: Category.poweredTool,
//       name: 'Tool11',
//       boughtAt: DateTime(2000),
//       currency: Currency.kes,
//       purchasedPrice: 200,
//       rate: 22,
//       rentCount: 2,
//       toolId: 10,
//       toolImagePath: '',
//       toolUniqueId: 010,
//       toolUserId: null),
// ];
