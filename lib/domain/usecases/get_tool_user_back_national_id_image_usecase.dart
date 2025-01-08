import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class GetToolUserBackNationalIdImageUseCase implements UseCase<String?, ToolUserIdParam> {
  final ToolUsersRepo _toolUsersRepo;

  GetToolUserBackNationalIdImageUseCase({required ToolUsersRepo toolUsersRepo}) : _toolUsersRepo = toolUsersRepo;
  @override
  Future<String?> call(ToolUserIdParam p) {
    return _toolUsersRepo.getToolUserBackNationalIdImagePathByIdOrNull(p.toolUserId);
  }
}
