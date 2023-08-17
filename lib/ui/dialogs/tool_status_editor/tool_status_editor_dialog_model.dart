import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/enums/status.dart';

class ToolStatusEditorDialogModel extends BaseViewModel {
  Status? status;

  void setStatusValue(Status statusValue) {
    status = statusValue;
    rebuildUi();
  }
}
