import 'package:tools_rental_management/data/data_models/toolarticle.dart';

abstract class ToolArticleRepo {
  Future<ToolArticle?> fetchToolArticle(String title);
}
