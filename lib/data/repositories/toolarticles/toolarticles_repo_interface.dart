import 'package:tools_rental_management/data/models/toolarticle_model.dart';

abstract class ToolArticleRepo {
  Future<ToolArticleModel?> fetchToolArticle(String title);
}
