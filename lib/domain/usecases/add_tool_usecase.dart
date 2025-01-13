import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/tools/tools_repo_imp.dart';
import 'package:tools_rental_management/domain/entities/tool_entity.dart';
import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class AddToolUseCase implements UseCase<int, AddToolParam> {
  final ToolsRepo _toolsRepo;

  AddToolUseCase({ToolsRepo? toolsRepo})
      : _toolsRepo = toolsRepo ?? locator<ToolsRepoImp>();

  @override
  Future<int> call(AddToolParam p) {
    return _toolsRepo.insertTool(p.toolEntity);
  }
}

class AddToolParam {
  final ToolEntity toolEntity;

  AddToolParam({required this.toolEntity});
}
