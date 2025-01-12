import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/domain/entities/tool_entity.dart';
import 'package:tools_rental_management/domain/entities/tooluser_entity.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_user_avatar_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_user_back_national_id_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_user_front_national_id_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/get_tool_user_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_user_avatar_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_user_back_national_id_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/update_tool_user_front_national_id_image_usecase.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';
import 'package:tools_rental_management/enums/image_type.dart';
import 'package:tools_rental_management/ui/views/image/image_view.dart';

class ImageViewModel extends BaseViewModel {
  final NavigationService _navigationService;
  final BottomSheetService _bottomSheetService;
  // final  _toolsRepoImp = locator<ToolsRepoImp>();
  // final _toolUsersRepoImp = locator<ToolUsersRepoImp>();

  final UseCase<String?, ToolUserIdParam> _getToolUserFrontNationalIdImageUseCase;
  final UseCase<String?, ToolUserIdParam> _getToolUserBackNationalIdImageUseCase;
  final UseCase<String?, ToolIdParam> _getToolImageUseCase;
  final UseCase<String?, ToolUserIdParam> _getToolUserAvatarImageUseCase;
  final UseCase<String?, UpdateToolUserBackNationalIdImageParams> _updateToolUserBackNationalIdImageUseCase;
  final UseCase<String?, UpdateToolUserFrontNationalIdImageParams> _updateToolUserFrontNationalIdImageUseCase;
  final UseCase<String?, UpdateToolImageParams> _updateToolImageUseCase;
  final UseCase<String?, UpdateToolUserAvatarImageParams> _updateToolUserAvatarImageUseCase;
  final UseCase<ToolEntity?, ToolIdParam> _getToolUseCase;
  final UseCase<ToolUserEntity?, ToolUserIdParam> _getToolUserUseCase;

  ImageViewModel(
      {NavigationService? navigationService,
      BottomSheetService? bottomSheetService,
      UseCase<String?, ToolUserIdParam>? getToolUserFrontNationalIdImageUseCase,
      UseCase<String?, ToolUserIdParam>? getToolUserBackNationalIdImageUseCase,
      UseCase<String?, ToolIdParam>? getToolImageUseCase,
      UseCase<String?, ToolUserIdParam>? getToolUserAvatarImageUseCase,
      UseCase<String?, UpdateToolUserBackNationalIdImageParams>? updateToolUserBackNationalIdImageUseCase,
      UseCase<String?, UpdateToolUserFrontNationalIdImageParams>? updateToolUserFrontNationalIdImageUseCase,
      UseCase<String?, UpdateToolImageParams>? updateToolImageUseCase,
      UseCase<String?, UpdateToolUserAvatarImageParams>? updateToolUserAvatarImageUseCase,
      UseCase<ToolEntity?, ToolIdParam>? getToolUseCase,
      UseCase<ToolUserEntity?, ToolUserIdParam>? getToolUserUseCase})
      : _navigationService = navigationService ?? locator<NavigationService>(),
        _bottomSheetService = bottomSheetService ?? locator<BottomSheetService>(),
        _getToolUserFrontNationalIdImageUseCase = getToolUserFrontNationalIdImageUseCase ?? locator<GetToolUserFrontNationalIdImageUseCase>(),
        _getToolUserBackNationalIdImageUseCase = getToolUserBackNationalIdImageUseCase ?? locator<GetToolUserBackNationalIdImageUseCase>(),
        _getToolImageUseCase = getToolImageUseCase ?? locator<GetToolImageUseCase>(),
        _getToolUserAvatarImageUseCase = getToolUserAvatarImageUseCase ?? locator<GetToolUserAvatarImageUseCase>(),
        _updateToolUserBackNationalIdImageUseCase = updateToolUserBackNationalIdImageUseCase ?? locator<UpdateToolUserBackNationalIdImageUseCase>(),
        _updateToolUserFrontNationalIdImageUseCase = updateToolUserFrontNationalIdImageUseCase ?? locator<UpdateToolUserFrontNationalIdImageUseCase>(),
        _updateToolImageUseCase = updateToolImageUseCase ?? locator<UpdateToolImageUseCase>(),
        _updateToolUserAvatarImageUseCase = updateToolUserAvatarImageUseCase ?? locator<UpdateToolUserAvatarImageUseCase>(),
        _getToolUseCase = getToolUseCase ?? locator<GetToolUseCase>(),
        _getToolUserUseCase = getToolUserUseCase ?? locator<GetToolUserUseCase>();

  /// the id of either tool data or toolUser data (toolId or toolUserId)
  int? id;

  /// the type of image that should be fetched from the database (toolImage or nationalIdImage or toolUserImage)
  ImageType? imageType;

  /// will hold an image path of either: tool,frontNationalId,backNationalId or tool user
  String? imagePath;

  /// the name of the image
  String? name;

  void initState(IdImageTypeGroup idImageTypeGroup) async {
    id = idImageTypeGroup.id;
    imageType = idImageTypeGroup.imageType;
    await fetchImage();
    await fetchImageName();
  }

// fetched the image to be displayed based on the ImageType
  Future fetchImage() async {
    // runBusyFuture Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    switch (imageType) {
      case ImageType.frontNationalIdImage:
        String? frontNationalIdImagePath = await runBusyFuture(_getToolUserFrontNationalIdImageUseCase(ToolUserIdParam(toolUserId: id!)));
        imagePath = frontNationalIdImagePath;
        break;
      case ImageType.backNationalIdImage:
        String? backNationalIdImagePath = await runBusyFuture(_getToolUserBackNationalIdImageUseCase(ToolUserIdParam(toolUserId: id!)));
        imagePath = backNationalIdImagePath;
        break;
      case ImageType.toolImage:
        String? toolImagePath = await runBusyFuture(_getToolImageUseCase(ToolIdParam(toolId: id!)));
        imagePath = toolImagePath;

        break;
      case ImageType.toolUserImage:
        String? toolUserImagePath = await runBusyFuture(_getToolUserAvatarImageUseCase(ToolUserIdParam(toolUserId: id!)));
        imagePath = toolUserImagePath;
        break;
      case null:
        throw "can't fetch image since [imageType] is null";
    }
  }

  // should only be called when the user has actually captured an image using camera or selected an image using gallery
  // which will be used to replace the previous one in the database.
  Future updateImagePath(String newImagePath, int id) async {
    // runBusyFuture will Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    switch (imageType) {
      case ImageType.frontNationalIdImage:
        String? newFrontNationalIdImagePath =
            await runBusyFuture(_updateToolUserBackNationalIdImageUseCase(UpdateToolUserBackNationalIdImageParams(toolUserBackNationalIdImagePath: newImagePath, toolUserId: id)));
        await Future.delayed(const Duration(seconds: 2));
        imagePath = newFrontNationalIdImagePath;
        break;
      case ImageType.backNationalIdImage:
        String? newBackNationalIdImagePath = await runBusyFuture(
            _updateToolUserFrontNationalIdImageUseCase(UpdateToolUserFrontNationalIdImageParams(toolUserFrontNationalIdImagePath: newImagePath, toolUserId: id)));

        await Future.delayed(const Duration(seconds: 2));
        imagePath = newBackNationalIdImagePath;
        break;
      case ImageType.toolImage:
        String? newToolImagePath = await runBusyFuture(_updateToolImageUseCase(UpdateToolImageParams(toolImagePath: newImagePath, toolId: id)));
        imagePath = newToolImagePath;
        break;
      case ImageType.toolUserImage:
        String? newToolUserImagePath =
            await runBusyFuture(_updateToolUserAvatarImageUseCase(UpdateToolUserAvatarImageParams(toolUserAvatarImagePath: newImagePath, toolUserId: id)));

        imagePath = newToolUserImagePath;
        break;
      case null:
        throw "can't update image since [imageType] is null";
    }

    rebuildUi();
  }

  // fetched the name of the image
  Future fetchImageName() async {
    // runBusyFuture Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    switch (imageType) {
      case ImageType.frontNationalIdImage:
        name = 'Front id';
        break;
      case ImageType.backNationalIdImage:
        name = 'Back id';
        break;
      case ImageType.toolImage:
        ToolEntity? tool = await runBusyFuture(_getToolUseCase(ToolIdParam(toolId: id!)));
        String? toolImageName = tool?.name;
        name = toolImageName;
        break;
      case ImageType.toolUserImage:
        ToolUserEntity? toolUser = await runBusyFuture(_getToolUserUseCase(ToolUserIdParam(toolUserId: id!)));
        String? toolUserFirstName = toolUser?.firstName;
        name = toolUserFirstName;
        break;
      case null:
        throw "can't fetch name since [imageType] is null";
    }
  }

  void showImageCaptureBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      // title to be used for the ImageCaptureSheet
      title: getImageCaptureSheetTitle(),
      variant: BottomSheetType.imageCapture,
      // send the imagePath to the ImageCaptureSheet for it to be removed if the user has selected one and what to update with a new one
      data: imagePath,
    );

    // when response!.data is not equal to null, it means the user has captured/selected a new image, hence we need to update out tool imagePath in the database.
    if (response?.data != null) {
      updateImagePath(response!.data, id!);
    }
  }

  String getImageCaptureSheetTitle() {
    return switch (imageType) {
      ImageType.frontNationalIdImage || ImageType.backNationalIdImage => 'National id image',
      ImageType.toolUserImage => 'Tool user image',
      ImageType.toolImage => 'Tool image',
      null => throw "can't get the title for the imageCaptureSheet since imageType is null"
    };
  }

  void navigateBack() async {
    _navigationService.back();
  }
}
