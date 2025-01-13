import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/images/images_repo_imp.dart';
import 'package:tools_rental_management/domain/repositories_interface/images/images_repo_interface.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';
import 'package:tools_rental_management/enums/my_image_source.dart';

class PickImageUseCase implements UseCase<String?, PickImageParams> {
  final ImagesRepo _imagesRepo;

  PickImageUseCase({ImagesRepo? imagesRepo})
      : _imagesRepo = imagesRepo ?? locator<ImagesRepoImp>();
  @override
  Future<String?> call(PickImageParams p) {
    return _imagesRepo.fetchImagePath(
        source: p.source, previousImagePath: p.previousImagePath);
  }
}

class PickImageParams {
  final MyImageSource source;
  final String? previousImagePath;

  PickImageParams({required this.source, required this.previousImagePath});
}
