import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class UpdateToolUserAvatarImageUseCase
    implements UseCase<String?, UpdateToolUserAvatarImageParams> {
  final ToolUsersRepo _toolUsersRepo;

  UpdateToolUserAvatarImageUseCase({ToolUsersRepo? toolUsersRepo})
      : _toolUsersRepo = toolUsersRepo ?? locator<ToolUsersRepoImp>();

  @override
  Future<String?> call(UpdateToolUserAvatarImageParams p) {
    return _toolUsersRepo.updateToolUserAvatarImagePath(
        p.toolUserAvatarImagePath, p.toolUserId);
  }
}

class UpdateToolUserAvatarImageParams {
  final String toolUserAvatarImagePath;
  final int toolUserId;

  UpdateToolUserAvatarImageParams(
      {required this.toolUserAvatarImagePath, required this.toolUserId});
}
