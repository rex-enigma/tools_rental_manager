import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class UpdateToolNameUseCase implements UseCase<String?, UpdateToolNameParams> {
  final ToolsRepo _toolsRepo;

  UpdateToolNameUseCase({required ToolsRepo toolsRepo}) : _toolsRepo = toolsRepo;
  @override
  Future<String?> call(UpdateToolNameParams p) {
    return _toolsRepo.updateToolName(p.toolName, p.toolId);
  }
}

class UpdateToolNameParams {
  final String toolName;
  final int toolId;

  UpdateToolNameParams({required this.toolName, required this.toolId});
}
