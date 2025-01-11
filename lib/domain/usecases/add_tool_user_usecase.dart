import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/domain/entities/tooluser_entity.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class AddToolUserUseCase implements UseCase<int, AddToolUserParam> {
  final ToolUsersRepoImp _toolUsersRepoImp;

  AddToolUserUseCase({required ToolUsersRepoImp toolUsersRepoImp}) : _toolUsersRepoImp = toolUsersRepoImp;

  @override
  Future<int> call(AddToolUserParam p) {
    return _toolUsersRepoImp.insertToolUser(p.toolUserEntity);
  }
}

class AddToolUserParam {
  final ToolUserEntity toolUserEntity;

  AddToolUserParam({required this.toolUserEntity});
}
