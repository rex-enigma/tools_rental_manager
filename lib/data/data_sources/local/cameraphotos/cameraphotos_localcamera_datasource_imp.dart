import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tools_rental_management/data/data_sources/local/cameraphotos/cameraphotos_local_datasource_interface.dart';

// data source class: type of data + type of source + DataSource (cameraPhoto + localCamera + DataSource).
// the data source class should only work with one source of data (ImagePicker)
class CameraPhotosLocalCameraDataSource implements CameraPhotosLocalDataSource {
  final ImagePicker _imagePicker = ImagePicker();

  /// the method returns a path of a photo as string format or might throw a [SelectPhotoFromCameraException]
  /// if a photo wasn't captured or might throw [PlatformException] (check [ImagePicker] .pickImage method for the platformException ).
  @override
  Future<String?> selectPhotoFromCamera() async {
    try {
      // first, try to take a photo with the camera,
      XFile? imageFile = await _imagePicker.pickImage(source: ImageSource.camera); // the image_picker package is using the device camera app to capture photos.

      // second, only execute the code below if the photo has been captured,
      if (imageFile != null) {
        // third, crop the photo that has been captured,
        CroppedFile? croppedImageFile = await ImageCropper().cropImage(
          sourcePath: imageFile.path,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Edit photo',
              lockAspectRatio: false,
            ),
            IOSUiSettings(
              title: 'Edit photo',
            )
          ],
        );
        // last, return the cropped image path or return non-cropped image path if the cropping of the image wasn't done.
        print(croppedImageFile?.path ?? imageFile.path);
        return croppedImageFile?.path ?? imageFile.path;
      }
      // indicate that no image was captured;
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
