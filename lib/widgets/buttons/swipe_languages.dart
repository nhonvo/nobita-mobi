import 'package:flutter/material.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/theme/images.dart';

class SwipeLanguages extends StatelessWidget {
  final VoidCallback onTapVi;
  final VoidCallback onTapEn;
  final bool isEn;
  const SwipeLanguages(
      {Key? key,
      required this.onTapVi,
      required this.onTapEn,
      required this.isEn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _buildItem(
            context,
            icon: Images.iconLanguageVi,
            isLeft: true,
            isSelected: !isEn,
            onTap: onTapVi,
          ),
          _buildItem(
            context,
            icon: Images.iconLanguageEn,
            isLeft: false,
            isSelected: isEn,
            onTap: onTapEn,
          )
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context,
      {required bool isLeft,
      required String icon,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
            left: isLeft ? const Radius.circular(26) : Radius.zero,
            right: !isLeft ? const Radius.circular(26) : Radius.zero),
        child: Image.asset(
          icon,
          color: !isSelected
              ? Theme.of(context).backgroundColor.withOpacity(0.7)
              : null,
          colorBlendMode: BlendMode.srcOver,
          height: Dimens.ICON_LARGE,
        ),
      ),
    );
  }
}
