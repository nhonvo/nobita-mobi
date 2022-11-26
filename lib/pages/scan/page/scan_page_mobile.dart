import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/pages/scan/store/scan_store.dart';
import 'package:nobita/theme/colors.dart';
import 'package:nobita/theme/dimens.dart';
import 'package:nobita/widgets/headers/std_appbar.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPageMobile extends StatelessWidget {
  final ScanStore store;
  const ScanPageMobile({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          STDAppBar(context, title: S.of(context).scan, isShowBackButton: true),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 1.0.h(context),
            width: 1.0.w(context),
            child: QRView(
                key: store.qrKey,
                onQRViewCreated: (controller) async {
                  await store.onQRViewCreated(controller, context);
                },
                overlayMargin: const EdgeInsets.all(Dimens.SCREEN_PADDING)),
          ),
          Container(
            height: 0.45.w(context),
            width: 0.45.w(context),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary, width: 3)),
          )
        ],
      ),
    );
  }
}
