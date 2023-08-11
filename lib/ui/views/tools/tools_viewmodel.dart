import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/data_models/tool.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/status.dart';
import 'package:tools_rental_management/ui/views/tools/menu_status_filter.dart';

class ToolsViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  /// tool search text form field toggle
  bool _showAppBarTextField = false;

  int currentSelectedTab = 0;
  // the current selected status filter in the status menu
  MenuStatusFilter currentSelectedStatusFilter = MenuStatusFilter.viewAllTools;

  // hold all tools from database
  List<TestTool> _tools = testTools;
  // filtered tools based on their status
  List<TestTool> _menuStatusFilteredTools = [];
  // contains all powered tools and un-powered tools
  List<TestTool> allToolsTabView = []; // represent tools in currentSelectedTab = 0;
  List<TestTool> poweredToolsTabView = []; // currentSelectedTab = 1;
  List<TestTool> unPoweredToolsTabView = []; // currentSelectedTab = 2;

// dont forget to initialize tools, currently the it is initialized on  by a test list of testTools.
  void initState() {
    // initialize tools

    _filterToolsByStatus(currentSelectedStatusFilter);
    _displayTools(currentSelectedTab);
    rebuildUi();
  }

  bool get showAppBarTextField => _showAppBarTextField;

  set showAppBarTextField(bool value) {
    _showAppBarTextField = value;
    rebuildUi();
  }

  void cancelToolSearch() {
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

  // filter tools by there status and add them to [menuStatusFilteredTools]
  void _filterToolsByStatus(MenuStatusFilter menuStatusFilter) {
    switch (menuStatusFilter) {
      // contains all the tools regardless of there tool status
      case MenuStatusFilter.viewAllTools:
        _menuStatusFilteredTools = [..._tools];

        break;
      case MenuStatusFilter.viewOnlyToolsBeingUsed:
        _menuStatusFilteredTools = _tools.where((testTool) => testTool.status == Status.beingUsed).toList();

        break;
      case MenuStatusFilter.viewOnlyIdleTools:
        _menuStatusFilteredTools = _tools.where((testTool) => testTool.status == Status.idle).toList();

        break;
      case MenuStatusFilter.viewOnlyRetiredTools:
        _menuStatusFilteredTools = _tools.where((testTool) => testTool.status == Status.retired).toList();
        break;
      case MenuStatusFilter.viewOnlyToolsUnderMaintenance:
        _menuStatusFilteredTools = _tools.where((testTool) => testTool.status == Status.underMaintenance).toList();
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
        poweredToolsTabView = _menuStatusFilteredTools.where((testTool) => testTool.category == Category.poweredTool).toList();
        print(poweredToolsTabView);
        break;
      // display only un-powered tools in Unpowered tab
      case 2:
        unPoweredToolsTabView = _menuStatusFilteredTools.where((testTool) => testTool.category == Category.unpoweredTool).toList();
        break;
      default:
    }
  }

  void showToolCreatorBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.toolCreator,
      isScrollControlled: true,
      // setting it to false will make sure if you use [SafeArea] when constructing bottomSheet, it won't be ignored.
      ignoreSafeArea: false,
      data: 'my passed data',
    );
    print(response?.data);
  }
}

List<TestTool> testTools = const [
  TestTool(status: Status.beingUsed, category: Category.poweredTool, testToolName: 'Tool1'),
  TestTool(status: Status.idle, category: Category.unpoweredTool, testToolName: 'Tool2'),
  TestTool(status: Status.retired, category: Category.poweredTool, testToolName: 'Tool3'),
  TestTool(status: Status.underMaintenance, category: Category.poweredTool, testToolName: 'Tool4'),
  TestTool(status: Status.beingUsed, category: Category.unpoweredTool, testToolName: 'Tool5'),
  TestTool(status: Status.idle, category: Category.poweredTool, testToolName: 'Tool6'),
  TestTool(status: Status.retired, category: Category.unpoweredTool, testToolName: 'Tool7'),
  TestTool(status: Status.underMaintenance, category: Category.poweredTool, testToolName: 'Tool8'),
  TestTool(status: Status.beingUsed, category: Category.poweredTool, testToolName: 'Tool9'),
  TestTool(status: Status.idle, category: Category.unpoweredTool, testToolName: 'Tool10'),
  TestTool(status: Status.retired, category: Category.unpoweredTool, testToolName: 'Tool11'),
];

class TestTool {
  final Status status;
  final Category category;
  final String testToolName;

  const TestTool({required this.status, required this.category, required this.testToolName});
}
