import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/app/app.router.dart';
import 'package:tools_rental_management/data/models/toolarticle_model.dart';
import 'package:tools_rental_management/data/repositories/toolarticles/toolarticles_repo_imp.dart';

class MoreToolInfoSheetModel extends BaseViewModel {
  final _toolArticlesRepoImp = locator<ToolArticlesRepoImp>();
  final _navigationService = locator<NavigationService>();
  // this name will be used search for a specific tool in wikipedia
  late String toolName;
  ToolArticleModel? toolArticle;
  // String? toolName;
  // String? toolCategory;
  // String? toolInfoSource;
  // String? toolContent;
  // String? toolUrlImagePath;

  void initState(String toolName) async {
    this.toolName = toolName;
    await fetchMoreToolInfo(toolName);
  }

  Future fetchMoreToolInfo(String toolName) async {
    // runBusyFuture  Sets busy to true before starting future and sets it to false after executing
    // the ui will be rebuild in both situations
    //if unable to fetch tool article for various reasons(eg no internet access) null will be returned (check this later )
    ToolArticleModel? toolArticle = await runBusyFuture(_toolArticlesRepoImp.fetchToolArticle(toolName));
    if (toolArticle != null) {
      this.toolArticle = toolArticle;
    }
  }

  void navigateToRemoteImageView(BuildContext context) async {
    if (toolArticle != null && toolArticle?.urlImagePath != null) {
      // await _navigationService.navigateToRemoteImageView(urlImagePath: toolArticle!.urlImagePath!, toolName: toolArticle!.title);
      // i don't know why _navigationService.navigateToRemoteImageView only works once but after that any subsequent press do not  cause navigation to RemoteImageView
      Navigator.of(context).pushNamed(Routes.remoteImageView, arguments: RemoteImageViewArguments(urlImagePath: toolArticle!.urlImagePath!, toolName: toolArticle!.title));
    }
  }
}
