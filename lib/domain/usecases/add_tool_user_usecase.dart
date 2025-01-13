import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/domain/entities/tooluser_entity.dart';
import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class AddToolUserUseCase implements UseCase<int, AddToolUserParam> {
  final ToolUsersRepo _toolUsersRepo;

  AddToolUserUseCase({ToolUsersRepo? toolUsersRepo})
      : _toolUsersRepo = toolUsersRepo ?? locator<ToolUsersRepoImp>();

  @override
  Future<int> call(AddToolUserParam p) {
    return _toolUsersRepo.insertToolUser(p.toolUserEntity);
  }
}

class AddToolUserParam {
  final ToolUserEntity toolUserEntity;

  AddToolUserParam({required this.toolUserEntity});
}
