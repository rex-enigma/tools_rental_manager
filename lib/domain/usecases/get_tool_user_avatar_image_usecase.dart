import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class GetToolUserAvatarImageUseCase implements UseCase<String?, ToolUserIdParam> {
  final ToolUsersRepo _toolUsersRepo;

  GetToolUserAvatarImageUseCase({required ToolUsersRepo toolUsersRepo}) : _toolUsersRepo = toolUsersRepo;

  @override
  Future<String?> call(ToolUserIdParam p) {
    return _toolUsersRepo.getToolUserAvatarImagePathByIdOrNull(p.toolUserId);
  }
}
