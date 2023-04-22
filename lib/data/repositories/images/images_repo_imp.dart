import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:tools_rental_management/data/data_sources/local/cameraphotos/cameraphotos_local_datasource_interface.dart';
import 'package:tools_rental_management/data/data_sources/local/cameraphotos/cameraphotos_localcamera_datasource_imp.dart';
import 'package:tools_rental_management/data/data_sources/local/galleryimages/galleryimages_local_datasource_interface.dart';
import 'package:tools_rental_management/data/data_sources/local/galleryimages/galleryimages_localgallery_datasource_imp.dart';
import 'package:tools_rental_management/data/data_sources/local/imagesdir/images_local_datasource_interface.dart';
import 'package:tools_rental_management/data/data_sources/local/imagesdir/images_localdirectory_datasource_imp.dart';
import 'package:tools_rental_management/data/repositories/images/images_repo_interface.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/errors/exceptions.dart';

// following the guidelines from 'android developer' on app architecture: a repository can contain zero to many data sources.
// should create a repo class for each diff types of data.
// [ImagesRepoImp] class works with images data.
class ImagesRepoImp implements ImagesRepo {
  // will be used to retrieve images from local camera data source.
  late CameraPhotosLocalDataSource _cameraPhotosLocalDataSource;
  // will be used to retrieve images from local gallery data source.
  late GalleryImagesLocalDataSource _galleryImagesLocalDataSource;
  // we will use this directory local data source to persist images gotten from local camera data source and local gallery data source.
  // we use the below local data source to persist the images gotten from the camera because thy are temporality stored.
  // also since images gotten from the gallery that our app uses might be deleted by the user, we also use the below
  // local data source to persist the corresponding images to a permanent directory.
  late ImagesLocalDataSource _directoryImagesLocalDataSource;

  ImagesRepoImp({
    CameraPhotosLocalDataSource? cameraPhotosLocalDataSource,
    GalleryImagesLocalDataSource? galleryImagesLocalDataSource,
    ImagesLocalDataSource? directoryImagesLocalDataSource,
  }) {
    // instead of initializing the field members in the declaration using service locator directly, we use the
    // dependency injection pattern which will assist us when performing unit testing since we can pass a test
    // dependency instance instead of using the real dependency instance (eg the ones gotten from the locator.get<Type>() function).
    _cameraPhotosLocalDataSource = cameraPhotosLocalDataSource ?? locator.get<CameraPhotosLocalCameraDataSource>();
    _galleryImagesLocalDataSource = galleryImagesLocalDataSource ?? locator.get<GalleryImagesLocalGalleryDataSource>();
    _directoryImagesLocalDataSource = directoryImagesLocalDataSource ?? locator.get<ImagesLocalDirectoryDataSource>();
  }

  /// if the previousImagePath arg is provided, it will be used to remove the corresponding image first before
  /// storing and returning a replacement. Its used when the user wants to change the current image to a diff one.
  @override
  Future<String?> fetchImagePath({required ImageSource source, String? previousImagePath}) async {
    try {
      // if previousImagePath is null then it means its the first time trying to fetch a image.
      if (previousImagePath == null) {
        switch (source) {
          case ImageSource.camera:
            // the image path returned is a path that points to an image that is stored in a temporally location.
            // or null if the user cancels the image capture.
            final String? imagePathCache = await _cameraPhotosLocalDataSource.selectPhotoFromCamera();
            // imagePathCache is null if the user cancelled the image capture.
            if (imagePathCache == null) return null;
            // we store the image in a permanent dir where platform won't delete it.
            final String imagePath = await _directoryImagesLocalDataSource.storeImage(File(imagePathCache));
            return imagePath;

          default:
            final String? imagePathCache = await _galleryImagesLocalDataSource.selectImageFromGallery();
            if (imagePathCache == null) return null;
            final String imagePath = await _directoryImagesLocalDataSource.storeImage(File(imagePathCache));
            return imagePath;
        }
        // if PreviousImagePath isn't null then it means isn't the first time trying to fetch a image.
      } else {
        File oldImagePath = File(previousImagePath);

        // check if the previousImagePath points to an image that exists.
        if (!oldImagePath.existsSync()) {
          throw ImageNotFoundInDir(message: "No image exist of path: $previousImagePath");
        } else {
          switch (source) {
            case ImageSource.camera:
              final String? imagePathCache = await _cameraPhotosLocalDataSource.selectPhotoFromCamera();

              if (imagePathCache == null) return null;

              // delete the image of the given previousImagePath.
              oldImagePath.deleteSync();

              final String imagePath = await _directoryImagesLocalDataSource.storeImage(File(imagePathCache));
              return imagePath;

            default:
              final String? imagePathCache = await _galleryImagesLocalDataSource.selectImageFromGallery();

              if (imagePathCache == null) return null;

              // delete the image of the given previousImagePath.
              oldImagePath.deleteSync();

              final String imagePath = await _directoryImagesLocalDataSource.storeImage(File(imagePathCache));
              return imagePath;
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
