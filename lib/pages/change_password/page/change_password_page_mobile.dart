import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/pages/change_password/store/change_password_store.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/widgets/headers/std_appbar.dart';
import 'package:nobita/widgets/inputs/custom_text_field.dart';
import 'package:nobita/widgets/others/show_loading.dart';

class ChangePasswordPageMobile extends StatelessWidget {
  final ChangePasswordStore store;
  const ChangePasswordPageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: STDAppBar(context,
            title: 'Change Password', isShowBackButton: true),
        body: Observer(
          builder: (_) => ShowLoading(
            isShowLoading: store.isShowLoading,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
              child: Column(
                children: [
                  SizedBox(
                    height: 0.3.w(context),
                  ),
                  CustomTextField(
                      bgColor: Theme.of(context).backgroundColor,
                      cusorColor: Theme.of(context).highlightColor,
                      isEditMode: true,
                      style: Theme.of(context).textTheme.displaySmall,
                      hintText: S.of(context).hintPassword,
                      borderColor:
                          Theme.of(context).dividerColor.withOpacity(0.2),
                      title: S.of(context).oldPassword,
                      isModePassword: true,
                      textEditingController: store.oldPasswordController,
                      maxLines: 1,
                      onChanged: (v) {
                        store.validation();
                      }),
                  const SizedBox(height: Dimens.PADDING_MEDIUM),
                  CustomTextField(
                    bgColor: Theme.of(context).backgroundColor,
                    cusorColor: Theme.of(context).highlightColor,
                    isEditMode: true,
                    style: Theme.of(context).textTheme.displaySmall,
                    hintText: S.of(context).hintPassword,
                    borderColor:
                        Theme.of(context).dividerColor.withOpacity(0.2),
                    title: S.of(context).newPassword,
                    isModePassword: true,
                    textEditingController: store.newPasswordController,
                    maxLines: 1,
                    onChanged: (v) {
                      store.validation();
                    },
                  ),
                  const SizedBox(height: Dimens.PADDING_MEDIUM),
                  CustomTextField(
                    bgColor: Theme.of(context).backgroundColor,
                    cusorColor: Theme.of(context).highlightColor,
                    isEditMode: true,
                    style: Theme.of(context).textTheme.displaySmall,
                    hintText: S.of(context).hintPassword,
                    borderColor:
                        Theme.of(context).dividerColor.withOpacity(0.2),
                    title: S.of(context).confirmPassword,
                    isModePassword: true,
                    textEditingController: store.confirmPasswordController,
                    maxLines: 1,
                    onChanged: (v) {
                      store.validation();
                    },
                  ),
                  const SizedBox(height: Dimens.PADDING_LARGE),
                  Observer(builder: (_) {
                    return BaseButton(
                        bgColor: (!store.isValid)
                            ? Theme.of(context).disabledColor
                            : Theme.of(context).primaryColor,
                        onPressed: () {
                          store.checkValidate(context);
                          if (store.isValid) {
                            store.changePassword(context);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).change,
                                style: Theme.of(context).textTheme.labelLarge)
                          ],
                        ));
                  }),
                ],
              ),
            ),
          ),
        ));
  }
}
