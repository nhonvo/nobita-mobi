import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/pages/home/page/home_page_mobile.dart';
import 'package:nobita/pages/home/store/home_store.dart';

class HomePage extends BaseScreen {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseScreenState<HomePage, HomeStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return HomePageMobile(store);
  }
}
