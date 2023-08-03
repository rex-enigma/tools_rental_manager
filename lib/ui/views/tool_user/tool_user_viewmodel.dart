import 'package:stacked/stacked.dart';

class ToolUserViewModel extends BaseViewModel {
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
}
