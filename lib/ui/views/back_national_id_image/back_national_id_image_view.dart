import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/ui/reusable_widgets/image_view_layout.dart';

import 'back_national_id_image_viewmodel.dart';

class BackNationalIdImageView
    extends StackedView<BackNationalIdImageViewModel> {
  const BackNationalIdImageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BackNationalIdImageViewModel viewModel,
    Widget? child,
  ) {
    return ImageView(
      title: 'Back id',
      imagePath: viewModel.backNationalIdImagePath,
      placeholderImage: Image.asset(
        'lib/assets/images/back_national_id_placeholder.png',
      ),
      onPressedEditButton: () => viewModel.showNationalIdImageCapture(),
      navigateBack: () => Navigator.of(context).pop(),
    );
  }

  @override
  BackNationalIdImageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BackNationalIdImageViewModel();
}
