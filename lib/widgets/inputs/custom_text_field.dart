import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nobita/theme/colors.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/theme/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final double? height;
  final bool isModePassword, autofocus, isModeBorder, isEditMode, isShowBG;
  final String? initialValue, hintText;
  final Function(TextEditingController)? onChanged;
  final Function(TextEditingController)? onSubmitted;
  final TextEditingController? textEditingController;
  final String obscuringCharacter;
  final TextStyle? style;
  final Color bgColor, borderColor, cusorColor;
  final Widget? prefixIcon;
  final int? maxLines, maxLength;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final List<TextInputFormatter> formatterList;
  final String? title;
  const CustomTextField({
    Key? key,
    this.hintText,
    this.isModeBorder = false,
    this.height,
    this.isModePassword = false,
    this.onChanged,
    this.onSubmitted,
    this.textEditingController,
    this.obscuringCharacter = '•',
    required this.bgColor,
    this.prefixIcon,
    this.maxLines,
    this.keyboardType,
    this.initialValue,
    required this.style,
    this.focusNode,
    this.autofocus = false,
    this.formatterList = const [],
    this.maxLength,
    this.borderColor = AppColors.transparent,
    this.isShowBG = false,
    required this.isEditMode,
    required this.cusorColor,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
            visible: title != null,
            child: Column(children: [
              Text(
                title ?? '',
                style: style,
              ),
              const SizedBox(
                height: Dimens.PADDING_SMALL,
              )
            ])),
        Container(
          decoration: BoxDecoration(
              color: !isShowBG
                  ? AppColors.transparent
                  : isEditMode
                      ? Theme.of(context).dividerColor.withOpacity(0.35)
                      : AppColors.transparent,
              borderRadius: BorderRadius.circular(8)),
          child: Container(
            decoration: BoxDecoration(
                color: !isShowBG
                    ? AppColors.transparent
                    : isEditMode
                        ? bgColor.withOpacity(0.8)
                        : AppColors.transparent,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(8)),
            width: 1.0.w(context),
            constraints: const BoxConstraints(
                minHeight: Dimens.MIN_HEIGHT,
                maxHeight: Dimens.MAX_HEIGHT,
                maxWidth: Dimens.MAX_WIDTH),
            child: TextFormField(
              cursorColor: cusorColor,
              keyboardType: keyboardType,
              maxLines: maxLines,
              controller: textEditingController,
              obscuringCharacter: obscuringCharacter,
              obscureText: isModePassword,
              initialValue: initialValue,
              style: style ?? AppTextStyles.body1(),
              enabled: isEditMode,
              autofocus: autofocus,
              focusNode: focusNode,
              inputFormatters: formatterList,
              maxLength: maxLength,
              onChanged: (_) {
                onChanged?.call(textEditingController!);
              },
              onFieldSubmitted: (_) {
                onSubmitted?.call(textEditingController!);
              },
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(Dimens.SCREEN_PADDING),
                hintText: hintText,
                hintStyle: (style ?? AppTextStyles.body1())
                    .copyWith(color: Theme.of(context).hintColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
