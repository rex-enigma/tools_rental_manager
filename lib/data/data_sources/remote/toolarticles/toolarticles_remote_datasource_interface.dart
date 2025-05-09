import 'package:tools_rental_management/data/models/toolarticle_model.dart';

// should be implemented by any concrete class that needs to fetch any workshop tool information remotely.
abstract class ToolArticlesRemoteDataSource {
  Future<ToolArticleModel?> fetchToolArticle(String title);
}
