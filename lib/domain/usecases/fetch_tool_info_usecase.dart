import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/toolarticles/toolarticles_repo_imp.dart';
import 'package:tools_rental_management/domain/entities/toolarticle_entity.dart';
import 'package:tools_rental_management/domain/repositories_interface/toolarticles/toolarticles_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class FetchToolInfoUseCase implements UseCase<ToolArticleEntity?, TitleParam> {
  final ToolArticleRepo _toolArticleRepo;

  FetchToolInfoUseCase({ToolArticleRepo? toolArticleRepo})
      : _toolArticleRepo = toolArticleRepo ?? locator<ToolArticlesRepoImp>();

  @override
  Future<ToolArticleEntity?> call(TitleParam p) {
    return _toolArticleRepo.fetchToolArticle(p.title);
  }
}

class TitleParam {
  final String title;

  TitleParam({required this.title});
}
