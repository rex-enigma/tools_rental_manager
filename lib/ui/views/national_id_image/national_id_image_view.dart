import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'national_id_image_viewmodel.dart';

class NationalIdImageView extends StackedView<NationalIdImageViewModel> {
  const NationalIdImageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NationalIdImageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  NationalIdImageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NationalIdImageViewModel();
}
