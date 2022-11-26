import 'package:coder0211/coder0211.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nobita/pages/receive/page/receive_page_mobile.dart';
import 'package:nobita/pages/receive/store/receive_store.dart';

class ReceivePage extends BaseScreen {
  const ReceivePage({super.key});

  @override
  State<ReceivePage> createState() => _ReceivePageState();
}

class _ReceivePageState extends BaseScreenState<ReceivePage, ReceiveStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return ReceivePageMobile(store: store);
  }
}
