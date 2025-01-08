import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class GetToolUserFrontNationalIdImageUseCase implements UseCase<String?, ToolUserIdParam> {
  final ToolUsersRepo _toolUsersRepo;

  GetToolUserFrontNationalIdImageUseCase({required ToolUsersRepo toolUsersRepo}) : _toolUsersRepo = toolUsersRepo;
  @override
  Future<String?> call(ToolUserIdParam p) {
    return _toolUsersRepo.getToolUserFrontNationalIdImagePathByIdOrNull(p.toolUserId);
  }
}
