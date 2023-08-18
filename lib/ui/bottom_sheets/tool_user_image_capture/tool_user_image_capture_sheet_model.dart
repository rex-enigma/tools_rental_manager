import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/images/images_repo_imp.dart';

//  the logic here is a duplicated from ToolImageCaptureSheetModel... should have encapsulated this logic
// ToolUserImageCaptureSheetModel/ToolImageCaptureSheetModel/nationalImageCaptureSheetModel shrink then down to only one ImageCaptureSheetModel
class ToolUserImageCaptureSheetModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _imagesRepoImp = locator<ImagesRepoImp>();

  /// will hold an toolUserImagePath if the previous View/BottomSheet that invoked it has one.
  /// this toolUserImagePath will be used when updating an image
  String? toolUserImagePath;

  void fetchImageFromCamera() async {
    String? cameraImagePath = await _imagesRepoImp.fetchImagePath(
      source: ImageSource.camera,
      previousImagePath: toolUserImagePath,
    );

    navigateBack(cameraImagePath);
  }

  void fetchImageFromGallery() async {
    String? galleryImagePath = await _imagesRepoImp.fetchImagePath(
      source: ImageSource.gallery,
      previousImagePath: toolUserImagePath,
    );

    navigateBack(galleryImagePath);
  }

// the parameter result, is used to provide a return value to the calling function that pushed ToolImageCaptureSheet.
  void navigateBack(String? result) {
    // the return value has to be wrapped by a SheetResponse since  the calling function expects SheetResponse type
    // you called also navigate back by using the completer provided in the ToolImageCaptureSheet. it also requires SheetResponse as argument with data as its property to return
    _navigationService.back(result: SheetResponse(data: result));
  }
}
