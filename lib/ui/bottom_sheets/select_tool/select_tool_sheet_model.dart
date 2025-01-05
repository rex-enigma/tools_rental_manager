import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/models/tool_model.dart';
import 'package:tools_rental_management/data/repositories/tools/tools_repo_imp.dart';
import 'package:tools_rental_management/enums/status.dart';
import 'package:tools_rental_management/ui/views/tools/tools_viewmodel.dart';

class SelectToolSheetModel extends BaseViewModel {
  final _toolsRepoImp = locator<ToolsRepoImp>();
  // these are tools whose status is idle
  List<ToolModel> idleTools = [];
  List<ToolModel> selectedIdleTools = [];
  bool isAnyToolSelected = false;

  void initState() async {
    await fetchIdleTools();
  }

  void selectTool(ToolModel tool) {
    isAnyToolSelected = true;
    selectedIdleTools.add(tool);
    rebuildUi();
  }

  void deselectIdleTool(ToolModel toolIdle) {
    selectedIdleTools.remove(toolIdle);
    if (selectedIdleTools.isEmpty) isAnyToolSelected = false;
    rebuildUi();
  }

  void deselectAllIdleTools() {
    selectedIdleTools.clear();
    isAnyToolSelected = false;
    rebuildUi();
  }

  Future<void> fetchIdleTools() async {
    List<ToolModel>? idleTools = await runBusyFuture(_toolsRepoImp.getToolsByStatusOrNull(Status.idle));
    // only add to the this.idleTools if the idleTools is not null
    if (idleTools != null) {
      // order the idleTools in descending order to display the newly add idle tool in the database at the top in th UI
      idleTools.sort((idleToolA, idleToolB) => idleToolB.toolId!.compareTo(idleToolA.toolId!));
      this.idleTools = [...idleTools];
    } else {
      this.idleTools = [];
    }
  }
}

// for testing purposes
List<ToolModel> testIdleTools = [
  testTools[1],
  testTools[5],
];
