import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/enums/image_type.dart';
import 'image_viewmodel.dart';

/// This record type groups an id  and an ImageType.
/// The id should be either a toolId or a toolUserId that will be used to fetch an image of the corresponding ImageType
/// the record type should be (int id, ImageType imageType) , but to some unknown reason stacked is unable to handle user defined type for the second record field type, so i had to use dynamic type
typedef IdImageTypeGroup = ({int id, dynamic imageType});

class ImageView extends StackedView<ImageViewModel> {
  final IdImageTypeGroup idImageTypeGroup;

  const ImageView({Key? key, required this.idImageTypeGroup}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ImageViewModel viewModel,
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
          viewModel.name ?? 'Title',
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () => viewModel.showImageCaptureBottomSheet(),
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: viewModel.imagePath == null
            ? Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                  color: const Color.fromARGB(64, 158, 158, 158),
                ),
                child: CircularProgressIndicator(backgroundColor: Theme.of(context).colorScheme.secondary),
              )
            // if an image path is provided display that image in is original size, let it get constrain from the parent(the screen or any other parent that will constrain its size)
            : Image.file(
                File(viewModel.imagePath!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  @override
  ImageViewModel viewModelBuilder(BuildContext context) => ImageViewModel();

  @override
  void onViewModelReady(ImageViewModel viewModel) {
    viewModel.initState(idImageTypeGroup);
    super.onViewModelReady(viewModel);
  }
}
