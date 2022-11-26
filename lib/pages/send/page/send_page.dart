import 'package:coder0211/coder0211.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nobita/pages/send/page/send_page_mobile.dart';
import 'package:nobita/pages/send/store/send_store.dart';

class SendPage extends BaseScreen {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends BaseScreenState<SendPage, SendStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return SendPageMobile(store: store);
  }
}
