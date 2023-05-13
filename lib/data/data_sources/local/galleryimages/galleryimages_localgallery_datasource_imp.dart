import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tools_rental_management/data/data_sources/local/galleryimages/galleryimages_local_datasource_interface.dart';

// data source class: type of data + type of source + DataSource (galleryImage + localGallery + DataSource);
// the data source class should only work with one source of data (ImagePicker)
class GalleryImagesLocalGalleryDataSource
    implements GalleryImagesLocalDataSource {
  final ImagePicker _imagePicker = ImagePicker();

  /// The method returns a path of an image as string value or might return null if the user cancels a image selection.
  /// it might throw [PlatformException] (check [ImagePicker].pickImage method for the platformException explanation).
  @override
  Future<String?> selectImageFromGallery() async {
    try {
      // first, try to get an image from the gallery.
      XFile? imageFile = await _imagePicker.pickImage(
          source: ImageSource
              .gallery); // the image_picker package is using the device gallery app to pick images.

      // second, only execute the code below if the image has been selected.
      if (imageFile != null) {
        // third, crop the image that has been selected.
        CroppedFile? croppedImageFile = await ImageCropper().cropImage(
          sourcePath: imageFile.path,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Edit Image',
              lockAspectRatio: false,
            ),
            IOSUiSettings(title: 'Edit image'),
          ],
        );
        // last, return the cropped image path or return non-cropped image path if the cropping of the image wasn't done.
        return croppedImageFile?.path ?? imageFile.path;
      }
      // indicates that no image was captured.
      return null;
    } catch (e) {
      rethrow;
    }
  }
}

/// The method returns a path of an image as string format or might throw a [SelectImageFromGalleryException]
/// if an image wasn't selected. it also might throw [PlatformException] (check [ImagePicker].pickImage method
///  for the platformException explanation).
// Future<String> selectImageFromGallery() async {
//   try {
//     // first, try to get an image from the gallery
//     XFile? imageFile = await _imagePicker.pickImage(source: ImageSource.gallery); // the image_picker package is using the device gallery app to pick images.

//     // second, only execute the code below if the image has been selected.
//     if (imageFile != null) {
//       // third, crop the image that has been selected.
//       CroppedFile? croppedImageFile = await ImageCropper().cropImage(
//         sourcePath: imageFile.path,
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Edit Image',
//             lockAspectRatio: false,
//           ),
//           IOSUiSettings(title: 'Edit image'),
//         ],
//       );
//       // last, return the cropped image path or return non-cropped image path if the cropping of the image wasn't done.
//       return croppedImageFile?.path ?? imageFile.path;
//     }

//     throw SelectImageFromGalleryException();
//   } catch (e) {
//     rethrow;
//   }
// }
