import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class UpdateToolUserPhoneNumberUseCase implements UseCase<int?, UpdateToolUserPhoneNumberParams> {
  final ToolUsersRepo _toolUsersRepo;

  UpdateToolUserPhoneNumberUseCase({required ToolUsersRepo toolUsersRepo}) : _toolUsersRepo = toolUsersRepo;

  @override
  Future<int?> call(UpdateToolUserPhoneNumberParams p) {
    return _toolUsersRepo.updateToolUserPhoneNUmber(p.toolUserPhoneNumber, p.toolUserId);
  }
}

class UpdateToolUserPhoneNumberParams {
  final int toolUserPhoneNumber;
  final int toolUserId;

  UpdateToolUserPhoneNumberParams({required this.toolUserPhoneNumber, required this.toolUserId});
}
