import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/pages/Main/page/Main_page_mobile.dart';
import 'package:nobita/pages/main/store/main_store.dart';

class MainPage extends BaseScreen {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends BaseScreenState<MainPage, MainStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return MainPageMobile(store);
  }
}
