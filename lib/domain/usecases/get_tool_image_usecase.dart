import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class GetToolImageUseCase implements UseCase<String?, ToolIdParam> {
  final ToolsRepo _toolsRepo;

  GetToolImageUseCase({required ToolsRepo toolsRepo}) : _toolsRepo = toolsRepo;

  @override
  Future<String?> call(ToolIdParam p) {
    return _toolsRepo.getToolImagePathByIdOrNull(p.toolId);
  }
}
