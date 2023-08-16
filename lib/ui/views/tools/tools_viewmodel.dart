import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/data_models/tool.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/currency.dart';
import 'package:tools_rental_management/enums/status.dart';
import 'package:tools_rental_management/ui/views/tools/menu_status_filter.dart';

class ToolsViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  // final _toolsRepo = locator<ToolsRe>

  // this the the new tool that has been constructed from ToolCreatorSheet
  // remember this newTool does't have an toolId yet, it will be assigned by sqlite so don't thing about using it directly here
  Tool? _newTool;

  /// tool search text form field toggle
  bool _showAppBarSearchField = false;

  int currentSelectedTab = 0;
  // the current selected status filter in the status menu
  MenuStatusFilter currentSelectedStatusFilter = MenuStatusFilter.viewAllTools;

  // hold all tools from database
  List<Tool> tools = testTools;
  // filtered tools based on their status
  List<Tool> _menuStatusFilteredTools = [];
  // contains all powered tools and un-powered tools
  List<Tool> allToolsTabView = []; // represent tools in currentSelectedTab = 0; , can also represent tools that are being searched
  List<Tool> poweredToolsTabView = []; // currentSelectedTab = 1;
  List<Tool> unPoweredToolsTabView = []; // currentSelectedTab = 2;

// dont forget to initialize tools, currently  it is initialized  by a test list of testTools.
  void initState() {
    // initialize tools

    updateUi();
  }

// initstate and insertNewTool will use this
// initState will use this to initialize the states
// insertNewTool will use this when it is done inserting a new tool to the database so that the new tool can get reflected in the ui
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
            return (tool.name.toLowerCase().contains(query.toLowerCase()) && tool.category == Category.unpoweredTool);
          },
        ).toList();
      default:
    }

    rebuildUi();
  }

  // filter tools by there status and add them to [menuStatusFilteredTools]
  void _filterToolsByStatus(MenuStatusFilter menuStatusFilter) {
    switch (menuStatusFilter) {
      // contains all the tools regardless of there tool status
      case MenuStatusFilter.viewAllTools:
        _menuStatusFilteredTools = [...tools];

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
        unPoweredToolsTabView = _menuStatusFilteredTools.where((tool) => tool.category == Category.unpoweredTool).toList();
        break;
      default:
    }
  }

  // Future<int> insertNewTool() {}

  void showToolCreatorBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.toolCreator,
      isScrollControlled: true,
      // setting it to false will make sure when you use [SafeArea] when constructing bottomSheet, it won't be ignored.
      ignoreSafeArea: false,
      data: 'passed data', // its not used currently, its just there to remind me that i can send data to the new screen
    );
    print(response?.data);
  }

  /// return the full name of a toolUser for the given toolUser key

  String getToolUserFullName(int key) {
    // should implement a functionality that returns the full name of a tool user for the given key
    return 'John doe'; // return a placeholder name for testing purpose.
  }
}

List<Tool> testTools = [
  Tool(
      status: Status.beingUsed,
      category: Category.poweredTool,
      name: 'Tool1',
      boughtAt: DateTime(2000),
      currency: Currency.kes,
      purchasedPrice: 200,
      rate: 22,
      rentCount: 2,
      toolId: 0,
      toolImagePath: '',
      toolUniqueId: 00,
      toolUserId: 100),
  Tool(
      status: Status.idle,
      category: Category.unpoweredTool,
      name: 'Tool2',
      boughtAt: DateTime(2000),
      currency: Currency.kes,
      purchasedPrice: 210,
      rate: 22,
      rentCount: 2,
      toolId: 1,
      toolImagePath: '',
      toolUniqueId: 01,
      toolUserId: null),
  Tool(
      status: Status.beingUsed,
      category: Category.poweredTool,
      name: 'Tool3',
      boughtAt: DateTime(2000),
      currency: Currency.kes,
      purchasedPrice: 200,
      rate: 22,
      rentCount: 2,
      toolId: 2,
      toolImagePath: '',
      toolUniqueId: 02,
      toolUserId: 101),
  Tool(
      status: Status.retired,
      category: Category.unpoweredTool,
      name: 'Tool4',
      boughtAt: DateTime(2000),
      currency: Currency.kes,
      purchasedPrice: 200,
      rate: 22,
      rentCount: 2,
      toolId: 3,
      toolImagePath: '',
      toolUniqueId: 03,
      toolUserId: null),
  Tool(
      status: Status.underMaintenance,
      category: Category.unpoweredTool,
      name: 'Tool5',
      boughtAt: DateTime(2000),
      currency: Currency.kes,
      purchasedPrice: 200,
      rate: 22,
      rentCount: 2,
      toolId: 4,
      toolImagePath: '',
      toolUniqueId: 04,
      toolUserId: null),
  Tool(
      status: Status.idle,
      category: Category.poweredTool,
      name: 'Tool6',
      boughtAt: DateTime(2000),
      currency: Currency.kes,
      purchasedPrice: 200,
      rate: 22,
      rentCount: 2,
      toolId: 5,
      toolImagePath: '',
      toolUniqueId: 05,
      toolUserId: null),
  Tool(
      status: Status.beingUsed,
      category: Category.unpoweredTool,
      name: 'Tool7',
      boughtAt: DateTime(2000),
      currency: Currency.kes,
      purchasedPrice: 200,
      rate: 22,
      rentCount: 2,
      toolId: 6,
      toolImagePath: '',
      toolUniqueId: 06,
      toolUserId: 102),
  Tool(
      status: Status.underMaintenance,
      category: Category.poweredTool,
      name: 'Tool8',
      boughtAt: DateTime(2000),
      currency: Currency.kes,
      purchasedPrice: 200,
      rate: 22,
      rentCount: 2,
      toolId: 7,
      toolImagePath: '',
      toolUniqueId: 07,
      toolUserId: null),
  Tool(
      status: Status.beingUsed,
      category: Category.poweredTool,
      name: 'Tool9',
      boughtAt: DateTime(2000),
      currency: Currency.kes,
      purchasedPrice: 200,
      rate: 22,
      rentCount: 2,
      toolId: 8,
      toolImagePath: '',
      toolUniqueId: 08,
      toolUserId: 103),
  Tool(
      status: Status.retired,
      category: Category.poweredTool,
      name: 'Tool10',
      boughtAt: DateTime(2000),
      currency: Currency.kes,
      purchasedPrice: 200,
      rate: 22,
      rentCount: 2,
      toolId: 9,
      toolImagePath: '',
      toolUniqueId: 09,
      toolUserId: null),
  Tool(
      status: Status.underMaintenance,
      category: Category.poweredTool,
      name: 'Tool11',
      boughtAt: DateTime(2000),
      currency: Currency.kes,
      purchasedPrice: 200,
      rate: 22,
      rentCount: 2,
      toolId: 10,
      toolImagePath: '',
      toolUniqueId: 010,
      toolUserId: null),
];
