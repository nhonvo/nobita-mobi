import 'package:flutter/material.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/pages/splash/store/splash_store.dart';

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
          ],
        ),
      ),
    );
  }
}
