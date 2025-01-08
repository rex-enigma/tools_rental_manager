import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class UpdateToolImageUseCase implements UseCase<String?, UpdateToolImageParams> {
  final ToolsRepo _toolsRepo;

  UpdateToolImageUseCase({required ToolsRepo toolsRepo}) : _toolsRepo = toolsRepo;

  @override
  Future<String?> call(UpdateToolImageParams p) {
    return _toolsRepo.updateToolImagePath(p.toolImagePath, p.toolId);
  }
}

class UpdateToolImageParams {
  final String toolImagePath;
  final int toolId;

  UpdateToolImageParams({required this.toolImagePath, required this.toolId});
}
