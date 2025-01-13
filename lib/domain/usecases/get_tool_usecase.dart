import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/tools/tools_repo_imp.dart';
import 'package:tools_rental_management/domain/entities/tool_entity.dart';
import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class GetToolUseCase implements UseCase<ToolEntity?, ToolIdParam> {
  final ToolsRepo _toolsRepo;

  GetToolUseCase({ToolsRepo? toolsRepo})
      : _toolsRepo = toolsRepo ?? locator<ToolsRepoImp>();

  @override
  Future<ToolEntity?> call(ToolIdParam p) {
    return _toolsRepo.getToolByIdOrNull(p.toolId);
  }
}
