import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/tools/tools_repo_imp.dart';
import 'package:tools_rental_management/domain/entities/tool_entity.dart';
import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';
import 'package:tools_rental_management/enums/status.dart';

class RepossessToolUseCase implements UseCase<int, RepossessToolParam> {
  final ToolsRepo _toolsRepo;

  RepossessToolUseCase({ToolsRepo? toolsRepo})
      : _toolsRepo = toolsRepo ?? locator<ToolsRepoImp>();

  @override
  Future<int> call(RepossessToolParam p) async {
    final List<ToolEntity> repossessedTools = p.tools.map((tool) {
      return tool.copyWith(
        toolUserId: null,
        status: Status.idle,
      );
    }).toList();

    int numberOfToolsUpdated = 0;

    for (var repossessedTool in repossessedTools) {
      await _toolsRepo.updateTool(repossessedTool); // it should return an int
      numberOfToolsUpdated++;
    }
    return numberOfToolsUpdated;
  }
}

class RepossessToolParam {
  final List<ToolEntity> tools;

  RepossessToolParam({required this.tools});
}
