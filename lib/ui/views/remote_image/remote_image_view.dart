import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'remote_image_viewmodel.dart';

class RemoteImageView extends StackedView<RemoteImageViewModel> {
  final String urlImagePath;
  final String toolName;
  const RemoteImageView({Key? key, required this.urlImagePath, required this.toolName}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RemoteImageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            viewModel.navigateBack();
          },
        ),
        centerTitle: true,
        title: Text(
          toolName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child:
            // display the url image in is original size, let it get its constraints from is parent(the screen or any other parent that will constrain its size)
            Image.network(
          urlImagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  RemoteImageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RemoteImageViewModel();
}
