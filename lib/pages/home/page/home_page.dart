import 'package:coder0211/coder0211.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nobita/pages/home/page/home_page_mobile.dart';
import 'package:nobita/pages/home/store/home_store.dart';

class HomePage extends BaseScreen {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseScreenState<HomePage, HomeStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return HomePageMobile(store: store);
  }
}
