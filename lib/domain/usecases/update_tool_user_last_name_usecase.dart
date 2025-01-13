import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class UpdateToolUserLastNameUseCase
    implements UseCase<String?, UpdateToolUserLastNameParams> {
  final ToolUsersRepo _toolUsersRepo;

  UpdateToolUserLastNameUseCase({ToolUsersRepo? toolUsersRepo})
      : _toolUsersRepo = toolUsersRepo ?? locator<ToolUsersRepoImp>();
  @override
  Future<String?> call(UpdateToolUserLastNameParams p) {
    return _toolUsersRepo.updateToolUserLastName(
        p.toolUserLastName, p.toolUserId);
  }
}

class UpdateToolUserLastNameParams {
  final String toolUserLastName;
  final int toolUserId;

  UpdateToolUserLastNameParams(
      {required this.toolUserLastName, required this.toolUserId});
}
