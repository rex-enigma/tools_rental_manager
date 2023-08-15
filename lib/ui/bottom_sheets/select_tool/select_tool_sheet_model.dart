import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/data/data_models/tool.dart';
import 'package:tools_rental_management/ui/views/tools/tools_viewmodel.dart';

class SelectToolSheetModel extends BaseViewModel {
  // these are tools whose status is idle
  List<Tool> idleTools = testIdleTools;
  List<Tool> selectedTools = [];
  bool isAnyToolSelected = false;

  void initState() {
    // getIdleTools();
  }

  void selectTool(Tool tool) {
    isAnyToolSelected = true;
    selectedTools.add(tool);
    rebuildUi();
  }

  void deselectTool(Tool tool) {
    selectedTools.remove(tool);
    if (selectedTools.isEmpty) isAnyToolSelected = false;
    rebuildUi();
  }

  void deselectAllTools() {
    selectedTools.clear();
    isAnyToolSelected = false;
    rebuildUi();
  }

  // having a return of only void also works since it will be wrapped in a future
  Future<void> getIdleTools() async {
    // code a functionality that fetched idleTools async from the database
  }
}

// for tsting purposes
List<Tool> testIdleTools = [
  testTools[1],
  testTools[5],
];
