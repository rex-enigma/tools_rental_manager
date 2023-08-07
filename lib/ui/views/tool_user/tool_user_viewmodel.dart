import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/app/app.locator.dart';

class ToolUserViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  String? _firstName;
  String? _lastName;
  String? _avatarImagePath;
  int? _phoneNumber;
  String? _frontNationalIdImagePath;
  String? _backNationalIdImagePath;

  String? get avatarImagePath => _avatarImagePath;
  String? get frontNationalIdImagePath => _frontNationalIdImagePath;
  String? get backNationalIdImagePath => _backNationalIdImagePath;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  int? get phoneNumber => _phoneNumber;

  void showDialog(DialogType dialogType) async {
    var response = await _dialogService.showCustomDialog(
      variant: dialogType,
      data: 'passed data',
    );
  }
}
