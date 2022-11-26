import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/manager/manager_path_routes.dart';
import 'package:nobita/manager/manager_provider.dart';
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
        key: store.key,
        drawer: const ProfilePage(),
        body: Builder(
          builder: (context) => SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                child: Text('Nguyen Duc Hoa',
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
                                child: Text('nguyenduchoa.data@gmail.com',
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
                const ProfileCard(
                  accountNumber: '124121232139',
                  balance: '213439284',
                ),
                const SizedBox(height: Dimens.PADDING_LARGE),
                SizedBox(
                  height: 0.25.w(context) + 45,
                  width: 1.0.w(context),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: Dimens.SCREEN_PADDING),
                        child: BTNHomeFeature(
                          imagePath: Images.iconSend,
                          lable: S.of(context).send,
                          onPressed: () {},
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
                        padding:
                            const EdgeInsets.only(right: Dimens.SCREEN_PADDING),
                        child: BTNHomeFeature(
                          imagePath: Images.iconRocket,
                          lable: 'Recieve',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(Dimens.SCREEN_PADDING),
                    child: Text(S.of(context).history,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: AppColors.primary))),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) =>
                        const ItemHistoryTransfer(),
                    itemCount: 5,
                  ),
                )
              ],
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
}
