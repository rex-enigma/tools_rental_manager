import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/enums/category.dart';

class ToolCategoryEditorDialogModel extends BaseViewModel {
  Category? category;

  void setCategoryValue(Category categoryValue) {
    category = categoryValue;
    rebuildUi();
  }
}
