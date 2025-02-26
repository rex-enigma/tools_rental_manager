import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService;

  StartupViewModel({NavigationService? navigationService})
      : _navigationService = navigationService ?? locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    // _navigationService.replaceWithHomeView();
    _navigationService.replaceWithLoginView();
  }
}
