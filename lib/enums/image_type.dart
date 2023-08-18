/// Should be used when deciding to fetch either toolImagePath/toolUserImagePath/nationalIdImagePath from the database or display specific image in imageView.
/// Can either be: toolImage or nationalIdImage or toolUserImage
enum ImageType {
  toolImage,
  toolUserImage,
  frontNationalIdImage,
  backNationalIdImage;

  /// convert a string value to its corresponding enum constant value.
  /// the argument to be passed MUST either be : `toolImage` string value, `toolUserImage` string value or`nationalIdImage` string value,
  /// any other string values will cause an [Error] to be throw.
  static ImageType fromString(String value) {
    switch (value) {
      case 'front':
        return ImageType.toolImage;
      case 'back':
        return ImageType.toolUserImage;
      case 'nationalIdImage':
        return ImageType.frontNationalIdImage;
      case 'backNationalIdImage':
        return ImageType.backNationalIdImage;
      default:
        throw "the string: {$value}, doesn't correspond to any ImageType constant value";
    }
  }
}
