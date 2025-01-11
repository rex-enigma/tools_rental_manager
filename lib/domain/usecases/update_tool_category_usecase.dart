import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';
import 'package:tools_rental_management/enums/category.dart';

class UpdateToolCategoryUseCase implements UseCase<Category?, UpdateToolCategoryParams> {
  final ToolsRepo _toolsRepo;

  UpdateToolCategoryUseCase({required ToolsRepo toolsRepo}) : _toolsRepo = toolsRepo;

  @override
  Future<Category?> call(UpdateToolCategoryParams p) {
    return _toolsRepo.updateToolCategory(p.toolCategory, p.toolId);
  }
}

class UpdateToolCategoryParams {
  final Category toolCategory;
  final int toolId;

  UpdateToolCategoryParams({required this.toolCategory, required this.toolId});
}
