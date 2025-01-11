import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/tools/tools_repo_imp.dart';
import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class GetToolImageUseCase implements UseCase<String?, ToolIdParam> {
  final ToolsRepo _toolsRepo;

  GetToolImageUseCase({ToolsRepo? toolsRepo}) : _toolsRepo = toolsRepo ?? locator<ToolsRepoImp>();

  @override
  Future<String?> call(ToolIdParam p) {
    return _toolsRepo.getToolImagePathByIdOrNull(p.toolId);
  }
}
