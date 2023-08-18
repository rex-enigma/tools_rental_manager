import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.bottomsheets.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/repositories/tools/tools_repo_imp.dart';

class ToolImageViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _toolsRepoImp = locator<ToolsRepoImp>();

  int? toolId;
  String? toolImagePath;
  String? toolName;

  void initState(int toolId) async {
    this.toolId = toolId;
    await fetchToolImage(this.toolId!);
    fetchToolName(this.toolId!);
  }

  Future fetchToolImage(int toolId) async {
    // Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    String? toolImagePath = await runBusyFuture(_toolsRepoImp.getToolImagePathByIdOrNull(toolId));
    this.toolImagePath = toolImagePath;
  }

  // should only be called when the user has actually captured an image using camera or selected an image using gallery
  // which will be used to replace the previous one in the database.
  Future updateImagePath(String toolImagePath, int toolId) async {
    // updateToolImagePath will update and return the updated tool image path which we will use it to set this.toolImagePath

    // runBusyFuture will Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    this.toolImagePath = await runBusyFuture(_toolsRepoImp.updateToolImagePath(toolImagePath, toolId));
  }

  Future fetchToolName(int toolId) async {
    // Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    String? toolName = await runBusyFuture(_toolsRepoImp.getToolNameByIdOrNull(toolId));
    this.toolName = toolName;
  }

  void showToolImageCaptureBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      // title to be used for the ImageCaptureSheet
      title: 'Tool image',
      variant: BottomSheetType.imageCapture,
      // send the toolImagePath to the ImageCaptureSheet for it to be removed if the user has selected one and what to update with a new one
      data: toolImagePath,
    );
    // when response!.data is not equal to null, it means the user has captured/selected a new image, hence we need to update out tool imagePath in the database.
    if (response?.data != null) {
      updateImagePath(response!.data, toolId!);
    }
  }
}
