import 'dart:io';

import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  /// appBar title typically a [Text] widget
  final String title;

  //didn't find a better description
  /// a callback for the button at the top right conner
  final VoidCallback onPressedEditButton;

  /// the path pointing to an asset image
  final String? imagePath;

  /// typically an icon used as a placeholder for the image when the actual image path is null
  final Widget placeholderImage;

  /// a function that allow as to navigate back to the previous screen/view
  /// typically a function that used Navigator.of(context).pop functionality
  final VoidCallback navigateBack;
  const ImageView({
    super.key,
    required this.title,
    required this.onPressedEditButton,
    this.imagePath,
    required this.placeholderImage,
    required this.navigateBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: navigateBack,
        ),
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            color: Theme.of(context).colorScheme.secondary,
            onPressed: onPressedEditButton,
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: imagePath == null
            ? Container(
                height: 360,
                width: 380,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                  color: const Color.fromARGB(64, 158, 158, 158),
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: placeholderImage,
                ),
              )
            // if an image path is provided display that image in is original size, let it get constrain from the parent(the screen or any other parent that will constrain its size)
            : Image.file(
                File(imagePath!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
