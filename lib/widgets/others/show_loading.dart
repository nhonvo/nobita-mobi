import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/theme/colors.dart';

class ShowLoading extends StatelessWidget {
  final Widget child;
  final bool isShowLoading;
  const ShowLoading(
      {super.key, required this.child, this.isShowLoading = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Visibility(
            visible: isShowLoading,
            child: Container(
                height: 1.0.h(context),
                width: 1.0.w(context),
                color: Theme.of(context).disabledColor.withOpacity(0.3),
                child: BaseIndicator(
                  colorsIndicator: [
                    AppColors.blue,
                    Theme.of(context).primaryColor
                  ],
                )))
      ],
    );
  }
}
