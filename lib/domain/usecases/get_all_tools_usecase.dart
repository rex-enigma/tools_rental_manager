import 'package:tools_rental_management/domain/entities/tool_entity.dart';
import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class GetAllToolsUseCase implements UseCase<List<ToolEntity>?, NoParams> {
  final ToolsRepo _toolsRepo;

  GetAllToolsUseCase({required ToolsRepo toolsRepo}) : _toolsRepo = toolsRepo;

  @override
  Future<List<ToolEntity>?> call(NoParams p) {
    return _toolsRepo.getAllToolsOrNull();
  }
}
