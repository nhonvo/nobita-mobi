import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/pages/splash/page/splash_page_mobile.dart';
import 'package:nobita/pages/splash/store/splash_store.dart';

class SplashPage extends BaseScreen {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends BaseScreenState<SplashPage, SplashStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return SplashPageMobile(store);
  }
}
