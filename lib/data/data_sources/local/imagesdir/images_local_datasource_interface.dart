import 'dart:io';

abstract class ImagesLocalDataSource {
  Future<String> storeImage(File imageFile);
}
