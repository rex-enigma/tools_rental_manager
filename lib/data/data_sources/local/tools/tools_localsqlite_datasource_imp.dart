import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/models/tool_model.dart';
import 'package:tools_rental_management/data/data_sources/local/tools/tools_local_datasource_interface.dart';
import 'package:tools_rental_management/database/app_database.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/status.dart';

// data source class: type of data + type of source + DataSource (tools + localSqlDb + DataSource);
// the data source class should only work with one source of data (AppDatabase)
class ToolsLocalSqliteDbDataSource implements ToolsLocalDataSource {
  final AppDatabase _db = locator<AppDatabase>();

  @override
  Future<int> insertTool(ToolModel tool) {
    return _db.toolsDao.insertTool(tool);
  }

  @override
  Future<int> updateTool(ToolModel tool) {
    return _db.toolsDao.updateTool(tool);
  }

  @override
  Future<int> updateToolCategory(Category toolCategory, int toolId) {
    return _db.toolsDao.updateToolCategory(toolCategory, toolId);
  }

  @override
  Future<int> updateToolImagePath(String toolImagePath, int toolId) {
    return _db.toolsDao.updateToolImagePath(toolImagePath, toolId);
  }

  @override
  Future<int> updateToolName(String toolName, int toolId) {
    return _db.toolsDao.updateToolName(toolName, toolId);
  }

  @override
  Future<int> updateToolRate(int toolRate, int toolId) {
    return _db.toolsDao.updateToolRate(toolRate, toolId);
  }

  @override
  Future<int> updateToolStatus(Status toolStatus, int toolId) {
    return _db.toolsDao.updateToolStatus(toolStatus, toolId);
  }

  @override
  Future<ToolModel?> getToolByIdOrNull(int toolId) {
    return _db.toolsDao.getToolByIdOrNull(toolId);
  }

  @override
  Future<Category?> getToolCategoryByIdOrNull(int toolId) {
    return _db.toolsDao.getToolCategoryByIdOrNull(toolId);
  }

  @override
  Future<String?> getToolImagePathByIdOrNull(int toolId) {
    return _db.toolsDao.getToolImagePathByIdOrNull(toolId);
  }

  @override
  Future<String?> getToolNameByIdOrNull(int toolId) {
    return _db.toolsDao.getToolNameByIdOrNull(toolId);
  }

  @override
  Future<int?> getToolRateByIdOrNull(int toolId) {
    return _db.toolsDao.getToolRateByIdOrNull(toolId);
  }

  @override
  Future<Status?> getToolStatusByIdOrNull(int toolId) {
    return _db.toolsDao.getToolStatusByIdOrNull(toolId);
  }

  @override
  Future<List<ToolModel>?> getToolsByStatusOrNull(Status status) {
    return _db.toolsDao.getToolsByStatusOrNull(status);
  }

  @override
  Future<List<ToolModel>?> getToolsByToolUserIdOrNull(int toolUserId) {
    return _db.toolsDao.getToolsByToolUserIdOrNull(toolUserId);
  }

  @override
  Future<List<ToolModel>?> getAllToolsOrNull() {
    return _db.toolsDao.getAllToolsOrNull();
  }

  @override
  Future<int> deleteToolById(int toolId) {
    return _db.toolsDao.deleteToolById(toolId);
  }

  @override
  Future<int> deleteAllTools() {
    return _db.toolsDao.deleteAllTools();
  }
}
