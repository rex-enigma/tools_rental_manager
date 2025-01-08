import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class DeleteToolUseCase implements UseCase<int, DeleteToolParam> {
  final ToolsRepo _toolsRepo;

  DeleteToolUseCase({required ToolsRepo toolsRepo}) : _toolsRepo = toolsRepo;

  @override
  Future<int> call(DeleteToolParam p) {
    return _toolsRepo.deleteToolById(p.toolId);
  }
}

class DeleteToolParam {
  final int toolId;

  DeleteToolParam({required this.toolId});
}
