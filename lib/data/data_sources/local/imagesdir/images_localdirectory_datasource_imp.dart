import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:tools_rental_management/data/data_sources/local/imagesdir/images_local_datasource_interface.dart';

// data source class: type of data + type of source + DataSource (images + localDirectory + DataSource);
// the data source class should only work with one source of data (Directory documentDir).
class ImagesLocalDirectoryDataSource implements ImagesLocalDataSource {
  late Directory _documentDir;

  /// store image in document directory
  @override
  Future<String> storeImage(File imageFile) async {
    try {
      // first, try to get document directory.
      _documentDir = await getApplicationDocumentsDirectory();
      // second, get the name of the image from the [imageFile] that we want to store in the document directory.
      String basename = p.basename(imageFile.path);
      // third, create a new path where the image should be stored by joining the document directory's
      // path and the name of the image.
      String newPath = p.join(_documentDir.path, basename);
      // then, copy the file to the document directory.
      File newFile = await imageFile.copy(newPath);
      // finally, return the new file path.
      return newFile.path;
    } catch (e) {
      rethrow;
    }
  }
}
