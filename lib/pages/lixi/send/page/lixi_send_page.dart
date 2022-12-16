import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/pages/lixi/send/page/lixi_send_page_mobile.dart';
import 'package:nobita/pages/lixi/send/store/lixi_send_store.dart';

class LixiSendPage extends BaseScreen {
  const LixiSendPage({super.key});

  @override
  State<LixiSendPage> createState() => _LixiSendPageState();
}

class _LixiSendPageState extends BaseScreenState<LixiSendPage, LixiSendStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return LixiSendPageMobile(store: store);
  }
}
