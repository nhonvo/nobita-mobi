import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/pages/splash/store/splash_store.dart';
import 'package:nobita/theme/colors.dart';

class SplashPageMobile extends StatelessWidget {
  final SplashStore store;
  const SplashPageMobile(this.store, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).app_name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Observer(builder: (_) {
              return Visibility(
                visible: store.isShowLoading,
                child: BaseIndicator(
                  colorsIndicator: [
                    AppColors.blue,
                    Theme.of(context).primaryColor
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
