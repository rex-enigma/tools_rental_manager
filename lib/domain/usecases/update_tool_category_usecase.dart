import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/tools/tools_repo_imp.dart';
import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';
import 'package:tools_rental_management/enums/category.dart';

class UpdateToolCategoryUseCase
    implements UseCase<Category?, UpdateToolCategoryParams> {
  final ToolsRepo _toolsRepo;

  UpdateToolCategoryUseCase({ToolsRepo? toolsRepo})
      : _toolsRepo = toolsRepo ?? locator<ToolsRepoImp>();

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
