import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class UpdateToolRateUseCase implements UseCase<int?, UpdateToolRateParams> {
  final ToolsRepo _toolsRepo;

  UpdateToolRateUseCase({required ToolsRepo toolsRepo}) : _toolsRepo = toolsRepo;

  @override
  Future<int?> call(UpdateToolRateParams p) {
    return _toolsRepo.updateToolRate(p.toolRate, p.toolId);
  }
}

class UpdateToolRateParams {
  final int toolRate;
  final int toolId;

  UpdateToolRateParams({required this.toolRate, required this.toolId});
}
