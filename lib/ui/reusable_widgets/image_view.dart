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
          child: Container(
        height: placeholderImage is Image
            ? 200
            : 280.0, // we are checking the placeholderImage type, we use typically icons for the placeholder, but when a actual image of type [Image] is used we need to change the height of the container.
        width: placeholderImage is Image
            ? 360
            : 382.0, // we are checking the placeholderImage type, we use typically icons for the placeholder, but when a actual image of type [Image] is used we need to change the width of the container.
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(6.0),
          color: const Color.fromARGB(64, 158, 158, 158),
        ),
        child: imagePath == null
            ? FittedBox(
                fit: BoxFit.contain,
                child: placeholderImage,
              )
            : Image.asset(
                imagePath!,
                fit: BoxFit.cover,
              ),
      )),
    );
  }
}
