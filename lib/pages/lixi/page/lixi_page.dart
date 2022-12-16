import 'package:coder0211/coder0211.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nobita/pages/lixi/page/lixi_page_mobile.dart';
import 'package:nobita/pages/lixi/store/lixi_store.dart';

class LixiPage extends BaseScreen {
  const LixiPage({super.key});

  @override
  State<LixiPage> createState() => _LixiPageState();
}

class _LixiPageState extends BaseScreenState<LixiPage, LixiStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return LixiPageMobile(store: store);
  }
}
