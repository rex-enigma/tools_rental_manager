import 'package:tools_rental_management/data/models/toolarticle_model.dart';

abstract class ToolArticleRepo {
  Future<ToolArticle?> fetchToolArticle(String title);
}
