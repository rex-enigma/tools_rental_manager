import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.locator.dart';

class RemoteImageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateBack() {
    _navigationService.back();
  }
}
