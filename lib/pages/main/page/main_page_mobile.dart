import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nobita/enums/enum_languages.dart';
import 'package:nobita/pages/main/store/main_store.dart';
import 'package:nobita/theme/images.dart';
import 'package:nobita/theme/shadows.dart';
import 'package:nobita/widgets/buttons/btnv_bar.dart';

class MainPageMobile extends StatelessWidget {
  final MainStore store;
  const MainPageMobile(this.store, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: PageView(
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        controller: store.pageController,
        onPageChanged: (int indexPage) {
          store.indexTabBar = indexPage;
        },
        physics: const ScrollPhysics(),
        children: store.screens,
      ),
      bottomNavigationBar: BTNVBar(context, store: store),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _onPressedToggleTheme();
      }),
    );
  }

  void _onPressedToggleTheme() {
    store.appStore.toggleTheme();
  }
}
