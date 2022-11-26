import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/pages/receive/store/receive_store.dart';
import 'package:nobita/theme/colors.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/theme/images.dart';
import 'package:nobita/theme/shadows.dart';
import 'package:nobita/widgets/headers/std_appbar.dart';
import 'package:nobita/widgets/others/custom_circle_avatar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceivePageMobile extends StatelessWidget {
  final ReceiveStore store;
  const ReceivePageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: STDAppBar(context,
          title: S.of(context).receive, isShowBackButton: true),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(Dimens.SCREEN_PADDING),
          margin: const EdgeInsets.all(Dimens.SCREEN_PADDING),
          width: 1.0.w(context),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(Dimens.RADIUS_MEDIUM),
            boxShadow: Shadows.shadow3(context),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.primary,
                AppColors.red,
              ],
            ),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Transform.translate(
                offset: Offset(0, -0.3.w(context) / 2 - Dimens.SCREEN_PADDING),
                child: CustomCircleAvatar(
                  imageUrl: Consts.DEFAULT_AVATAR,
                  width: 0.3.w(context),
                  isShowBordered: true,
                  borderColor: AppColors.primary,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 0.3.w(context) / 2,
                  ),
                  QrImage(
                    data: '1234567890',
                    version: QrVersions.auto,
                    size: 0.45.w(context),
                    foregroundColor: Theme.of(context).highlightColor,
                  ),
                  const SizedBox(
                    height: Dimens.PADDING_LARGE,
                  ),
                  GestureDetector(
                    onTap: () {
                      BaseUtils.copy(
                        context,
                        content: '',
                        text: S.of(context).copied,
                        bgColor: Theme.of(context).primaryColor,
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '12323423432',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: AppColors.white),
                          maxLines: 1,
                        ),
                        const SizedBox(
                          width: Dimens.PADDING_MEDIUM,
                        ),
                        const BaseSVG(
                            path: Images.iconCopy,
                            width: Dimens.ICON_SMALL,
                            color: AppColors.white)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.PADDING_LARGE,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.SCREEN_PADDING),
                    child: Text('Nguyen Duc Hoa',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(color: AppColors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
