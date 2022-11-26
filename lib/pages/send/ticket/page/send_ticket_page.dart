import 'package:coder0211/coder0211.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nobita/pages/send/ticket/page/send_ticket_page_mobile.dart';
import 'package:nobita/pages/send/ticket/store/send_ticket_store.dart';

class SendTicketPage extends BaseScreen {
  const SendTicketPage({super.key});

  @override
  State<SendTicketPage> createState() => _SendTicketPageState();
}

class _SendTicketPageState
    extends BaseScreenState<SendTicketPage, SendTicketStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return SendTicketPageMobile(store: store);
  }
}
