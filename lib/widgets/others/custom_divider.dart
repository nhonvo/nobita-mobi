import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nobita/theme/colors.dart';
import 'package:nobita/theme/dimens.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.PADDING_SMALL),
      child: Divider(color: Theme.of(context).dividerColor),
    );
  }
}
