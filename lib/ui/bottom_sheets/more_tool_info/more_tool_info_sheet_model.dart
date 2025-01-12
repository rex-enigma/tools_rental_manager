import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/app/app.locator.dart';
import 'package:tools_rental_management/app/app.router.dart';
import 'package:tools_rental_management/domain/entities/toolarticle_entity.dart';
import 'package:tools_rental_management/domain/usecases/fetch_tool_info_usecase.dart';
import 'package:tools_rental_management/domain/usecases/usecase.dart';

class MoreToolInfoSheetModel extends BaseViewModel {
  final UseCase<ToolArticleEntity?, TitleParam> _fetchToolInfoUseCase;

  MoreToolInfoSheetModel({UseCase<ToolArticleEntity?, TitleParam>? fetchToolInfoUseCase}) : _fetchToolInfoUseCase = fetchToolInfoUseCase ?? locator<FetchToolInfoUseCase>();

  // this name will be used search for a specific tool in wikipedia
  late String toolName;
  ToolArticleEntity? toolArticle;
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
    ToolArticleEntity? toolArticle = await runBusyFuture(_fetchToolInfoUseCase(TitleParam(title: toolName)));

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
