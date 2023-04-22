import 'package:tools_rental_management/data/data_models/tool.dart';
import 'package:tools_rental_management/data/data_sources/local/tools/tools_local_datasource_interface.dart';
import 'package:tools_rental_management/database/app_database.dart';
import 'package:tools_rental_management/enums/status.dart';

// data source class: type of data + type of source + DataSource (tools + localSqlDb + DataSource);
// the data source class should only work with one source of data (AppDatabase)
class ToolsLocalSqliteDbDataSource implements ToolsLocalDataSource {
  final AppDatabase _db = AppDatabase();

  @override
  Future<int> insertTool(Tool tool) {
    return _db.toolsDao.insertTool(tool);
  }

  @override
  Future<int> updateTool(Tool tool) {
    return _db.toolsDao.updateTool(tool);
  }

  @override
  Future<Tool?> getToolByIdOrNull(int toolId) {
    return _db.toolsDao.getToolByIdOrNull(toolId);
  }

  @override
  Future<List<Tool>?> getToolsByStatusOrNull(Status status) {
    return _db.toolsDao.getToolsByStatusOrNull(status);
  }

  @override
  Future<List<Tool>?> getAllToolsOrNull() {
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
