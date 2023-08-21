import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tools_rental_management/app/app.dialogs.dart';
import 'package:tools_rental_management/enums/image_type.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';
import 'package:tools_rental_management/ui/reusable_widgets/custom_listtile.dart';
import 'package:tools_rental_management/ui/reusable_widgets/textStyle.dart';

import 'tool_user_viewmodel.dart';

class ToolUserView extends StackedView<ToolUserViewModel> {
  final int toolUserId;
  const ToolUserView({Key? key, required this.toolUserId}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolUserViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        // if the selectedTools is empty, we display a back button else we display a cancel button to des-select all selected tools to be disassociated.
        leading: viewModel.selectedTools.isEmpty
            ? IconButton(
                onPressed: () {
                  viewModel.navigateBackToToolUsers();
                },
                icon: const Icon(Icons.arrow_back_ios),
                color: Theme.of(context).colorScheme.onPrimary,
              )
            : IconButton(
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () => viewModel.clearSelectedTools(),
              ),
        centerTitle: true,
        title: viewModel.isAnyToolSelected
            ? Text(
                "${viewModel.selectedTools.length} tool${viewModel.selectedTools.length > 1 ? 's' : ''} selected",
                style: appBarTitleTextStyle(context, displayFontSizeMedium: true),
              )
            : Text(
                'Tool User',
                style: appBarTitleTextStyle(context),
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
        actions: viewModel.isAnyToolSelected
            ? [
                IconButton(
                  onPressed: () => viewModel.repossessToolsFromToolUser(),
                  icon: Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ]
            : null,
      ),
      body: DefaultTextStyle(
        style: switch (getThemeManager(context).selectedThemeMode) {
          ThemeMode.light => Theme.of(context).typography.white.bodySmall!,
          ThemeMode.dark => Theme.of(context).typography.black.bodySmall!,
          _ => throw ' configure ThemeMode.system',
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Tool user data container (first and last name, phone number, profile image).
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
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
                                  onTap: () => viewModel.navigateToImageView(imageType: ImageType.toolUserImage),
                                  child: viewModel.toolUser?.avatarImagePath == null
                                      ? const Icon(
                                          Icons.person,
                                          size: 120,
                                        )
                                      : Image.file(
                                          File(viewModel.toolUser!.avatarImagePath),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              right: 0.0,
                              child: IconButton(
                                onPressed: () => viewModel.showToolUserImageCaptureSheet(),
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
                                viewModel.toolUser?.firstName.toString() ?? 'null',
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
                                  viewModel.showFirstNameEditorDialog();
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
                                viewModel.toolUser?.lastName.toString() ?? 'null',
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
                                  viewModel.showLastNameEditorDialog();
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
                                '+${viewModel.toolUser?.countryCallingCode} ${viewModel.toolUser?.phoneNumber.toString()}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
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
                                  viewModel.showPhoneNumberEditorDialog();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpaceMedium,
              // this container provide a visible border for the wrapped ExpansionTile
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  Container(
                                    width: 178,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 0.5, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: viewModel.toolUser?.frontNationalIdImagePath == null
                                        ? GestureDetector(
                                            onTap: () => viewModel.navigateToImageView(imageType: ImageType.frontNationalIdImage),
                                            child: Image.asset(
                                              'lib/assets/images/front_national_id_placeholder.png',
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () => viewModel.navigateToImageView(imageType: ImageType.frontNationalIdImage),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(6),
                                              child: Image.file(
                                                File(viewModel.toolUser!.frontNationalIdImagePath),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
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
                                  Container(
                                    width: 178,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 0.5, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: viewModel.toolUser?.backNationalIdImagePath == null
                                        ? GestureDetector(
                                            onTap: () => viewModel.navigateToImageView(imageType: ImageType.backNationalIdImage),
                                            child: Image.asset(
                                              'lib/assets/images/back_national_id_placeholder.png',
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () => viewModel.navigateToImageView(imageType: ImageType.backNationalIdImage),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(6),
                                              child: Image.file(
                                                File(viewModel.toolUser!.backNationalIdImagePath),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
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
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Current tools used by ${viewModel.toolUser?.firstName} ${viewModel.toolUser?.lastName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: switch (getThemeManager(context).selectedThemeMode) {
                      ThemeMode.light => Theme.of(context).typography.white.bodyMedium,
                      ThemeMode.dark => Theme.of(context).typography.black.bodyMedium,
                      _ => throw ' configure ThemeMode.system',
                    },
                  ),
                ),
              ),
              verticalSpaceSmall,
              smallSpaceHorizontalDivider(context),
              Expanded(
                child: viewModel.toolUser?.tools == null
                    ? Center(
                        child: Text('click + button to add a tool for ${viewModel.toolUser?.firstName} ${viewModel.toolUser?.lastName}'),
                      )
                    : ListView.builder(
                        itemCount: viewModel.toolUser!.tools!.length,
                        itemBuilder: (context, index) {
                          var tool = viewModel.toolUser!.tools![index];
                          return InkWell(
                            onTap: () {
                              // checks if 'this' taped tool is selected already and is in the selectedTools
                              // if true, we deselect 'this' tool
                              if (viewModel.selectedTools.contains(tool)) {
                                viewModel.deselectTool(tool);
                                return;
                              }
                              // checks if any tool is selected, if true, we select 'this' taped unselected tool
                              if (viewModel.isAnyToolSelected) {
                                viewModel.selectTool(tool);
                                return;
                              }
                            },
                            onLongPress: () {
                              // do nothing if the tool that is being longPressed has already been selected
                              if (viewModel.selectedTools.contains(tool)) {
                                return;
                              }
                              viewModel.selectTool(tool);
                            },
                            child: Container(
                              color: viewModel.selectedTools.contains(tool)
                                  ? selectedToolBackGroundColor(context)
                                  : null, // we are checking if our selectedTools list contains a tool that was long pressed or pressed(when isAnyToolSelected is true)
                              padding: const EdgeInsets.only(left: 16.0, right: 5.0, top: 10.0, bottom: 10.0),
                              child: CustomListTile(
                                contentVerticalAlignment: CrossAxisAlignment.start,
                                leading: Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context).colorScheme.secondary,
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                    //color: const Color.fromARGB(64, 158, 158, 158),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.file(
                                      File(tool.toolImagePath),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  tool.name,
                                  style: switch (getThemeManager(context).selectedThemeMode) {
                                    ThemeMode.light => Theme.of(context).typography.white.titleMedium!,
                                    ThemeMode.dark => Theme.of(context).typography.black.titleMedium!,
                                    _ => throw ' configure ThemeMode.system',
                                  },
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Category : ',
                                            style: subtitleFirstSubStringTextStyle(context),
                                          ),
                                          TextSpan(
                                            text: tool.category.name,
                                            style: subtitleLastSubStringTextStyle(context),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Rate : ',
                                            style: subtitleFirstSubStringTextStyle(context),
                                          ),
                                          TextSpan(
                                            text: 'ksh ${tool.rate} / hr',
                                            style: subtitleLastSubStringTextStyle(context),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Tool unique id : ',
                                            style: subtitleFirstSubStringTextStyle(context),
                                          ),
                                          TextSpan(
                                            text: tool.toolUniqueId.toString(),
                                            style: subtitleLastSubStringTextStyle(context),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                trailing: viewModel
                                        .isAnyToolSelected // if any ToolTile is selected, we remove the IconButton preventing the user from accidentally pressing it to disassociate that particular Tool( reducing the complexity of the code)
                                    ? null
                                    : IconButton(
                                        visualDensity: VisualDensity.compact,
                                        iconSize: 26,
                                        icon: const Icon(Icons.remove_circle_outline),
                                        onPressed: () => viewModel.showToolRepossessionConfirmDialog(tool),
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => viewModel.showSelectedToolSheet(),
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primary,
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary),
    );
  }

  @override
  ToolUserViewModel viewModelBuilder(BuildContext context) => ToolUserViewModel();

  @override
  void onViewModelReady(ToolUserViewModel viewModel) {
    // pass in the toolUserId to the viewModel to initialize it with the toolUser data model from database
    viewModel.initState(toolUserId);
    super.onViewModelReady(viewModel);
  }
}

// Color.fromARGB(97, 97, 97, 1)
