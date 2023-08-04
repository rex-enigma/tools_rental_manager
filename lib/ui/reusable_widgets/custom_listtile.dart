import 'package:flutter/material.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';

class CustomListTile extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;

  /// horizontal space between leading an title/subtitle.
  final Widget? horizontalSpaceBtnLeadingAndTitle;
  const CustomListTile({
    super.key,
    this.padding,
    this.leading,
    this.horizontalSpaceBtnLeadingAndTitle = horizontalSpaceSmall,
    this.title,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading ?? const SizedBox(),
          horizontalSpaceBtnLeadingAndTitle!,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title ?? const SizedBox(),
                subtitle ?? const SizedBox(),
              ],
            ),
          ),
          trailing ?? const SizedBox(),
        ],
      ),
    );
  }
}
