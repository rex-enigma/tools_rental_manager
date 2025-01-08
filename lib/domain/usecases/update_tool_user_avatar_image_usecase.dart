import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class UpdateToolUserAvatarImageUseCase implements UseCase<String?, UpdateToolUserAvatarImageParams> {
  final ToolUsersRepo _toolUsersRepo;

  UpdateToolUserAvatarImageUseCase({required ToolUsersRepo toolUsersRepo}) : _toolUsersRepo = toolUsersRepo;

  @override
  Future<String?> call(UpdateToolUserAvatarImageParams p) {
    return _toolUsersRepo.updateToolUserAvatarImagePath(p.toolUserAvatarImagePath, p.toolUserId);
  }
}

class UpdateToolUserAvatarImageParams {
  final String toolUserAvatarImagePath;
  final int toolUserId;

  UpdateToolUserAvatarImageParams({required this.toolUserAvatarImagePath, required this.toolUserId});
}
