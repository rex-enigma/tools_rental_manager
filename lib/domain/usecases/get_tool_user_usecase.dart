import 'package:tools_rental_management/domain/entities/tooluser_entity.dart';
import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class GetToolUserUseCase implements UseCase<ToolUserEntity?, ToolUserIdParam> {
  final ToolUsersRepo _toolUsersRepo;

  GetToolUserUseCase({required ToolUsersRepo toolUsersRepo}) : _toolUsersRepo = toolUsersRepo;

  @override
  Future<ToolUserEntity?> call(ToolUserIdParam p) {
    return _toolUsersRepo.getToolUserByIdOrNull(p.toolUserId);
  }
}
