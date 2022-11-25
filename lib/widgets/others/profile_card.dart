import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/theme/images.dart';
import 'package:nobita/theme/shadows.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String accountNumber;
  final String balance;
  const ProfileCard(
      {super.key,
      required this.name,
      required this.email,
      required this.accountNumber,
      required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
      padding: const EdgeInsets.all(Dimens.SCREEN_PADDING),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(Dimens.RADIUS_MEDIUM),
        boxShadow: Shadows.shadow3(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Theme.of(context).primaryColor)),
          const SizedBox(
            height: Dimens.PADDING_X_SMALL,
          ),
          Text(email, style: Theme.of(context).textTheme.displaySmall),
          Row(
            children: [
              Text(S.of(context).accountNumber,
                  style: Theme.of(context).textTheme.displaySmall),
              Text(accountNumber,
                  style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
          const SizedBox(
            height: Dimens.PADDING_MEDIUM,
          ),
          Row(
            children: [
              Text(S.of(context).balance,
                  style: Theme.of(context).textTheme.displaySmall),
              Text(
                balance,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              BaseSVG(
                path: Images.iconCopy,
                height: Dimens.ICON_SMALL,
                color: Theme.of(context).primaryColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
