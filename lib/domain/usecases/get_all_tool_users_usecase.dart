import 'package:tools_rental_management/domain/entities/tooluser_entity.dart';
import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class GetAllToolUsersUseCase implements UseCase<List<ToolUserEntity>?, NoParams> {
  final ToolUsersRepo _toolUsersRepo;

  GetAllToolUsersUseCase({required ToolUsersRepo toolUsersRepo}) : _toolUsersRepo = toolUsersRepo;

  @override
  Future<List<ToolUserEntity>?> call(NoParams p) {
    return _toolUsersRepo.getAllToolUsersOrNull();
  }
}
