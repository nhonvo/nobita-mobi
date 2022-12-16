import 'package:cached_network_image/cached_network_image.dart';
import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/data/const/consts.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/pages/lixi/receive/store/lixi_receive_store.dart';
import 'package:nobita/theme/colors.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/widgets/dialogs/confirm_dialog.dart';
import 'package:nobita/widgets/headers/std_appbar.dart';

class LixiReceivePageMobile extends StatelessWidget {
  final LixiReceiveStore store;
  const LixiReceivePageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: STDAppBar(context,
          title: S.of(context).lixiReceive, isShowBackButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.SCREEN_PADDING),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              height: 0.5.w(context),
              imageUrl: Consts.URL_IMAGE_LIXI_RECEIVE,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.contain)),
              ),
              placeholder: (context, url) => const BaseIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(height: Dimens.PADDING_LARGE),
            Text(S.of(context).pleaseWait,
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: Dimens.PADDING_LARGE),
            Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: () {
                      confirmDialog(context,
                          title: S.of(context).areYouSureYouWantToLeave + '?',
                          onConfirm: () {
                        _onTapLeave(context);
                      });
                    },
                    child: Text(S.of(context).leave,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: AppColors.red))))
          ],
        ),
      ),
    );
  }

  Future<void> _onTapLeave(BuildContext context) async {
    BaseNavigation.pop(context);
    await store.leaveRoom(context);
  }
}
