import 'package:flutter/material.dart';
import 'package:tools_rental_management/ui/common/ui_helpers.dart';

class CustomListTile extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  const CustomListTile({
    super.key,
    this.padding,
    this.leading,
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
          horizontalSpaceSmall,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title ?? const Text(''),
                subtitle ?? const Text(''),
              ],
            ),
          ),
          trailing ?? const SizedBox(),
        ],
      ),
    );
  }
}
