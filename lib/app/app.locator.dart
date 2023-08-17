// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../data/data_sources/local/cameraphotos/cameraphotos_localcamera_datasource_imp.dart';
import '../data/data_sources/local/galleryimages/galleryimages_localgallery_datasource_imp.dart';
import '../data/data_sources/local/imagesdir/images_localdirectory_datasource_imp.dart';
import '../data/data_sources/local/toolarticles/toolarticles_localsharedpreferences_datasource.dart';
import '../data/data_sources/local/tools/tools_localsqlite_datasource_imp.dart';
import '../data/data_sources/local/toolusers/toolusers_localsqlite_datasource_imp.dart';
import '../data/data_sources/remote/toolarticles/toolarticles_remotewikipedia_datasource_imp.dart';
import '../data/repositories/images/images_repo_imp.dart';
import '../data/repositories/toolarticles/toolarticles_repo_imp.dart';
import '../data/repositories/tools/tools_repo_imp.dart';
import '../data/repositories/toolusers/toolusers_repo_imp.dart';
import '../ui/views/settings/settings_viewmodel.dart';
import '../ui/views/tool_users/tool_users_viewmodel.dart';
import '../ui/views/tools/tools_viewmodel.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => CameraPhotosLocalCameraDataSource());
  locator.registerLazySingleton(() => GalleryImagesLocalGalleryDataSource());
  locator.registerLazySingleton(() => ImagesLocalDirectoryDataSource());
  locator.registerLazySingleton(() => ToolUsersLocalSqliteDbDataSource());
  locator.registerLazySingleton(() => ToolsLocalSqliteDbDataSource());
  locator.registerLazySingleton(() => ToolArticlesRemoteWikipediaDataSource());
  locator.registerLazySingleton(
      () => ToolArticleLocalSharedPreferencesDataSource());
  locator.registerLazySingleton(() => ToolArticlesRepoImp());
  locator.registerLazySingleton(() => ToolsRepoImp());
  locator.registerLazySingleton(() => ToolUsersRepoImp());
  locator.registerLazySingleton(() => ImagesRepoImp());
  locator.registerLazySingleton(() => ToolsViewModel());
  locator.registerLazySingleton(() => ToolUsersViewModel());
  locator.registerLazySingleton(() => SettingsViewModel());
}
