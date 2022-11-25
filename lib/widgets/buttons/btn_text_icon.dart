import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/theme/dimens.dart';

class BTNTextIcon extends StatelessWidget {
  final VoidCallback onPressedIcon;
  final String lable;
  final String iconPath;
  final Color? color;

  const BTNTextIcon(
      {super.key,
      required this.onPressedIcon,
      required this.lable,
      required this.iconPath,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(lable, style: Theme.of(context).textTheme.displayMedium),
        GestureDetector(
          onTap: onPressedIcon,
          child: BaseSVG(
            color: color ?? Theme.of(context).highlightColor,
            path: iconPath,
            height: Dimens.ICON_LARGE,
          ),
        )
      ],
    );
  }
}
