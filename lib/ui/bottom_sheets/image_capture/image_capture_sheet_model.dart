import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/domain/usecases/pick_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';
import 'package:tools_rental_management/enums/my_image_source.dart';

class ImageCaptureSheetModel extends BaseViewModel {
  final NavigationService _navigationService;
  final UseCase<String?, PickImageParams> _pickImageUseCase;

  ImageCaptureSheetModel({NavigationService? navigationService, UseCase<String?, PickImageParams>? pickImageUseCase})
      : _navigationService = navigationService ?? locator<NavigationService>(),
        _pickImageUseCase = pickImageUseCase ?? locator<PickImageUseCase>();

  // will hold an imagePath if the previous View/BottomSheet that invoked it has one.
  // this imagePath will be used when updating an image
  String? imagePath;

  void fetchImageFromCamera() async {
    String? cameraImagePath = await _pickImageUseCase(PickImageParams(source: MyImageSource.camera, previousImagePath: imagePath));

    // execute only if the image returned is not the same as the one provided as previousImagePath
    if (cameraImagePath != imagePath) {
      navigateBack(cameraImagePath);
    }
  }

  void fetchImageFromGallery() async {
    String? galleryImagePath = await _pickImageUseCase(PickImageParams(source: MyImageSource.gallery, previousImagePath: imagePath));

    // execute only if the image returned is not the same as the one provided as previousImagePath
    if (galleryImagePath != imagePath) {
      navigateBack(galleryImagePath);
    }
  }

// the parameter result, is used to provide a return value to the calling function that pushed ToolImageCaptureSheet.
  void navigateBack(String? result) {
    // the return value has to be wrapped by a SheetResponse since  the calling function expects SheetResponse type
    // you called also navigate back by using the completer provided in the ToolImageCaptureSheet. it also requires SheetResponse as argument with data as its property to return
    _navigationService.back(result: SheetResponse(data: result));
  }
}
