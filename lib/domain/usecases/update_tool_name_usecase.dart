import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/tools/tools_repo_imp.dart';
import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class UpdateToolNameUseCase implements UseCase<String?, UpdateToolNameParams> {
  final ToolsRepo _toolsRepo;

  UpdateToolNameUseCase({ToolsRepo? toolsRepo}) : _toolsRepo = toolsRepo ?? locator<ToolsRepoImp>();
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
