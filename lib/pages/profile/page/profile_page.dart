import 'package:coder0211/coder0211.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nobita/pages/profile/page/profile_page_mobile.dart';
import 'package:nobita/pages/profile/store/profile_store.dart';

class ProfilePage extends BaseScreen {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseScreenState<ProfilePage, ProfileStore> {
  @override
  Widget buildSmallScreen(BuildContext context) {
    return ProfilePageMobile(store: store);
  }
}
