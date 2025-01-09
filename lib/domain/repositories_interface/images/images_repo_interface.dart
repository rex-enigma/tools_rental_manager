import 'package:tools_rental_management/enums/my_image_source.dart';

abstract class ImagesRepo {
  Future<String?> fetchImagePath({required MyImageSource source, String? previousImagePath});
}
