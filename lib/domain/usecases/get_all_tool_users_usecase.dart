import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/domain/entities/tooluser_entity.dart';
import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class GetAllToolUsersUseCase implements UseCase<List<ToolUserEntity>?, NoParams> {
  final ToolUsersRepo _toolUsersRepo;

  GetAllToolUsersUseCase({ToolUsersRepo? toolUsersRepo}) : _toolUsersRepo = toolUsersRepo ?? locator<ToolUsersRepoImp>();

  @override
  Future<List<ToolUserEntity>?> call(NoParams p) {
    return _toolUsersRepo.getAllToolUsersOrNull();
  }
}
