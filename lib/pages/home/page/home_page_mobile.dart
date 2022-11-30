import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/manager/manager_path_routes.dart';
import 'package:nobita/pages/home/store/home_store.dart';
import 'package:nobita/pages/profile/page/profile_page.dart';
import 'package:nobita/theme/colors.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/theme/images.dart';
import 'package:nobita/widgets/buttons/btn_home_feature.dart';
import 'package:nobita/widgets/others/custom_circle_avatar.dart';
import 'package:nobita/widgets/others/item_history_transfer.dart';
import 'package:nobita/widgets/others/profile_card.dart';

class HomePageMobile extends StatelessWidget {
  final HomeStore store;
  const HomePageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const ProfilePage(),
        body: Builder(
          builder: (context) => RefreshIndicator(
            onRefresh: () async {
              store.onWidgetBuildDone(context);
            },
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: Dimens.SCREEN_PADDING),
                  Row(children: [
                    const SizedBox(width: Dimens.SCREEN_PADDING),
                    GestureDetector(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: const CustomCircleAvatar(
                        imageUrl: Consts.DEFAULT_AVATAR,
                        width: Dimens.ICON_XX_LARGE,
                        isShowBordered: true,
                        borderColor: AppColors.primary,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Dimens.SCREEN_PADDING),
                                  child: Text(
                                      store.loginStore.user.fullName ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                ),
                                const SizedBox(
                                  height: Dimens.PADDING_X_SMALL,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Dimens.SCREEN_PADDING),
                                  child: Text(store.loginStore.user.email ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: Dimens.PADDING_X_SMALL),
                    GestureDetector(
                      onTap: () => _onPressedScan.call(context),
                      child: BaseSVG(
                          path: Images.iconScan,
                          height: Dimens.ICON_LARGE,
                          color: Theme.of(context).highlightColor),
                    ),
                    const SizedBox(width: Dimens.SCREEN_PADDING),
                  ]),
                  const SizedBox(height: Dimens.SCREEN_PADDING),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: Dimens.SCREEN_PADDING),
                        Observer(builder: (_) {
                          return ProfileCard(
                            accountNumber:
                                store.loginStore.user.accountNo ?? '',
                            balance: store.loginStore.user.balance ?? '0',
                          );
                        }),
                        const SizedBox(height: Dimens.PADDING_LARGE),
                        SizedBox(
                          height: 0.25.w(context) + 45,
                          width: 1.0.w(context),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: Dimens.SCREEN_PADDING),
                                child: BTNHomeFeature(
                                  imagePath: Images.iconSend,
                                  lable: S.of(context).send,
                                  onPressed: () {
                                    _onPressedSend.call(context);
                                  },
                                ),
                              ),
                              BTNHomeFeature(
                                imagePath: Images.iconReceive,
                                lable: S.of(context).receive,
                                onPressed: () {
                                  _onPressedReceive.call(context);
                                },
                              ),
                              BTNHomeFeature(
                                imagePath: Images.iconLixi,
                                lable: S.of(context).lixi,
                                onPressed: () {},
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: Dimens.SCREEN_PADDING),
                                child: BTNHomeFeature(
                                  imagePath: Images.iconRocket,
                                  lable: 'Recieve',
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Observer(builder: (_) {
                          return (store.dropdownMonths.isNotEmpty &&
                                  store.dropdownYears.isNotEmpty &&
                                  store.selectedMonth != '' &&
                                  store.selectedYear != '')
                              ? Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(
                                            Dimens.SCREEN_PADDING),
                                        child: Text(S.of(context).history,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium
                                                ?.copyWith(
                                                    color: AppColors.primary))),
                                    const Spacer(),
                                    Text(
                                      S.of(context).month + ' ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    Observer(builder: (_) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: Dimens.PADDING_SMALL),
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .highlightColor
                                                .withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(
                                                Dimens.RADIUS_SMALL)),
                                        child: DropdownButton(
                                          alignment: Alignment.center,
                                          borderRadius: BorderRadius.circular(
                                              Dimens.RADIUS_MEDIUM),
                                          value: store.selectedMonth,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium,
                                          onChanged: (String? newValue) async {
                                            store.selectedMonth = newValue!;
                                            await store.getTransferHistory
                                                .call(context);
                                          },
                                          items: store.dropdownMonths,
                                          isExpanded: false,
                                          underline: const SizedBox.shrink(),
                                          icon: const SizedBox.shrink(),
                                        ),
                                      );
                                    }),
                                    Text(
                                      ':',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                    Observer(builder: (_) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: Dimens.PADDING_SMALL),
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .highlightColor
                                                .withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(
                                                Dimens.RADIUS_SMALL)),
                                        child: DropdownButton(
                                          alignment: Alignment.center,
                                          borderRadius: BorderRadius.circular(
                                              Dimens.RADIUS_MEDIUM),
                                          value: store.selectedYear,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium,
                                          onChanged: (String? newValue) async {
                                            store.selectedYear = newValue!;
                                            await store.getTransferHistory
                                                .call(context);
                                          },
                                          items: store.dropdownYears,
                                          isExpanded: false,
                                          underline: const SizedBox.shrink(),
                                          icon: const SizedBox.shrink(),
                                        ),
                                      );
                                    }),
                                    const SizedBox(
                                      width: Dimens.SCREEN_PADDING,
                                    )
                                  ],
                                )
                              : const SizedBox.shrink();
                        }),
                        Observer(builder: (_) {
                          return store.isShowLoading
                              ? Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 0.15.w(context)),
                                    child: BaseIndicator(
                                      colorsIndicator: [
                                        AppColors.blue,
                                        Theme.of(context).primaryColor
                                      ],
                                    ),
                                  ),
                                )
                              : store.historyTransfers.length == 0
                                  ? Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 0.15.w(context)),
                                        child: Text(
                                            S
                                                .of(context)
                                                .transferHistoryIsEmpty,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    color: Theme.of(context)
                                                        .primaryColor)),
                                      ),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              ItemHistoryTransfer(
                                        item: store.historyTransfers[index],
                                        myId: store.loginStore.user.id ?? '',
                                      ),
                                      itemCount: store.historyTransfers.length,
                                    );
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _onPressedReceive(BuildContext context) {
    BaseNavigation.push(context, routeName: ManagerRoutes.receive);
  }

  void _onPressedScan(BuildContext context) {
    BaseNavigation.push(context, routeName: ManagerRoutes.scan);
  }

  void _onPressedSend(BuildContext context) {
    BaseNavigation.push(context, routeName: ManagerRoutes.send);
  }
}
