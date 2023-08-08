import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';

class MoreToolInfoSheetModel extends BaseViewModel {
  String? _toolName;
  String? _toolCategory;
  String? _toolInfoSource;
  String? _toolContent;
  String? _toolUrlImagePath;

  String? get toolName => _toolName;
  String? get toolCategory => _toolCategory;
  String? get toolInfoSource => _toolInfoSource;
  String? get toolContent => _toolContent;
  String? get toolUrlImagePath => _toolUrlImagePath;
}
