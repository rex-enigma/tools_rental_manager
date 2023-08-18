import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/tools/tools_repo_imp.dart';
import 'package:tools_rental_management/data/repositories/toolusers/toolusers_repo_imp.dart';
import 'package:tools_rental_management/enums/image_type.dart';
import 'package:tools_rental_management/ui/views/image/image_view.dart';

class ImageViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _toolsRepoImp = locator<ToolsRepoImp>();
  final _toolUsersRepoImp = locator<ToolUsersRepoImp>();

  /// the id of either tool data or toolUser data (toolId or toolUserId)
  int? id;

  /// the type of image that should be fetched from the database (toolImage or nationalIdImage or toolUserImage)
  ImageType? imageType;

  /// will hold an image path of either: tool,frontNationalId,backNationalId or tool user
  String? imagePath;

  /// the name of the image
  String? name;

  void initState(IdImageTypeGroup idImageTypeGroup) async {
    id = idImageTypeGroup.id;
    imageType = idImageTypeGroup.imageType;
    await fetchImage();
    await fetchName();
  }

// fetched the image to be displayed based on the ImageType
  Future fetchImage() async {
    // runBusyFuture Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    switch (imageType) {
      case ImageType.frontNationalIdImage:
        String? frontNationalIdImagePath = await runBusyFuture(_toolUsersRepoImp
            .getToolUserFrontNationalIdImagePathByIdOrNull(id!));
        imagePath = frontNationalIdImagePath;
        break;
      case ImageType.backNationalIdImage:
        String? backNationalIdImagePath = await runBusyFuture(_toolUsersRepoImp
            .getToolUserBackNationalIdImagePathByIdOrNull(id!));
        imagePath = backNationalIdImagePath;
      case ImageType.toolImage:
        String? toolImagePath =
            await runBusyFuture(_toolsRepoImp.getToolImagePathByIdOrNull(id!));
        imagePath = toolImagePath;

      case ImageType.toolUserImage:
        String? toolUserImagePath = await runBusyFuture(
            _toolUsersRepoImp.getToolUserAvatarImagePathByIdOrNull(id!));
        imagePath = toolUserImagePath;
      case null:
        throw "can't fetch image since [imageType] is null";
    }
  }

  // should only be called when the user has actually captured an image using camera or selected an image using gallery
  // which will be used to replace the previous one in the database.
  Future updateImagePath(String newImagePath, int id) async {
    // updateImagePath will update and return the updated tool image path which we will use it to set imagePath

    // runBusyFuture will Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    switch (imageType) {
      case ImageType.frontNationalIdImage:
        String? newFrontNationalIdImagePath = await runBusyFuture(
            _toolUsersRepoImp.updateToolUserFrontNationalIdImagePath(
                newImagePath, id));
        imagePath = newFrontNationalIdImagePath;
        break;
      case ImageType.backNationalIdImage:
        String? newBackNationalIdImagePath = await runBusyFuture(
            _toolUsersRepoImp.updateToolUserBackNationalIdImagePath(
                newImagePath, id));
        imagePath = newBackNationalIdImagePath;
      case ImageType.toolImage:
        String? newToolImagePath = await runBusyFuture(
            _toolsRepoImp.updateToolImagePath(newImagePath, id));
        imagePath = newToolImagePath;
      case ImageType.toolUserImage:
        String? newToolUserImagePath = await runBusyFuture(
            _toolUsersRepoImp.updateToolUserAvatarImagePath(newImagePath, id));
        imagePath = newToolUserImagePath;
      case null:
        throw "can't update image since [imageType] is null";
    }
  }

  // fetched the name of the image
  Future fetchName() async {
    // runBusyFuture Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    switch (imageType) {
      case ImageType.frontNationalIdImage:
        name = 'Front id';
        break;
      case ImageType.backNationalIdImage:
        name = 'Back id';
      case ImageType.toolImage:
        String? toolImageName =
            await runBusyFuture(_toolsRepoImp.getToolNameByIdOrNull(id!));
        name = toolImageName;
      case ImageType.toolUserImage:
        String? toolUserFirstName = await runBusyFuture(
            _toolUsersRepoImp.getToolUserFirstNameByIdOrNull(id!));
        name = toolUserFirstName;
      case null:
        throw "can't fetch name since [imageType] is null";
    }
  }

  void showToolImageCaptureBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      // title to be used for the ImageCaptureSheet
      title: getImageCaptureSheetTitle(),
      variant: BottomSheetType.imageCapture,
      // send the toolImagePath to the ImageCaptureSheet for it to be removed if the user has selected one and what to update with a new one
      data: imagePath,
    );
    // when response!.data is not equal to null, it means the user has captured/selected a new image, hence we need to update out tool imagePath in the database.
    if (response?.data != null) {
      updateImagePath(response!.data, id!);
    }
  }

  String getImageCaptureSheetTitle() {
    return switch (imageType) {
      ImageType.frontNationalIdImage ||
      ImageType.backNationalIdImage =>
        'National id image',
      ImageType.toolUserImage => 'Tool user image',
      ImageType.toolImage => 'Tool image',
      null =>
        throw "can't get the time for the imageCaptureSheet since imageType is null"
    };
  }
}
