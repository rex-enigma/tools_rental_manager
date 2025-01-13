import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/data_sources/local/tools/tools_local_datasource_interface.dart';
import 'package:tools_rental_management/data/data_sources/local/tools/tools_localsqlite_datasource_imp.dart';
import 'package:tools_rental_management/data/models/tool_model.dart';
import 'package:tools_rental_management/domain/entities/tool_entity.dart';
import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/status.dart';

class ToolsRepoImp implements ToolsRepo {
  late ToolsLocalDataSource _toolsLocalDataSource;

  ToolsRepoImp({ToolsLocalDataSource? toolsLocalDataSource}) {
    _toolsLocalDataSource =
        toolsLocalDataSource ?? locator<ToolsLocalSqliteDbDataSource>();
  }

  @override
  Future<int> insertTool(ToolEntity tool) {
    ToolModel toolModel = ToolModel.fromEntity(tool);
    return _toolsLocalDataSource.insertTool(toolModel);
  }

  /// update and return the updated tool.
  /// The tool passed as argument cant contain null value for Tool.toolId property
  ///  for it to be updated, it must exist in the database
  @override
  Future<ToolEntity> updateTool(ToolEntity tool) async {
    if (tool.toolId == null) {
      throw 'the [Tool] is missing a toolId, hence unable to update the given tool: $tool';
    }

    ToolModel toolModel = ToolModel.fromEntity(tool);

    await _toolsLocalDataSource.updateTool(toolModel);

    ToolEntity? workShopTool = await getToolByIdOrNull(tool.toolId!);

    return workShopTool!;
  }

  /// update and return the updated tool category for the given toolId
  @override
  Future<Category?> updateToolCategory(
      Category toolCategory, int toolId) async {
    await _toolsLocalDataSource.updateToolCategory(toolCategory, toolId);
    return getToolCategoryByIdOrNull(toolId);
  }

  /// update and return the updated tool imagePath for the given toolId
  @override
  Future<String?> updateToolImagePath(String toolImagePath, int toolId) async {
    await _toolsLocalDataSource.updateToolImagePath(toolImagePath, toolId);
    return getToolImagePathByIdOrNull(toolId);
  }

  /// update and return the updated tool name for the given toolId
  @override
  Future<String?> updateToolName(String toolName, int toolId) async {
    await _toolsLocalDataSource.updateToolName(toolName, toolId);
    return getToolNameByIdOrNull(toolId);
  }

  /// update and return the updated tool rate for the given toolId
  @override
  Future<int?> updateToolRate(int toolRate, int toolId) async {
    await _toolsLocalDataSource.updateToolRate(toolRate, toolId);
    return getToolRateByIdOrNull(toolId);
  }

  /// update and return the updated tool status for the given toolId
  @override
  Future<Status?> updateToolStatus(Status toolStatus, int toolId) async {
    await _toolsLocalDataSource.updateToolStatus(toolStatus, toolId);
    return getToolStatusByIdOrNull(toolId);
  }

  /// will return the updated tools that are rented by [ToolUser] of the given toolUserId.
  @override
  Future<List<ToolEntity>> rentOutToolsToToolUser(
      List<ToolEntity> idleTools, int toolUserId) async {
    final List<ToolEntity> associatedTools = idleTools.map((idleTool) {
      return idleTool.copyWith(
        toolUserId: toolUserId,
        // every time we associate a tool with a [ToolUser], we increment the rent count of the tool, which
        // will keep track of how many times the tool has been rented out over its life time.
        rentCount: idleTool.rentCount + 1,
        // we also have to update status to 'being used' since the tool is now
        // being used by a [ToolUser] of the given toolUserId.
        status: Status.beingUsed,
      );
    }).toList();

    List<ToolEntity> updatedTools = [];

    // update individual tools in the database one by one
    for (var associatedTool in associatedTools) {
      ToolEntity updatedTool = await updateTool(associatedTool);
      updatedTools.add(updatedTool);
    }

    return updatedTools;
  }

  /// return a future that complete with the amount of tools that have been returned by a toolUser.
  @override
  Future<int> repossessToolsFromToolUser(List<ToolEntity> tools) async {
    final List<ToolEntity> repossessedTools = tools.map((tool) {
      return tool.copyWith(toolUserId: null, status: Status.idle);
    }).toList();

    int numberOfToolsUpdated = 0;

    for (var repossessedTool in repossessedTools) {
      ToolModel repossessedToolModel = ToolModel.fromEntity(repossessedTool);

      numberOfToolsUpdated +=
          await _toolsLocalDataSource.updateTool(repossessedToolModel);
    }
    return numberOfToolsUpdated;
  }

  @override
  Future<ToolEntity?> getToolByIdOrNull(int toolId) async {
    ToolModel? toolModel =
        await _toolsLocalDataSource.getToolByIdOrNull(toolId);
    return toolModel?.toEntity();
  }

  @override
  Future<Category?> getToolCategoryByIdOrNull(int toolId) {
    return _toolsLocalDataSource.getToolCategoryByIdOrNull(toolId);
  }

  @override
  Future<String?> getToolImagePathByIdOrNull(int toolId) {
    return _toolsLocalDataSource.getToolImagePathByIdOrNull(toolId);
  }

  @override
  Future<String?> getToolNameByIdOrNull(int toolId) {
    return _toolsLocalDataSource.getToolNameByIdOrNull(toolId);
  }

  @override
  Future<int?> getToolRateByIdOrNull(int toolId) {
    return _toolsLocalDataSource.getToolRateByIdOrNull(toolId);
  }

  @override
  Future<Status?> getToolStatusByIdOrNull(int toolId) {
    return _toolsLocalDataSource.getToolStatusByIdOrNull(toolId);
  }

  /// return a future that completes with a list of tools of the given status value or null.
  @override
  Future<List<ToolEntity>?> getToolsByStatusOrNull(Status status) async {
    List<ToolModel>? toolModels =
        await _toolsLocalDataSource.getToolsByStatusOrNull(status);

    List<ToolEntity>? toolEntities = toolModels?.map((toolModel) {
      return toolModel.toEntity();
    }).toList();

    return toolEntities;
  }

  @override
  Future<List<ToolEntity>?> getAllToolsOrNull() async {
    List<ToolModel>? toolModels =
        await _toolsLocalDataSource.getAllToolsOrNull();

    List<ToolEntity>? toolEntities =
        toolModels?.map((toolModel) => toolModel.toEntity()).toList();

    return toolEntities;
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
