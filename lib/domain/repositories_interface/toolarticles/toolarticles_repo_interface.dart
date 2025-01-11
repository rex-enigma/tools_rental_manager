import 'package:tools_rental_management/domain/entities/toolarticle_entity.dart';

abstract class ToolArticleRepo {
  Future<ToolArticleEntity?> fetchToolArticle(String title);
}
