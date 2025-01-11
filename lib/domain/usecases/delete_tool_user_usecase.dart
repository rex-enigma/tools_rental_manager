import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class DeleteToolUserUseCase implements UseCase<int, ToolUserIdParam> {
  final ToolUsersRepo _toolUsersRepo;

  DeleteToolUserUseCase({ToolUsersRepo? toolUsersRepo}) : _toolUsersRepo = toolUsersRepo ?? locator<ToolUsersRepoImp>();

  @override
  Future<int> call(ToolUserIdParam p) {
    return _toolUsersRepo.deleteToolUserById(p.toolUserId);
  }
}
