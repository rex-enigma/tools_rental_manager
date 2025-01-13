import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class GetToolUserFrontNationalIdImageUseCase
    implements UseCase<String?, ToolUserIdParam> {
  final ToolUsersRepo _toolUsersRepo;

  GetToolUserFrontNationalIdImageUseCase({ToolUsersRepo? toolUsersRepo})
      : _toolUsersRepo = toolUsersRepo ?? locator<ToolUsersRepoImp>();
  @override
  Future<String?> call(ToolUserIdParam p) {
    return _toolUsersRepo
        .getToolUserFrontNationalIdImagePathByIdOrNull(p.toolUserId);
  }
}
