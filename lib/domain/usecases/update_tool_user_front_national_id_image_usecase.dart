import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class UpdateToolUserFrontNationalIdImageUseCase implements UseCase<String?, UpdateToolUserFrontNationalIdImageParams> {
  final ToolUsersRepo _toolUsersRepo;

  UpdateToolUserFrontNationalIdImageUseCase({ToolUsersRepo? toolUsersRepo}) : _toolUsersRepo = toolUsersRepo ?? locator<ToolUsersRepoImp>();

  @override
  Future<String?> call(UpdateToolUserFrontNationalIdImageParams p) {
    return _toolUsersRepo.updateToolUserFrontNationalIdImagePath(p.toolUserFrontNationalIdImagePath, p.toolUserId);
  }
}

class UpdateToolUserFrontNationalIdImageParams {
  final String toolUserFrontNationalIdImagePath;
  final int toolUserId;

  UpdateToolUserFrontNationalIdImageParams({required this.toolUserFrontNationalIdImagePath, required this.toolUserId});
}
