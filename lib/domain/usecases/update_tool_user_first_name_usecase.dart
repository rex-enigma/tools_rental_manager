import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class UpdateToolUserFirstNameUseCase implements UseCase<String?, UpdateToolUserFirstNameParams> {
  final ToolUsersRepo _toolUsersRepo;

  UpdateToolUserFirstNameUseCase({ToolUsersRepo? toolUsersRepo}) : _toolUsersRepo = toolUsersRepo ?? locator<ToolUsersRepoImp>();
  @override
  Future<String?> call(UpdateToolUserFirstNameParams p) {
    return _toolUsersRepo.updateToolUserFirstName(p.toolUserFirstName, p.toolUserId);
  }
}

class UpdateToolUserFirstNameParams {
  final String toolUserFirstName;
  final int toolUserId;

  UpdateToolUserFirstNameParams({required this.toolUserFirstName, required this.toolUserId});
}
