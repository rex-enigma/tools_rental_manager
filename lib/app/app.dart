import 'package:tools_rental_management/data/data_sources/local/cameraphotos/cameraphotos_localcamera_datasource_imp.dart';
import 'package:tools_rental_management/data/data_sources/local/galleryimages/galleryimages_localgallery_datasource_imp.dart';
import 'package:tools_rental_management/data/data_sources/local/imagesdir/images_localdirectory_datasource_imp.dart';
import 'package:tools_rental_management/data/data_sources/local/toolarticles/toolarticles_localsharedpreferences_datasource.dart';
import 'package:tools_rental_management/data/data_sources/local/toolusers/toolusers_localsqlite_datasource_imp.dart';
import 'package:tools_rental_management/data/data_sources/local/tools/tools_localsqlite_datasource_imp.dart';
import 'package:tools_rental_management/data/data_sources/remote/toolarticles/toolarticles_remotewikipedia_datasource_imp.dart';
import 'package:tools_rental_management/data/repositories/images/images_repo_imp.dart';
import 'package:tools_rental_management/data/repositories/toolarticles/toolarticles_repo_imp.dart';
import 'package:tools_rental_management/data/repositories/tools/tools_repo_imp.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/database/app_database.dart';
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
import 'package:tools_rental_management/ui/views/tool_users/tool_users_view.dart';
import 'package:tools_rental_management/ui/views/tool_names/tool_names_view.dart';
import 'package:tools_rental_management/ui/views/tools/tools_viewmodel.dart';
import 'package:tools_rental_management/ui/bottom_sheets/tool_creator/tool_creator_sheet.dart';
import 'package:tools_rental_management/ui/bottom_sheets/tool_user_creator/tool_user_creator_sheet.dart';
import 'package:tools_rental_management/ui/views/tool_user/tool_user_view.dart';
import 'package:tools_rental_management/ui/dialogs/tool_rate_editor/tool_rate_editor_dialog.dart';
import 'package:tools_rental_management/ui/dialogs/tool_category_editor/tool_category_editor_dialog.dart';
import 'package:tools_rental_management/ui/dialogs/tool_status_editor/tool_status_editor_dialog.dart';
import 'package:tools_rental_management/ui/dialogs/tool_user_phonenumber_editor/tool_user_phonenumber_editor_dialog.dart';
import 'package:tools_rental_management/ui/dialogs/tool_repossession_confirm/tool_repossession_confirm_dialog.dart';
import 'package:tools_rental_management/ui/bottom_sheets/select_tool/select_tool_sheet.dart';
import 'package:tools_rental_management/ui/bottom_sheets/more_tool_info/more_tool_info_sheet.dart';
import 'package:tools_rental_management/ui/bottom_sheets/image_capture/image_capture_sheet.dart';
import 'package:tools_rental_management/ui/views/image/image_view.dart';
import 'package:tools_rental_management/ui/dialogs/delete_confirm/delete_confirm_dialog.dart';
import 'package:tools_rental_management/ui/dialogs/tool_user_name_editor/tool_user_name_editor_dialog.dart';
import 'package:tools_rental_management/ui/views/remote_image/remote_image_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ToolsView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: ToolView),
    MaterialRoute(page: ToolUsersView),
    MaterialRoute(page: ToolNamesView),
    MaterialRoute(page: ToolUserView),
    MaterialRoute(page: ImageView),
    MaterialRoute(page: RemoteImageView),
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
    // repositories
    LazySingleton(classType: ToolArticlesRepoImp),
    LazySingleton(classType: ToolsRepoImp),
    LazySingleton(classType: ToolUsersRepoImp),
    LazySingleton(classType: ImagesRepoImp),

    //viewmodels
    LazySingleton(classType: ToolsViewModel),
    LazySingleton(classType: ToolUsersViewModel),
    LazySingleton(classType: SettingsViewModel),
    // database
    LazySingleton(classType: AppDatabase),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: ImageCaptureSheet),
    StackedBottomsheet(classType: ToolCreatorSheet),
    StackedBottomsheet(classType: ToolUserCreatorSheet),
    StackedBottomsheet(classType: SelectToolSheet),
    StackedBottomsheet(classType: MoreToolInfoSheet),
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: ToolRateEditorDialog),
    StackedDialog(classType: ToolCategoryEditorDialog),
    StackedDialog(classType: ToolStatusEditorDialog),
    StackedDialog(classType: ToolUserPhonenumberEditorDialog),
    StackedDialog(classType: ToolRepossessionConfirmDialog),
    StackedDialog(classType: DeleteConfirmDialog),
    StackedDialog(classType: ToolUserNameEditorDialog),
  ],
)
class App {}
