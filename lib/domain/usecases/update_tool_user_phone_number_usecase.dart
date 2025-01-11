import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/domain/repositories_interface/toolusers/toolusers_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class UpdateToolUserPhoneNumberUseCase implements UseCase<int?, UpdateToolUserPhoneNumberParams> {
  final ToolUsersRepo _toolUsersRepo;

  UpdateToolUserPhoneNumberUseCase({ToolUsersRepo? toolUsersRepo}) : _toolUsersRepo = toolUsersRepo ?? locator<ToolUsersRepoImp>();

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
