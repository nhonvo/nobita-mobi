import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/pages/register/store/register_store.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/widgets/headers/std_appbar.dart';
import 'package:nobita/widgets/inputs/custom_text_field.dart';

class RegisterPageMobile extends StatelessWidget {
  final RegisterStore store;
  const RegisterPageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: STDAppBar(context, title: S.of(context).createNewAccount),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 0.1.w(context)),
              CustomTextField(
                bgColor: Theme.of(context).backgroundColor,
                cusorColor: Theme.of(context).highlightColor,
                isEditMode: true,
                style: Theme.of(context).textTheme.displaySmall,
                hintText: S.of(context).hintFullName,
                borderColor: Theme.of(context).dividerColor.withOpacity(0.2),
                title: S.of(context).fullname,
              ),
              const SizedBox(
                height: Dimens.PADDING_MEDIUM,
              ),
              CustomTextField(
                bgColor: Theme.of(context).backgroundColor,
                cusorColor: Theme.of(context).highlightColor,
                isEditMode: true,
                style: Theme.of(context).textTheme.displaySmall,
                hintText: S.of(context).hintUserName,
                borderColor: Theme.of(context).dividerColor.withOpacity(0.2),
                title: S.of(context).username,
              ),
              const SizedBox(
                height: Dimens.PADDING_MEDIUM,
              ),
              CustomTextField(
                bgColor: Theme.of(context).backgroundColor,
                cusorColor: Theme.of(context).highlightColor,
                isEditMode: true,
                style: Theme.of(context).textTheme.displaySmall,
                hintText: S.of(context).hintEmail,
                borderColor: Theme.of(context).dividerColor.withOpacity(0.2),
                title: S.of(context).email,
              ),
              const SizedBox(
                height: Dimens.PADDING_MEDIUM,
              ),
              CustomTextField(
                bgColor: Theme.of(context).backgroundColor,
                cusorColor: Theme.of(context).highlightColor,
                isEditMode: true,
                style: Theme.of(context).textTheme.displaySmall,
                hintText: S.of(context).hintPhone,
                borderColor: Theme.of(context).dividerColor.withOpacity(0.2),
                title: S.of(context).phone,
              ),
              const SizedBox(
                height: Dimens.PADDING_MEDIUM,
              ),
              CustomTextField(
                bgColor: Theme.of(context).backgroundColor,
                cusorColor: Theme.of(context).highlightColor,
                isEditMode: true,
                style: Theme.of(context).textTheme.displaySmall,
                hintText: S.of(context).hintPassword,
                borderColor: Theme.of(context).dividerColor.withOpacity(0.2),
                title: S.of(context).password,
              ),
              const SizedBox(
                height: Dimens.PADDING_MEDIUM,
              ),
              CustomTextField(
                bgColor: Theme.of(context).backgroundColor,
                cusorColor: Theme.of(context).highlightColor,
                isEditMode: true,
                style: Theme.of(context).textTheme.displaySmall,
                hintText: S.of(context).hintPassword,
                borderColor: Theme.of(context).dividerColor.withOpacity(0.2),
                title: S.of(context).confirmPassword,
              ),
              const SizedBox(
                height: Dimens.PADDING_MEDIUM,
              ),
              const SizedBox(
                height: Dimens.PADDING_XX_LARGE,
              ),
              BaseButton(
                  bgColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    store.onPressedRegister(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(S.of(context).register,
                          style: Theme.of(context).textTheme.labelLarge)
                    ],
                  )),
              const SizedBox(
                height: Dimens.PADDING_MEDIUM,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    store.onPressedIHaveAccount(context);
                  },
                  child: Text(S.of(context).iHaveAccount,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
