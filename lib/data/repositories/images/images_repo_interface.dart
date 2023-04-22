import 'package:image_picker/image_picker.dart';

abstract class ImagesRepo {
  Future<String?> fetchImagePath({required ImageSource source, String? previousImagePath});
}
