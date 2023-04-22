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
import 'package:tools_rental_management/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
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
    LazySingleton(classType: ToolArticleLocalSharedPreferencesDataSource)
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
