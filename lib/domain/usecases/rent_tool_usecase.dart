import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/tools/tools_repo_imp.dart';
import 'package:tools_rental_management/domain/entities/tool_entity.dart';
import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';
import 'package:tools_rental_management/enums/status.dart';

class RentToolUseCase implements UseCase<List<ToolEntity>, RentToolParams> {
  final ToolsRepo _toolsRepo;

  RentToolUseCase({ToolsRepo? toolsRepo}) : _toolsRepo = toolsRepo ?? locator<ToolsRepoImp>();

  @override
  Future<List<ToolEntity>> call(RentToolParams p) async {
    final List<ToolEntity> associatedTools = p.idleTools.map((idleTool) {
      return idleTool.copyWith(
        toolUserId: p.toolUserId,
        // every time we associate a tool with a [ToolUser], we increment the rent count of the tool, which
        // will keep track of how many times the tool has been rented out over its life time.
        rentCount: idleTool.rentCount + 1,
        // we also have to update status to 'being used' since the tool is now
        // being used by a [ToolUser] of the given toolUserId.
        status: Status.beingUsed,
      );
    }).toList();

    List<ToolEntity> updatedTools = [];

    // update individual tools in the database one by one
    for (var associatedTool in associatedTools) {
      ToolEntity updatedTool = await _toolsRepo.updateTool(associatedTool);
      updatedTools.add(updatedTool);
    }

    return updatedTools;
  }
}

class RentToolParams {
  final List<ToolEntity> idleTools;
  final int toolUserId;

  RentToolParams({required this.idleTools, required this.toolUserId});
}
