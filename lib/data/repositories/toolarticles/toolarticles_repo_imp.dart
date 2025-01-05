import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/models/toolarticle.dart';
import 'package:tools_rental_management/data/data_sources/local/toolarticles/toolarticles_local_datasource_interface.dart';
import 'package:tools_rental_management/data/data_sources/local/toolarticles/toolarticles_localsharedpreferences_datasource.dart';
import 'package:tools_rental_management/data/data_sources/remote/toolarticles/toolarticles_remote_datasource_interface.dart';
import 'package:tools_rental_management/data/data_sources/remote/toolarticles/toolarticles_remotewikipedia_datasource_imp.dart';
import 'toolarticles_repo_interface.dart';

class ToolArticlesRepoImp implements ToolArticleRepo {
  // will be used to retrieve workshop tool data from remote data source.
  late ToolArticlesRemoteDataSource _toolArticlesRemoteDataSource;
  // will be used to cache tool article data to local data source.
  late ToolArticlesLocalDataSource _toolArticlesLocalDataSource;

  ToolArticlesRepoImp({ToolArticlesRemoteDataSource? toolArticlesRemoteDataSource, ToolArticlesLocalDataSource? toolArticlesLocalDataSource}) {
    _toolArticlesRemoteDataSource = toolArticlesRemoteDataSource ?? locator<ToolArticlesRemoteWikipediaDataSource>();
    _toolArticlesLocalDataSource = toolArticlesLocalDataSource ?? locator<ToolArticleLocalSharedPreferencesDataSource>();
  }

  @override
  Future<ToolArticle?> fetchToolArticle(String title) async {
    // first check if we have [ToolArticle] for the given title cached locally.
    ToolArticle? toolArticle = await _toolArticlesLocalDataSource.getToolArticle(key: title);

    try {
      if (toolArticle == null) {
        // we fetch tool article data remotely.
        ToolArticle? remoteToolArticle = await _toolArticlesRemoteDataSource.fetchToolArticle(title);
        if (remoteToolArticle != null) {
          // then we cache it.
          await _toolArticlesLocalDataSource.setToolArticle(key: remoteToolArticle.title, toolArticle: remoteToolArticle);
          return remoteToolArticle;
        } else {
          return null;
        }
      } else {
        const int cacheExpirationTimeMilli = 300000; // 5 minutes
        // how long(in millisecond) a tool article for the given title has been cached.
        final toolArticleCachedDuration = DateTime.now().millisecondsSinceEpoch - toolArticle.fetchedAt.millisecondsSinceEpoch;

        //if the tool article for the given title has been cached for less than or equal to 5 minute, just
        // return it.
        if (toolArticleCachedDuration <= cacheExpirationTimeMilli) {
          return toolArticle;
        } else {
          ToolArticle? remoteToolArticle = await _toolArticlesRemoteDataSource.fetchToolArticle(title);
          if (remoteToolArticle != null) {
            await _toolArticlesLocalDataSource.setToolArticle(key: remoteToolArticle.title, toolArticle: remoteToolArticle);
            return remoteToolArticle;
          } else {
            return null;
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
