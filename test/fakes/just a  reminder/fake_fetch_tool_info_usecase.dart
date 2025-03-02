import 'package:flutter_test/flutter_test.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/domain/entities/toolarticle_entity.dart';
import 'package:tools_rental_management/domain/usecases/fetch_tool_info_usecase.dart';

// in dart you can use a normal concrete class as interface or abstract class.
// so when for example in any viewModel if you have used a concrete [FetchToolInfoUseCase] class as a dependency,
// you can still create a fake of it when testing that viewModel.

// eg

class ViewModel extends BaseViewModel {
  // concrete class
  final FetchToolInfoUseCase fetchToolInfoUseCase;

  ViewModel({FetchToolInfoUseCase? fetchToolInfoUseCase})
      : fetchToolInfoUseCase = fetchToolInfoUseCase ?? FetchToolInfoUseCase();
}

class FakeFetchToolInfoUseCase implements FetchToolInfoUseCase {
  @override
  Future<ToolArticleEntity?> call(TitleParam p) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

void main() {
  late ViewModel viewModel;
  late FakeFetchToolInfoUseCase fakeFetchToolInfoUseCase;

  setUp(() {
    fakeFetchToolInfoUseCase = FakeFetchToolInfoUseCase();
    viewModel = ViewModel(fetchToolInfoUseCase: fakeFetchToolInfoUseCase);
  });

  // test(), expectation etc
}
