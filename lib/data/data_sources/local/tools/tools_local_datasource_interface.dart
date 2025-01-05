import 'package:tools_rental_management/data/models/tool_model.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/status.dart';

abstract class ToolsLocalDataSource {
  // inserts
  /// return how many rows have been affected
  Future<int> insertTool(Tool tool);

  // updates
  /// return how many rows have been affected
  Future<int> updateTool(Tool tool);

  /// return how many rows have been affected
  Future<int> updateToolName(String toolName, int toolId);

  /// return how many rows have been affected
  Future<int> updateToolStatus(Status toolStatus, int toolId);

  /// return how many rows have been affected
  Future<int> updateToolRate(int toolRate, int toolId);

  /// return how many rows have been affected
  Future<int> updateToolCategory(Category toolCategory, int toolId);

  /// return how many rows have been affected
  Future<int> updateToolImagePath(String toolImagePath, int toolId);

  // selects
  Future<Tool?> getToolByIdOrNull(int toolId);
  Future<String?> getToolNameByIdOrNull(int toolId);
  Future<Status?> getToolStatusByIdOrNull(int toolId);
  Future<int?> getToolRateByIdOrNull(int toolId);
  Future<Category?> getToolCategoryByIdOrNull(int toolId);
  Future<String?> getToolImagePathByIdOrNull(int toolId);
  Future<List<Tool>?> getToolsByStatusOrNull(Status status);
  Future<List<Tool>?> getAllToolsOrNull();

  // deletes
  Future<int> deleteToolById(int toolId);
  Future<int> deleteAllTools();
}
