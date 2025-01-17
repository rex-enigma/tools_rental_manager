// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
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
import '../database/app_database.dart';
import '../domain/usecases/add_tool_usecase.dart';
import '../domain/usecases/add_tool_user_usecase.dart';
import '../domain/usecases/delete_tool_usecase.dart';
import '../domain/usecases/delete_tool_user_usecase.dart';
import '../domain/usecases/fetch_tool_info_usecase.dart';
import '../domain/usecases/get_all_tool_users_usecase.dart';
import '../domain/usecases/get_all_tools_usecase.dart';
import '../domain/usecases/get_tool_image_usecase.dart';
import '../domain/usecases/get_tool_usecase.dart';
import '../domain/usecases/get_tool_user_avatar_image_usecase.dart';
import '../domain/usecases/get_tool_user_back_national_id_image_usecase.dart';
import '../domain/usecases/get_tool_user_front_national_id_image_usecase.dart';
import '../domain/usecases/get_tool_user_usecase.dart';
import '../domain/usecases/pick_image_usecase.dart';
import '../domain/usecases/rent_out_tool_usecase.dart';
import '../domain/usecases/repossess_tool_usecase.dart';
import '../domain/usecases/update_tool_category_usecase.dart';
import '../domain/usecases/update_tool_image_usecase.dart';
import '../domain/usecases/update_tool_name_usecase.dart';
import '../domain/usecases/update_tool_rate_usecase.dart';
import '../domain/usecases/update_tool_status_usecase.dart';
import '../domain/usecases/update_tool_user_avatar_image_usecase.dart';
import '../domain/usecases/update_tool_user_back_national_id_image_usecase.dart';
import '../domain/usecases/update_tool_user_first_name_usecase.dart';
import '../domain/usecases/update_tool_user_front_national_id_image_usecase.dart';
import '../domain/usecases/update_tool_user_last_name_usecase.dart';
import '../domain/usecases/update_tool_user_phone_number_usecase.dart';
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
  locator.registerLazySingleton(() => SnackbarService());
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
  locator.registerLazySingleton(() => AddToolUseCase());
  locator.registerLazySingleton(() => AddToolUserUseCase());
  locator.registerLazySingleton(() => DeleteToolUseCase());
  locator.registerLazySingleton(() => DeleteToolUserUseCase());
  locator.registerLazySingleton(() => FetchToolInfoUseCase());
  locator.registerLazySingleton(() => GetAllToolUsersUseCase());
  locator.registerLazySingleton(() => GetAllToolsUseCase());
  locator.registerLazySingleton(() => GetToolImageUseCase());
  locator.registerLazySingleton(() => GetToolUseCase());
  locator.registerLazySingleton(() => GetToolUserAvatarImageUseCase());
  locator.registerLazySingleton(() => GetToolUserBackNationalIdImageUseCase());
  locator.registerLazySingleton(() => GetToolUserFrontNationalIdImageUseCase());
  locator.registerLazySingleton(() => GetToolUserUseCase());
  locator.registerLazySingleton(() => PickImageUseCase());
  locator.registerLazySingleton(() => RentOutToolUseCase());
  locator.registerLazySingleton(() => RepossessToolUseCase());
  locator.registerLazySingleton(() => UpdateToolCategoryUseCase());
  locator.registerLazySingleton(() => UpdateToolImageUseCase());
  locator.registerLazySingleton(() => UpdateToolNameUseCase());
  locator.registerLazySingleton(() => UpdateToolRateUseCase());
  locator.registerLazySingleton(() => UpdateToolStatusUseCase());
  locator.registerLazySingleton(() => UpdateToolUserAvatarImageUseCase());
  locator
      .registerLazySingleton(() => UpdateToolUserBackNationalIdImageUseCase());
  locator.registerLazySingleton(() => UpdateToolUserFirstNameUseCase());
  locator
      .registerLazySingleton(() => UpdateToolUserFrontNationalIdImageUseCase());
  locator.registerLazySingleton(() => UpdateToolUserLastNameUseCase());
  locator.registerLazySingleton(() => UpdateToolUserPhoneNumberUseCase());
  locator.registerLazySingleton(() => ToolsViewModel());
  locator.registerLazySingleton(() => ToolUsersViewModel());
  locator.registerLazySingleton(() => SettingsViewModel());
  locator.registerLazySingleton(() => AppDatabase());
}
