import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:nobita/pages/send/otp/page/send_otp_page_mobile.dart';
import 'package:nobita/pages/send/otp/store/send_otp_store.dart';

class SendOTPPage extends BaseScreen {
  const SendOTPPage({super.key});

  @override
  State<SendOTPPage> createState() => _SendOTPPageState();
}

class _SendOTPPageState extends BaseScreenState<SendOTPPage, SendOTPStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return SendOTPPageMobile(key: UniqueKey(), store: store);
  }

  @override
  bool get wantKeepAlive => false;
}
