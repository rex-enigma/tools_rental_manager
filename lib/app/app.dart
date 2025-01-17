import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/app/app.locator.dart';
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
import 'package:tools_rental_management/domain/usecases/add_tool_usecase.dart';
import 'package:tools_rental_management/domain/usecases/add_tool_user_usecase.dart';
import 'package:tools_rental_management/domain/usecases/delete_tool_usecase.dart';
import 'package:tools_rental_management/domain/usecases/delete_tool_user_usecase.dart';
import 'package:tools_rental_management/domain/usecases/fetch_tool_info_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_all_tool_users_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_all_tools_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_user_avatar_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_user_back_national_id_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_user_front_national_id_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_user_usecase.dart';
import 'package:tools_rental_management/domain/usecases/pick_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/rent_out_tool_usecase.dart';
import 'package:tools_rental_management/domain/usecases/repossess_tool_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_category_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_name_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_rate_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_status_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_user_avatar_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_user_back_national_id_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_user_first_name_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_user_front_national_id_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_user_last_name_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_user_phone_number_usecase.dart';
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
import 'package:tools_rental_management/ui/views/login/login_view.dart';
import 'package:tools_rental_management/ui/views/sign_up/sign_up_view.dart';
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
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignUpView),
// @stacked-route
  ],
  dependencies: [
    // @stacked-service
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
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
    //usecases
    LazySingleton(classType: AddToolUseCase),
    LazySingleton(classType: AddToolUserUseCase),
    LazySingleton(classType: DeleteToolUseCase),
    LazySingleton(classType: DeleteToolUserUseCase),
    LazySingleton(classType: FetchToolInfoUseCase),
    LazySingleton(classType: GetAllToolUsersUseCase),
    LazySingleton(classType: GetAllToolsUseCase),
    LazySingleton(classType: GetToolImageUseCase),
    LazySingleton(classType: GetToolUseCase),
    LazySingleton(classType: GetToolUserAvatarImageUseCase),
    LazySingleton(classType: GetToolUserBackNationalIdImageUseCase),
    LazySingleton(classType: GetToolUserFrontNationalIdImageUseCase),
    LazySingleton(classType: GetToolUserUseCase),
    LazySingleton(classType: PickImageUseCase),
    LazySingleton(classType: RentOutToolUseCase),
    LazySingleton(classType: RepossessToolUseCase),
    LazySingleton(classType: UpdateToolCategoryUseCase),
    LazySingleton(classType: UpdateToolImageUseCase),
    LazySingleton(classType: UpdateToolNameUseCase),
    LazySingleton(classType: UpdateToolRateUseCase),
    LazySingleton(classType: UpdateToolStatusUseCase),
    LazySingleton(classType: UpdateToolUserAvatarImageUseCase),
    LazySingleton(classType: UpdateToolUserBackNationalIdImageUseCase),
    LazySingleton(classType: UpdateToolUserFirstNameUseCase),
    LazySingleton(classType: UpdateToolUserFrontNationalIdImageUseCase),
    LazySingleton(classType: UpdateToolUserLastNameUseCase),
    LazySingleton(classType: UpdateToolUserPhoneNumberUseCase),
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
