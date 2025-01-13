import 'package:tools_rental_management/domain/entities/tool_entity.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/status.dart';

abstract class ToolsRepo {
  Future<int> insertTool(ToolEntity tool);

  // update and returns the updated value
  Future<ToolEntity> updateTool(ToolEntity tool);
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

  Future<List<ToolEntity>> rentOutToolsToToolUser(
      List<ToolEntity> tools, int toolUserId);
  Future<int> repossessToolsFromToolUser(List<ToolEntity> tools);

  Future<ToolEntity?> getToolByIdOrNull(int toolId);
  Future<String?> getToolNameByIdOrNull(int toolId);
  Future<Status?> getToolStatusByIdOrNull(int toolId);
  Future<int?> getToolRateByIdOrNull(int toolId);
  Future<Category?> getToolCategoryByIdOrNull(int toolId);
  Future<String?> getToolImagePathByIdOrNull(int toolId);
  Future<List<ToolEntity>?> getToolsByStatusOrNull(Status status);
  Future<List<ToolEntity>?> getAllToolsOrNull();

  Future<int> deleteToolById(int toolId);
  Future<int> deleteAllTools();
}
