import 'package:coder0211/coder0211.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nobita/pages/scan/page/scan_page_mobile.dart';
import 'package:nobita/pages/scan/store/scan_store.dart';

class ScanPage extends BaseScreen {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends BaseScreenState<ScanPage, ScanStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return ScanPageMobile(store: store);
  }
}
