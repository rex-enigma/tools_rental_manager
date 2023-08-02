import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tools_rental_management/main.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tool User',
          style: switch (MyApp.of(context).themeMode) {
            ThemeMode.light => Theme.of(context).typography.white.bodyLarge,
            ThemeMode.dark => Theme.of(context).typography.black.bodyLarge,
            _ => throw 'configure ThemeMode.system',
          },
        ),
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: switch (MyApp.of(context).themeMode) {
              ThemeMode.light => 0.5,
              ThemeMode.dark => 0.1,
              _ => throw 'configure ThemeMode.system',
            },
          ),
        ),
      ),
      body: DefaultTextStyle(
        style: switch (MyApp.of(context).themeMode) {
          ThemeMode.light => Theme.of(context).typography.white.bodyMedium!,
          ThemeMode.dark => Theme.of(context).typography.black.bodyMedium!,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
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
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
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
                              'John',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: InkWell(
                              child: Icon(
                                Icons.edit,
                                size: 26,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              onTap: () {
                                // implementation for change the first name
                                print('working');
                              },
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                          // ListTile(
                          //   leading: Icon(
                          //     Icons.person,
                          //     color: Theme.of(context).colorScheme.secondary,
                          //   ),
                          //   title: Text(
                          //     'Last name',
                          //     style: TextStyle(
                          //       color: Theme.of(context).colorScheme.secondary,
                          //     ),
                          //   ),
                          //   subtitle: Text(
                          //     'doe',
                          //     maxLines: 1,
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          //   trailing: InkWell(
                          //     child: Icon(
                          //       Icons.edit,
                          //       size: 26,
                          //       color: Theme.of(context).colorScheme.secondary,
                          //     ),
                          //     onTap: () {
                          //       // implementation for change the first name
                          //       print('working');
                          //     },
                          //   ),
                          //   contentPadding: EdgeInsets.zero,
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ToolUserViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ToolUserViewModel();
}
