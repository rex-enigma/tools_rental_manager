// import 'package:tools_rental_management/domain/entities/tool_entity.dart';
// import 'package:tools_rental_management/domain/repositories_interface/tools/tools_repo_interface.dart';
// import 'package:tools_rental_management/domain/usecases/usecase.dart';

// class AddToolUseCase implements UseCase<int, AddToolParam> {
//   final ToolsRepo _toolsRepo;

//   AddToolUseCase({required ToolsRepo toolsRepo}) : _toolsRepo = toolsRepo;

//   @override
//   Future<int> call(AddToolParam p) {
//     return _toolsRepo.insertTool(p.toolEntity);
//   }
// }

// class AddToolParam {
//   final ToolEntity toolEntity;

//   AddToolParam({required this.toolEntity});
// }
