import 'package:tools_rental_management/data/models/toolarticle_model.dart';

abstract class ToolArticlesLocalDataSource {
  Future<ToolArticle?> getToolArticle({required String key});
  Future<bool> setToolArticle({required String key, required ToolArticle toolArticle});
}
