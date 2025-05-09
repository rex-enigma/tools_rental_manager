import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.locator.dart';

class ToolNamesViewModel extends BaseViewModel {
  final NavigationService _navigationService;

  ToolNamesViewModel({NavigationService? navigationService}) : _navigationService = navigationService ?? locator<NavigationService>();

  final toolNames = sortedToolNames();
  List<String> filteredToolNames = [];

  /// tool name search text form field toggle
  bool _showAppBarSearchField = false;

  void initState() {
    filteredToolNames.addAll(toolNames);
    // check if without rebuildUi() call is still working
  }

  void searchToolName(String query) {
    filteredToolNames = toolNames.where((toolName) {
      return toolName.toLowerCase().contains(query.toLowerCase());
    }).toList();
    rebuildUi();
  }

  bool get showAppBarSearchField => _showAppBarSearchField;

  set showAppBarSearchField(bool value) {
    _showAppBarSearchField = value;
    rebuildUi();
  }

  void resetFilteredToolNameToDefault() {
    filteredToolNames = [...toolNames];
    rebuildUi();
  }

  void navigateBack({String? toolName}) {
    // return tool name back to the calling function (currently will be returned to navigateToToolNamesView in ToolCreatorSheetModel)
    _navigationService.back(result: toolName);
  }
}

/// the list is sorted in ascending order.
List<String> sortedToolNames() {
  List<String> toolNames = [
    'Angle grinder',
    'Axe',
    'Chainsaw',
    'Chisel',
    'Circular saw',
    'Numerical control',
    'Drill',
    'Forklift',
    'Hacksaw',
    'Hammer',
    'Hand saw',
    'Hex key',
    'Jackhammer',
    'Jigsaw (tool)',
    'Ladder',
    'Lathe',
    'Nail gun',
    'Pipe wrench',
    'Plane (tool)',
    'Pliers',
    'Sander',
    'Shovel',
    'Spade',
    'Spirit level',
    'Table saw',
    'Tape measure',
    'Trowel',
    'Vise',
    'Wheelbarrow',
    'Wrench',
  ];
  toolNames.sort();
  return toolNames;
}
