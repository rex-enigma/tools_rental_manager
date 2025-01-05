import 'package:tools_rental_management/data/models/toolarticle.dart';

// should be implemented by any concrete class that needs to fetch any workshop tool information remotely.
abstract class ToolArticlesRemoteDataSource {
  Future<ToolArticle?> fetchToolArticle(String title);
}
