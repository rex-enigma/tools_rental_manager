import 'package:tools_rental_management/data/data_models/tool.dart';
import 'package:tools_rental_management/enums/status.dart';

abstract class ToolsLocalDataSource {
  Future<int> insertTool(Tool tool);
  Future<int> updateTool(Tool tool);
  Future<Tool?> getToolByIdOrNull(int toolId);
  Future<List<Tool>?> getToolsByStatusOrNull(Status status);
  Future<List<Tool>?> getAllToolsOrNull();
  Future<int> deleteToolById(int toolId);
  Future<int> deleteAllTools();
}
