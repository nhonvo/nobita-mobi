import 'package:coder0211/coder0211.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nobita/pages/lixi/receive/page/lixi_receive_page_mobile.dart';
import 'package:nobita/pages/lixi/receive/store/lixi_receive_store.dart';

class LixiReceivePage extends BaseScreen {
  const LixiReceivePage({super.key});

  @override
  State<LixiReceivePage> createState() => _LixiReceivePageState();
}

class _LixiReceivePageState
    extends BaseScreenState<LixiReceivePage, LixiReceiveStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return LixiReceivePageMobile(store: store);
  }
}
