import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/tools/tools_repo_imp.dart';
import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';
import 'package:tools_rental_management/enums/status.dart';

class UpdateToolStatusUseCase implements UseCase<Status?, UpdateToolStatusParams> {
  final ToolsRepo _toolsRepo;

  UpdateToolStatusUseCase({ToolsRepo? toolsRepo}) : _toolsRepo = toolsRepo ?? locator<ToolsRepoImp>();

  @override
  Future<Status?> call(UpdateToolStatusParams p) {
    return _toolsRepo.updateToolStatus(p.toolStatus, p.toolId);
  }
}

class UpdateToolStatusParams {
  final Status toolStatus;
  final int toolId;

  UpdateToolStatusParams({required this.toolStatus, required this.toolId});
}
