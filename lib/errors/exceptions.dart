// class SelectPhotoFromCameraException implements Exception {
//   String message = 'SelectPhotoFromCameraException: user canceled photo selection from camera';

//   @override
//   String toString() {
//     return message;
//   }
// }

// class SelectImageFromGalleryException implements Exception {
//   String message = 'SelectImageFromGalleryException: user canceled image selection from gallery';

//   @override
//   String toString() {
//     return message;
//   }
// }

class ArticleNotFoundException implements Exception {
  String message = 'ArticleNotFoundException: article not found of the given title';

  @override
  String toString() {
    return message;
  }
}

class FailedToFetchToolArticleData implements Exception {
  String message;

  FailedToFetchToolArticleData({required this.message});

  @override
  String toString() {
    return 'FailedToFetchToolArticleData: $message';
  }
}

class ImageNotFoundInDir implements Exception {
  String message;

  ImageNotFoundInDir({required this.message});

  @override
  String toString() {
    return 'ImageNotFoundInDir: $message';
  }
}
