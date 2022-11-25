import 'package:coder0211/coder0211.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nobita/pages/login/page/login_page_mobile.dart';
import 'package:nobita/pages/login/store/login_store.dart';

class LoginPage extends BaseScreen {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseScreenState<LoginPage, LoginStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return LoginPageMobile(store: store);
  }
}
