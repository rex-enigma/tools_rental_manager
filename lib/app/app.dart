import 'package:tools_rental_management/data/data_sources/local/cameraphotos/cameraphotos_local_datasource_interface.dart';
import 'package:tools_rental_management/data/data_sources/local/cameraphotos/cameraphotos_localcamera_datasource_imp.dart';
import 'package:tools_rental_management/data/data_sources/local/galleryimages/galleryimages_localgallery_datasource_imp.dart';
import 'package:tools_rental_management/data/data_sources/local/imagesdir/images_localdirectory_datasource_imp.dart';
import 'package:tools_rental_management/data/data_sources/local/toolarticles/toolarticles_localsharedpreferences_datasource.dart';
import 'package:tools_rental_management/data/data_sources/local/toolusers/toolusers_localsqlite_datasource_imp.dart';
import 'package:tools_rental_management/data/data_sources/local/tools/tools_localsqlite_datasource_imp.dart';
import 'package:tools_rental_management/data/data_sources/remote/toolarticles/toolarticles_remotewikipedia_datasource_imp.dart';
import 'package:tools_rental_management/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:tools_rental_management/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tools_rental_management/ui/views/home/home_view.dart';
import 'package:tools_rental_management/ui/views/settings/settings_viewmodel.dart';
import 'package:tools_rental_management/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/ui/views/tool_users/tool_users_viewmodel.dart';
import 'package:tools_rental_management/ui/views/tools/tools_view.dart';
import 'package:tools_rental_management/ui/views/settings/settings_view.dart';
import 'package:tools_rental_management/ui/views/tool/tool_view.dart';
import 'package:tools_rental_management/ui/views/tool_search/tool_search_view.dart';
import 'package:tools_rental_management/ui/views/tool_users/tool_users_view.dart';
import 'package:tools_rental_management/ui/views/tool_user_search/tool_user_search_view.dart';
import 'package:tools_rental_management/ui/views/tool_names/tool_names_view.dart';
import 'package:tools_rental_management/ui/views/tool_image/tool_image_view.dart';
import 'package:tools_rental_management/ui/views/tool_user_image/tool_user_image_view.dart';
import 'package:tools_rental_management/ui/views/national_id_image/national_id_image_view.dart';
import 'package:tools_rental_management/ui/views/tools/tools_viewmodel.dart';
import 'package:tools_rental_management/ui/bottom_sheets/tool_creator/tool_creator_sheet.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ToolsView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: ToolView),
    MaterialRoute(page: ToolSearchView),
    MaterialRoute(page: ToolUsersView),
    MaterialRoute(page: ToolUserSearchView),
    MaterialRoute(page: ToolNamesView),
    MaterialRoute(page: ToolImageView),
    MaterialRoute(page: ToolUserImageView),
    MaterialRoute(page: NationalIdImageView),
// @stacked-route
  ],
  dependencies: [
    // @stacked-service
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    //data-sources
    LazySingleton(classType: CameraPhotosLocalCameraDataSource),
    LazySingleton(classType: GalleryImagesLocalGalleryDataSource),
    LazySingleton(classType: ImagesLocalDirectoryDataSource),
    LazySingleton(classType: ToolUsersLocalSqliteDbDataSource),
    LazySingleton(classType: ToolsLocalSqliteDbDataSource),
    LazySingleton(classType: ToolArticlesRemoteWikipediaDataSource),
    LazySingleton(classType: ToolArticleLocalSharedPreferencesDataSource),
    //viewmodels
    LazySingleton(classType: ToolsViewModel),
    LazySingleton(classType: ToolUsersViewModel),
    LazySingleton(classType: SettingsViewModel),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: ToolCreatorSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
