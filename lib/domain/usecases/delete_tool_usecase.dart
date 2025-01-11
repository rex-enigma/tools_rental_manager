import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/tools/tools_repo_imp.dart';
import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class DeleteToolUseCase implements UseCase<int, DeleteToolParam> {
  final ToolsRepo _toolsRepo;

  DeleteToolUseCase({ToolsRepo? toolsRepo}) : _toolsRepo = toolsRepo ?? locator<ToolsRepoImp>();

  @override
  Future<int> call(DeleteToolParam p) {
    return _toolsRepo.deleteToolById(p.toolId);
  }
}

class DeleteToolParam {
  final int toolId;

  DeleteToolParam({required this.toolId});
}
