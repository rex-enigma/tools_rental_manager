import 'package:tools_rental_management/data/data_models/tool.dart';
import 'package:tools_rental_management/enums/status.dart';

abstract class ToolsRepo {
  Future<int> insertTool(Tool tool);
  Future<Tool> updateTool(Tool tool);
  Future<List<Tool>> associateToolsWithToolUser(
      List<Tool> tools, int toolUserId);
  Future<int> disassociateToolsFromToolUser(List<Tool> tools);
  Future<Tool?> getToolByIdOrNull(int toolId);
  Future<List<Tool>?> getToolsByStatusOrNull(Status status);
  Future<List<Tool>?> getAllToolsOrNull();
  Future<int> deleteToolById(int toolId);
  Future<int> deleteAllTools();
}
