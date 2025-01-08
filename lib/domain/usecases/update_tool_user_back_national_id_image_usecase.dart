import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class UpdateToolUserBackNationalIdImageUseCase implements UseCase<String?, UpdateToolUserBackNationalIdImageParams> {
  final ToolUsersRepo _toolUsersRepo;

  UpdateToolUserBackNationalIdImageUseCase({required ToolUsersRepo toolUsersRepo}) : _toolUsersRepo = toolUsersRepo;

  @override
  Future<String?> call(UpdateToolUserBackNationalIdImageParams p) {
    return _toolUsersRepo.updateToolUserBackNationalIdImagePath(p.toolUserBackNationalIdImagePath, p.toolUserId);
  }
}

class UpdateToolUserBackNationalIdImageParams {
  final String toolUserBackNationalIdImagePath;
  final int toolUserId;

  UpdateToolUserBackNationalIdImageParams({required this.toolUserBackNationalIdImagePath, required this.toolUserId});
}
