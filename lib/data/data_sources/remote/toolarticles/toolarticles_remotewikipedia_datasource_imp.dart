import 'dart:convert';

import 'package:tools_rental_management/data/data_models/toolarticle.dart';
import 'package:tools_rental_management/data/data_sources/remote/toolarticles/toolarticles_remote_datasource_interface.dart';
import 'package:tools_rental_management/errors/exceptions.dart';
import 'package:http/http.dart' as http;

// this class will fetch data about a workshop tool from wikipedia.
class Wikipedia {
  /// might throw [ArticleNotFoundException] if the article is not found with the given [title],
  /// might throw other exceptions like: [FailedToFetchToolArticleData] exception when the status code is not 200
  Future<ToolArticle> fetchToolArticle(String title) async {
    final String url =
        "https://en.wikipedia.org/w/api.php?action=query&titles=$title&prop=pageimages|description|extracts&explaintext&exsectionformat=plain&exintro=1&pithumbsize=300&format=json";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonString = response.body;
        // jsonDecode will return a map containing query data
        // the query data will contain the article data that we need
        final dataMap = jsonDecode(jsonString) as Map<String, dynamic>;
        // get the pages of the given {title}, since we only query for a single article(through the title param)
        // [mapPages] will only contain a single key/value pair which is our article data.
        final mapPages = dataMap['query']['pages'] as Map<String, dynamic>;
        // when the given [title] doesn't correspond to any wikipedia article, -1 will be used to indicate that
        // so we check and handle it.
        if (mapPages.containsKey('-1')) throw ArticleNotFoundException();
        // get the article data.
        final articleData = mapPages.entries.first.value;

        return ToolArticle(
          title: articleData['title'],
          source: 'wikipedia',
          description: (articleData['description'] as String).isEmpty ? 'tool' : articleData['description'],
          excerpt: articleData['extract'],
          urlImagePath: articleData['thumbnail']?['source'],
          fetchedAt: DateTime.now(),
        );
      }
      throw FailedToFetchToolArticleData(message: 'Failed to fetch article data, http statusCode: ${response.statusCode}');
    } catch (e) {
      rethrow;
    }
  }
}

// data source class: type of data + type of source + DataSource (tools + localSqlDb + DataSource);
// the data source class should only work with one source of data ( Wikipedia)
class ToolArticlesRemoteWikipediaDataSource implements ToolArticlesRemoteDataSource {
  final Wikipedia _wikipedia = Wikipedia();

  @override
  Future<ToolArticle> fetchToolArticle(String title) {
    try {
      return _wikipedia.fetchToolArticle(title);
    } catch (e) {
      rethrow;
    }
  }
}
