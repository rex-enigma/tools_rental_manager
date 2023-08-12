import 'package:stacked/stacked.dart';

class ToolNamesViewModel extends BaseViewModel {
  final toolNames = sortedToolNames();
  List<String> filteredToolNames = [];

  /// tool name search text form field toggle
  bool _showAppBarSearchField = false;

  void initState() {
    filteredToolNames.addAll(toolNames);
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
    'Trowel',
    'Vise',
    'Wheelbarrow',
    'Wrench',
  ];
  toolNames.sort();
  return toolNames;
}
