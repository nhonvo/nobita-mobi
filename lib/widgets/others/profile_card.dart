import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/theme/colors.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/theme/images.dart';
import 'package:nobita/theme/shadows.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart' as intl;

class ProfileCard extends StatelessWidget {
  final String accountNumber;
  final String balance;
  const ProfileCard(
      {super.key, required this.accountNumber, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
      padding: const EdgeInsets.all(Dimens.SCREEN_PADDING),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(Dimens.RADIUS_MEDIUM),
        boxShadow: Shadows.shadow3(context),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            AppColors.primary,
            AppColors.red,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).balance,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: AppColors.white)),
                    Text(
                      intl.NumberFormat.decimalPattern().format(int.tryParse(
                              balance.substring(
                                  0,
                                  (balance.length > 3)
                                      ? balance.length - 3
                                      : 0)) ??
                          0),
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: AppColors.white),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              QrImage(
                data: accountNumber,
                version: QrVersions.auto,
                size: 0.2.w(context),
                foregroundColor: AppColors.white,
              ),
            ],
          ),
          const SizedBox(
            height: Dimens.PADDING_XX_LARGE,
          ),
          GestureDetector(
            onTap: () {
              BaseUtils.copy(
                context,
                content: accountNumber,
                text: S.of(context).copied,
                bgColor: Theme.of(context).primaryColor,
              );
            },
            child: Row(
              children: [
                Text(
                  accountNumber,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
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
        ],
      ),
    );
  }
}
