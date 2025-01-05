import 'package:tools_rental_management/data/models/tool_model.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/status.dart';

abstract class ToolsRepo {
  Future<int> insertTool(ToolModel tool);

  // update and returns the updated value
  Future<ToolModel> updateTool(ToolModel tool);
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

  Future<List<ToolModel>> rentToolsToToolUser(List<ToolModel> tools, int toolUserId);
  Future<int> repossessToolsFromToolUser(List<ToolModel> tools);

  Future<ToolModel?> getToolByIdOrNull(int toolId);
  Future<String?> getToolNameByIdOrNull(int toolId);
  Future<Status?> getToolStatusByIdOrNull(int toolId);
  Future<int?> getToolRateByIdOrNull(int toolId);
  Future<Category?> getToolCategoryByIdOrNull(int toolId);
  Future<String?> getToolImagePathByIdOrNull(int toolId);
  Future<List<ToolModel>?> getToolsByStatusOrNull(Status status);
  Future<List<ToolModel>?> getAllToolsOrNull();

  Future<int> deleteToolById(int toolId);
  Future<int> deleteAllTools();
}
