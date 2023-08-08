import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/ui/reusable_widgets/image_view.dart';

import 'front_national_id_image_viewmodel.dart';

class FrontNationalIdImageView extends StackedView<FrontNationalIdImageViewModel> {
  const FrontNationalIdImageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FrontNationalIdImageViewModel viewModel,
    Widget? child,
  ) {
    return ImageView(
      title: 'Front id',
      imagePath: viewModel.frontNationalIdImagePath,
      placeholderImage: Image.asset(
        'lib/assets/images/front_national_id_placeholder.png',
      ),
      onPressedEditButton: () => viewModel.showNationalIdImageCapture(),
    );
  }

  @override
  FrontNationalIdImageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FrontNationalIdImageViewModel();
}
