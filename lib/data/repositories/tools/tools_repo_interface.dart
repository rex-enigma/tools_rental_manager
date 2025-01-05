import 'package:tools_rental_management/data/models/tool.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/status.dart';

abstract class ToolsRepo {
  Future<int> insertTool(Tool tool);

  // update and returns the updated value
  Future<Tool> updateTool(Tool tool);
  // update and returns the updated value
  Future<String?> updateToolName(String toolName, int toolId);
  // update and returns the updated value
  Future<Status?> updateToolStatus(Status toolStatus, int toolId);
  // update and returns the updated value
  Future<int?> updateToolRate(int toolRate, int toolId);
  // update and returns the updated value
  Future<Category?> updateToolCategory(Category toolCategory, int toolId);
  // update and returns the updated value
  Future<String?> updateToolImagePath(String toolImagePath, int toolId);

  Future<List<Tool>> rentToolsToToolUser(List<Tool> tools, int toolUserId);
  Future<int> repossessToolsFromToolUser(List<Tool> tools);

  Future<Tool?> getToolByIdOrNull(int toolId);
  Future<String?> getToolNameByIdOrNull(int toolId);
  Future<Status?> getToolStatusByIdOrNull(int toolId);
  Future<int?> getToolRateByIdOrNull(int toolId);
  Future<Category?> getToolCategoryByIdOrNull(int toolId);
  Future<String?> getToolImagePathByIdOrNull(int toolId);
  Future<List<Tool>?> getToolsByStatusOrNull(Status status);
  Future<List<Tool>?> getAllToolsOrNull();

  Future<int> deleteToolById(int toolId);
  Future<int> deleteAllTools();
}
