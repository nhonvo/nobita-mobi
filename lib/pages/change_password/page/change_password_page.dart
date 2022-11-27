import 'package:coder0211/coder0211.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nobita/pages/change_password/page/change_password_page_mobile.dart';
import 'package:nobita/pages/change_password/store/change_password_store.dart';

class ChangePasswordPage extends BaseScreen {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState
    extends BaseScreenState<ChangePasswordPage, ChangePasswordStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return ChangePasswordPageMobile(store: store);
  }
}
