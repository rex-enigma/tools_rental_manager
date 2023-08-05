import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/main.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:tools_rental_management/ui/reusable_widgets/custom_listtile.dart';

import 'tool_user_viewmodel.dart';

class ToolUserView extends StackedView<ToolUserViewModel> {
  const ToolUserView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolUserViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        centerTitle: true,
        title: Text(
          'Tool User',
          style: switch (getThemeManager(context).selectedThemeMode) {
            ThemeMode.light => Theme.of(context).typography.white.bodyLarge,
            ThemeMode.dark => Theme.of(context).typography.black.bodyLarge,
            _ => throw 'configure ThemeMode.system',
          },
        ),
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: switch (getThemeManager(context).selectedThemeMode) {
              ThemeMode.light => 0.5,
              ThemeMode.dark => 0.1,
              _ => throw 'configure ThemeMode.system',
            },
          ),
        ),
      ),
      body: DefaultTextStyle(
        style: switch (getThemeManager(context).selectedThemeMode) {
          ThemeMode.light => Theme.of(context).typography.white.bodySmall!,
          ThemeMode.dark => Theme.of(context).typography.black.bodySmall!,
          _ => throw ' configure ThemeMode.system',
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Tool user data container (first and last name, phone number, profile image).
              Container(
                height: 160,
                width: screenWidth(context),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipOval(
                              child: GestureDetector(
                                onTap: () {
                                  // navigate to ToolUserImageView
                                  // navigation implementation will be done in the ToolUserViewModel
                                },
                                child: viewModel.avatarImagePath == null
                                    ? const Icon(
                                        Icons.person,
                                        size: 120,
                                      )
                                    : Image.asset(
                                        viewModel.avatarImagePath!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            child: IconButton(
                              onPressed: () {
                                // capture a new photo of the person or get the photo from gallery.
                                // Implementation will be done in the ToolUserViewModel.
                              },
                              icon: Icon(
                                Icons.photo_camera,
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              iconSize: 32.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomListTile(
                            leading: Icon(
                              Icons.person,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            title: Text(
                              'First name',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            subtitle: Text(
                              viewModel.firstName ?? 'john',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: InkWell(
                              child: Icon(
                                Icons.edit,
                                size: 26.0,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              onTap: () {
                                // implementation for change the first name
                                print('working');
                              },
                            ),
                          ),
                          CustomListTile(
                            leading: Icon(
                              Icons.person,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            title: Text(
                              'Last name',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            subtitle: Text(
                              viewModel.lastName ?? 'doe',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            trailing: InkWell(
                              child: Icon(
                                Icons.edit,
                                size: 26.0,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              onTap: () {
                                // implementation for change the last name
                                print('working');
                              },
                            ),
                          ),
                          CustomListTile(
                            leading: Icon(
                              Icons.phone,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            title: Text(
                              'Phone',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            subtitle: Text(
                              viewModel.phoneNumber?.toString() ?? '+254798321598',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            trailing: InkWell(
                              child: Icon(
                                Icons.edit,
                                size: 26.0,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              onTap: () {
                                // implementation for change the phone number
                                print('working');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceMedium,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onPrimary,
                    width: switch (getThemeManager(context).selectedThemeMode) {
                      ThemeMode.light => 0.5,
                      ThemeMode.dark => 0.1,
                      _ => throw 'configure ThemeMode.system',
                    },
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                // This Theme is here to remove both top and bottom borders color of the ExpansionTile

                child: Theme(
                  // since ExpansionTile inherit both top and bottom border color from the global ThemeData.dividerColor, we set it to Colors.transparent
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Center(
                      child: Text(
                        'National id',
                        // the text in ExpansionTile is unable to inherit our explicitly defined DefaultTextStyle, since ExpansionTile has its own DefaultTextStyle which is override ours
                        // so we set directly set the style
                        style: switch (getThemeManager(context).selectedThemeMode) {
                          ThemeMode.light => Theme.of(context).typography.white.bodySmall!,
                          ThemeMode.dark => Theme.of(context).typography.black.bodySmall!,
                          _ => throw ' configure ThemeMode.system',
                        },
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Front',
                                  style: switch (getThemeManager(context).selectedThemeMode) {
                                    ThemeMode.light => TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).colorScheme.onPrimary,
                                      ),
                                    ThemeMode.dark => TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).colorScheme.onPrimary,
                                      ),
                                    _ => throw ' configure ThemeMode.system',
                                  },
                                ),
                                viewModel.frontNationalIdImagePath == null
                                    ? GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'lib/assets/images/front_national_id_placeholder.png',
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          viewModel.frontNationalIdImagePath!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Back',
                                  style: switch (getThemeManager(context).selectedThemeMode) {
                                    ThemeMode.light => TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).colorScheme.onPrimary,
                                      ),
                                    ThemeMode.dark => TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).colorScheme.onPrimary,
                                      ),
                                    _ => throw ' configure ThemeMode.system',
                                  },
                                ),
                                viewModel.backNationalIdImagePath == null
                                    ? GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'lib/assets/images/back_national_id_placeholder.png',
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          viewModel.backNationalIdImagePath!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                    iconColor: Theme.of(context).colorScheme.onPrimary,
                    collapsedIconColor: Theme.of(context).colorScheme.onPrimary,
                    tilePadding: EdgeInsets.zero,
                  ),
                ),
              ),
              verticalSpaceMedium,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Current tools used by ${viewModel.firstName ?? 'john'} ${viewModel.lastName ?? 'doe'}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: switch (getThemeManager(context).selectedThemeMode) {
                    ThemeMode.light => Theme.of(context).typography.white.bodyMedium,
                    ThemeMode.dark => Theme.of(context).typography.black.bodyMedium,
                    _ => throw ' configure ThemeMode.system',
                  },
                ),
              ),
              verticalSpaceSmall,
              smallSpaceHorizontalDivider(context),
              // List of Tools used by The toolUser
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primary,
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary),
    );
  }

  @override
  ToolUserViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ToolUserViewModel();
}
