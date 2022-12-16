import 'package:coder0211/coder0211.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nobita/pages/lixi/create/page/lixi_create_page_mobile.dart';
import 'package:nobita/pages/lixi/create/store/lixi_create_store.dart';

class LixiCreatePage extends BaseScreen {
  const LixiCreatePage({super.key});

  @override
  State<LixiCreatePage> createState() => _LixiCreatePageState();
}

class _LixiCreatePageState
    extends BaseScreenState<LixiCreatePage, LixiCreateStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return new LixiCreatePageMobile(store: store);
  }
}
