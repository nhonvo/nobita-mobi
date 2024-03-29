import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nobita/enums/enum_languages.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/manager/manager_key_storage.dart';
import 'package:nobita/manager/manager_path_routes.dart';
import 'package:nobita/manager/manager_provider.dart';
import 'package:nobita/pages/profile/store/profile_store.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/theme/images.dart';
import 'package:nobita/widgets/buttons/btn_text_icon.dart';
import 'package:nobita/widgets/buttons/swipe_languages.dart';
import 'package:nobita/widgets/dialogs/confirm_dialog.dart';

class ProfilePageMobile extends StatelessWidget {
  final ProfileStore store;
  const ProfilePageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 0.8.w(context),
        height: 1.0.h(context),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius:
              const BorderRadius.horizontal(right: Radius.circular(26)),
        ),
        child: ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(26)),
            child: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.SCREEN_PADDING,
                        vertical: Dimens.SCREEN_PADDING),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(S.of(context).updateInfo,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .primaryColor)),
                                const SizedBox(height: Dimens.PADDING_LARGE),
                                GestureDetector(
                                  onTap: () {
                                    BaseNavigation.push(context,
                                        routeName:
                                            ManagerRoutes.changePassword);
                                  },
                                  child: Text(S.of(context).changePassword,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium),
                                ),
                                const SizedBox(height: Dimens.PADDING_LARGE),
                                Text(S.of(context).settings,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .primaryColor)),
                                const SizedBox(height: Dimens.PADDING_LARGE),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(S.of(context).languages,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium),
                                      Observer(
                                          builder: (_) => SwipeLanguages(
                                                onTapVi: () async {
                                                  await store.setLanguages(
                                                      context,
                                                      languageCode:
                                                          EnumLanguages
                                                              .vi.name);
                                                },
                                                onTapEn: () async {
                                                  await store.setLanguages(
                                                      context,
                                                      languageCode:
                                                          EnumLanguages
                                                              .en.name);
                                                },
                                                isEn: store.isEn,
                                              ))
                                    ]),
                                const SizedBox(height: Dimens.PADDING_MEDIUM),
                                BTNTextIcon(
                                  onPressedIcon: _onPressedToggleTheme,
                                  lable: S.of(context).themes,
                                  iconPath: Images.iconTheme,
                                ),
                              ]),
                          BTNTextIcon(
                            onPressedIcon: () {
                              _onPressedLogout.call(context);
                            },
                            lable: S.of(context).logout,
                            iconPath: Images.iconLogout,
                            color: Theme.of(context).errorColor,
                          )
                        ])))));
  }

  void _onPressedToggleTheme() {
    store.appStore.toggleTheme();
  }

  Future<void> _onPressedLogout(BuildContext context) async {
    confirmDialog(context,
        textConfirm: S.of(context).logout,
        icon: Icons.logout,
        hightLight: ' ' + S.of(context).logout + '?',
        title: S.of(context).confirmAreYou, onConfirm: () async {
      await BaseSharedPreferences.remove(ManagerKeyStorage.user);
      ManagerProvider.dispose(context);
      BaseNavigation.push(context,
          routeName: ManagerRoutes.login, clearStack: true);
    });
  }
}
