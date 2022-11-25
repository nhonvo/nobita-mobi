import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/theme/dimens.dart';

class BTNHomeFeature extends StatelessWidget {
  final String imagePath;
  final String lable;
  final VoidCallback onPressed;
  const BTNHomeFeature(
      {super.key,
      required this.imagePath,
      required this.lable,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed.call();
      },
      child: Container(
        padding: const EdgeInsets.all(Dimens.PADDING_X_SMALL),
        margin: const EdgeInsets.all(Dimens.PADDING_X_SMALL),
        decoration: BoxDecoration(
            color: Theme.of(context).dividerColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(Dimens.RADIUS_SMALL)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              height: 0.25.w(context),
            ),
            const SizedBox(height: Dimens.PADDING_MEDIUM),
            Text(
              lable,
              style: Theme.of(context).textTheme.displaySmall,
            )
          ],
        ),
      ),
    );
  }
}
