import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/pages/login/store/login_store.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/widgets/headers/std_appbar.dart';
import 'package:nobita/widgets/inputs/custom_text_field.dart';
import 'package:nobita/widgets/others/show_loading.dart';

class LoginPageMobile extends StatelessWidget {
  final LoginStore store;
  const LoginPageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: STDAppBar(context, title: S.of(context).login),
      body: Observer(
        builder: (_) => ShowLoading(
          isShowLoading: store.isShowLoading,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 0.45.w(context)),
                  CustomTextField(
                    bgColor: Theme.of(context).backgroundColor,
                    cusorColor: Theme.of(context).highlightColor,
                    isEditMode: true,
                    style: Theme.of(context).textTheme.displaySmall,
                    hintText: S.of(context).hintUserName,
                    borderColor:
                        Theme.of(context).dividerColor.withOpacity(0.2),
                    title: S.of(context).username,
                    textEditingController: store.userNameController,
                    onChanged: (v) {
                      store.validation.call();
                    },
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
                    borderColor:
                        Theme.of(context).dividerColor.withOpacity(0.2),
                    title: S.of(context).password,
                    isModePassword: true,
                    maxLines: 1,
                    textEditingController: store.passwordController,
                    onChanged: (v) {
                      store.validation.call();
                    },
                  ),
                  // const SizedBox(
                  //   height: Dimens.PADDING_MEDIUM,
                  // ),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: Text(S.of(context).forgotPassword,
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .displaySmall
                  //           ?.copyWith(
                  //               fontWeight: FontWeight.bold,
                  //               color: Theme.of(context).primaryColor)),
                  // ),
                  const SizedBox(
                    height: Dimens.PADDING_XX_LARGE,
                  ),
                  Observer(builder: (_) {
                    return BaseButton(
                        bgColor: (!store.isValid)
                            ? Theme.of(context).disabledColor
                            : Theme.of(context).primaryColor,
                        onPressed: () {
                          if (store.isValid)
                            store.onPressedLogin(context);
                          else
                            BaseUtils.showToast(S.of(context).pleaseFillAllData,
                                bgColor: Theme.of(context).primaryColor);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).login,
                                style: Theme.of(context).textTheme.labelLarge)
                          ],
                        ));
                  }),
                  const SizedBox(
                    height: Dimens.PADDING_MEDIUM,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        store.onPressedCreateANewAccount(context);
                      },
                      child: Text(S.of(context).createNewAccount,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
