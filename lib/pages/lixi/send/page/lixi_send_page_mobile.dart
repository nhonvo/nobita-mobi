import 'package:cached_network_image/cached_network_image.dart';
import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/pages/lixi/send/store/lixi_send_store.dart';
import 'package:nobita/theme/colors.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/widgets/dialogs/confirm_dialog.dart';
import 'package:nobita/widgets/headers/std_appbar.dart';
import 'package:intl/intl.dart' as intl;

class LixiSendPageMobile extends StatelessWidget {
  final LixiSendStore store;
  const LixiSendPageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: STDAppBar(context,
            title: S.of(context).lixiSend, isShowBackButton: true),
        body: Observer(
          builder: (_) => BaseViewLoading(
            isLoading: store.isShowLoading,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: Dimens.PADDING_LARGE),
                CachedNetworkImage(
                  height: 0.5.w(context),
                  imageUrl: Consts.URL_IMAGE_LIXI_SEND,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.contain)),
                  ),
                  placeholder: (context, url) => const BaseIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(height: Dimens.PADDING_LARGE),
                Align(
                    alignment: Alignment.center,
                    child: Observer(builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimens.SCREEN_PADDING),
                        child: Text(
                            S.of(context).yourAreHavingLucky +
                                ' ' +
                                intl.NumberFormat.decimalPattern()
                                    .format(int.parse(
                                        (store.lixiRoom.amount ?? 0)
                                            .toString()))
                                    .toString() +
                                'vnd',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayMedium),
                      );
                    })),
                const SizedBox(height: Dimens.PADDING_LARGE),
                Text(S.of(context).participant,
                    style: Theme.of(context).textTheme.headlineSmall),
                Expanded(
                  child: Observer(builder: (_) {
                    return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimens.SCREEN_PADDING),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(store.participants[index].userName ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium),
                                const SizedBox(height: Dimens.PADDING_X_SMALL),
                                Text(store.participants[index].accountNo ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall),
                                Divider(color: Theme.of(context).dividerColor)
                              ],
                            ),
                          );
                        },
                        itemCount: store.participants.length);
                  }),
                ),
                const SizedBox(height: Dimens.PADDING_LARGE),
                GestureDetector(
                  onTap: () async {
                    confirmDialog(context,
                        title: S.of(context).confirmAreYou +
                            ' ' +
                            S.of(context).delete +
                            '?', onConfirm: () async {
                      BaseNavigation.pop(context);

                      BaseNavigation.pop(context);
                      await store.deleteRoom(context);
                    });
                  },
                  child: Text(
                    S.of(context).delete,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: AppColors.red),
                  ),
                ),
                const SizedBox(height: Dimens.PADDING_LARGE),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.SCREEN_PADDING),
                    child: BaseButton(
                        bgColor: Theme.of(context).primaryColor,
                        onPressed: () async {
                          BaseNavigation.pop(context);
                          await store.sendLixi(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).send,
                                style: Theme.of(context).textTheme.labelLarge)
                          ],
                        ))),
                const SizedBox(height: Dimens.PADDING_LARGE),
              ],
            ),
          ),
        ));
  }
}
