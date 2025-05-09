import 'package:tools_rental_management/data/models/toolarticle_model.dart';
import 'package:tools_rental_management/data/data_sources/local/toolarticles/toolarticles_local_datasource_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToolArticleLocalSharedPreferencesDataSource
    implements ToolArticlesLocalDataSource {
  late final Future<SharedPreferences> _prefs;

  ToolArticleLocalSharedPreferencesDataSource() {
    _initAsyncField();
  }

  Future<void> _initAsyncField() async {
    _prefs = SharedPreferences.getInstance();
  }

  // if the future completes with null it means that there isn't any value for the given key.
  @override
  Future<ToolArticleModel?> getToolArticle({required String key}) async {
    SharedPreferences pref = await _prefs;
    // the toolArticleJsonString is a json string that represents a [ToolArticle] in json format.
    String? toolArticleJsonString = pref.getString(key);
    if (toolArticleJsonString == null) return null;
    return ToolArticleModel.fromJson(jsonString: toolArticleJsonString);
  }

  @override
  Future<bool> setToolArticle(
      {required String key, required ToolArticleModel toolArticle}) async {
    SharedPreferences pref = await _prefs;
    return pref.setString(key, toolArticle.toJson());
  }
}
