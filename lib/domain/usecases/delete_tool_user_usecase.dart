import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class DeleteToolUserUseCase implements UseCase<int, ToolUserIdParam> {
  final ToolUsersRepo _toolUsersRepo;

  DeleteToolUserUseCase({required ToolUsersRepo toolUsersRepo}) : _toolUsersRepo = toolUsersRepo;

  @override
  Future<int> call(ToolUserIdParam p) {
    return _toolUsersRepo.deleteToolUserById(p.toolUserId);
  }
}
