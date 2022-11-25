import 'package:coder0211/coder0211.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nobita/pages/register/page/register_page_mobile.dart';
import 'package:nobita/pages/register/store/register_store.dart';

class RegisterPage extends BaseScreen {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseScreenState<RegisterPage, RegisterStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return RegisterPageMobile(store: store);
  }
}
