import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/data/data_models/tooluser.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/currency.dart';
import 'package:tools_rental_management/enums/status.dart';

class ToolViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  /// uniquely identifies a tool in the database (primary key)
  int? _toolId;
  String? _toolImagePath;
  String? _toolName;
  Status? _toolStatus;
  int? _toolRate;
  Category? _toolCategory;
  Currency? _toolCurrency;
  String? _currentToolUser;
  // id that uniquely identifies this tool in the warehouse store.
  int? _toolUniqueId;
  // will be extracted from the returned toolUser
  String? toolUserName;
  DateTime? _toolPurchaseDate;
  int? _purchasedPrice;
  String? _toolRentCount;

  String? get toolImagePath => _toolImagePath;
  String? get toolName => _toolName;
  Status? get toolStatus => _toolStatus;
  int? get toolRate => _toolRate;
  Category? get toolCategory => _toolCategory;
  Currency? get toolCurrency => _toolCurrency;
  String? get currentToolUser => _currentToolUser;
  int? get toolUniqueId => _toolUniqueId;
  DateTime? get toolPurchaseDate => _toolPurchaseDate;
  int? get purchasedPrice => _purchasedPrice;
  String? get toolRentCount => _toolRentCount;

  void showDialog(DialogType dialogType) async {
    var response = await _dialogService.showCustomDialog(
      variant: dialogType,
      data: 'passed value',
    );
  }
}
