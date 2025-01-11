import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class UpdateToolUserBackNationalIdImageUseCase implements UseCase<String?, UpdateToolUserBackNationalIdImageParams> {
  final ToolUsersRepo _toolUsersRepo;

  UpdateToolUserBackNationalIdImageUseCase({ToolUsersRepo? toolUsersRepo}) : _toolUsersRepo = toolUsersRepo ?? locator<ToolUsersRepoImp>();

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
