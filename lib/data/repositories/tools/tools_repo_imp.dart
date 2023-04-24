import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/data_models/tool.dart';
import 'package:tools_rental_management/data/data_sources/local/tools/tools_local_datasource_interface.dart';
import 'package:tools_rental_management/data/data_sources/local/tools/tools_localsqlite_datasource_imp.dart';
import 'package:tools_rental_management/data/repositories/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/enums/status.dart';

class ToolRepoImp implements ToolsRepo {
  late ToolsLocalDataSource _toolsLocalDataSource;

  ToolRepoImp({ToolsLocalDataSource? toolsLocalDataSource}) {
    _toolsLocalDataSource = toolsLocalDataSource ?? locator.get<ToolsLocalSqliteDbDataSource>();
  }

  @override
  Future<int> insertTool(Tool tool) {
    return _toolsLocalDataSource.insertTool(tool);
  }

  /// update and return the updated tool.
  @override
  Future<Tool> updateTool(Tool tool) async {
    await _toolsLocalDataSource.updateTool(tool);
    final Tool? workShopTool = await getToolByIdOrNull(tool.toolId!);
    return workShopTool!;
  }

  /// will return the updated tools that are associated with a [ToolUser] of the given toolUserId.
  @override
  Future<List<Tool>> associateToolsWithToolUser(List<Tool> tools, int toolUserId) async {
    final List<Tool> associatedTools = tools.map((tool) {
      return tool.copyWith(
        toolUserId: toolUserId,
        // every time we associate a tool with a [ToolUser], we increment the rent count of the tool, which
        // will keep track of how many times the tool has been rented out over its life time.
        rentCount: tool.rentCount + 1,
        // we also have to update status to 'being used' since the tool is now
        // being used by a [ToolUser] of the given toolUserId.
        status: Status.beingUsed,
      );
    }).toList();

    List<Tool> updatedTools = [];

    // update individual tools in the database one by one
    for (var associatedTool in associatedTools) {
      Tool updatedTool = await updateTool(associatedTool);
      updatedTools.add(updatedTool);
    }

    return updatedTools;
  }

  /// return a future that complete with the amount of tools that have been disassociated.
  @override
  Future<int> disassociateToolsFromToolUser(List<Tool> tools) async {
    final List<Tool> disassociatedTools = tools.map((tool) {
      return tool.copyWith(
        toolUserId: null,
        status: Status.idle,
      );
    }).toList();

    int amountOfToolsUpdated = 0;

    for (var disassociatedTool in disassociatedTools) {
      amountOfToolsUpdated += await _toolsLocalDataSource.updateTool(disassociatedTool);
    }
    return amountOfToolsUpdated;
  }

  @override
  Future<Tool?> getToolByIdOrNull(int toolId) {
    return _toolsLocalDataSource.getToolByIdOrNull(toolId);
  }

  @override
  Future<List<Tool>?> getToolsByStatusOrNull(Status status) {
    return _toolsLocalDataSource.getToolsByStatusOrNull(status);
  }

  @override
  Future<List<Tool>?> getAllToolsOrNull() {
    return _toolsLocalDataSource.getAllToolsOrNull();
  }

  @override
  Future<int> deleteToolById(int toolId) {
    return _toolsLocalDataSource.deleteToolById(toolId);
  }

  @override
  Future<int> deleteAllTools() {
    return _toolsLocalDataSource.deleteAllTools();
  }
}
