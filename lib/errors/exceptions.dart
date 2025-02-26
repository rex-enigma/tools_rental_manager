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
  String message =
      'ArticleNotFoundException: article not found of the given title';

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

class FailedToDeleteATool implements Exception {
  String message;
  FailedToDeleteATool({required this.message});

  @override
  String toString() {
    return 'FailedToDeleteATool: $message';
  }
}

class UserNotFound implements Exception {
  String message;
  UserNotFound({required this.message});

  @override
  String toString() {
    return 'UserNotFound: $message';
  }
}

class UserAlreadyExist implements Exception {
  String message;
  UserAlreadyExist({required this.message});

  @override
  String toString() {
    return 'UserAlreadyExist: $message';
  }
}
