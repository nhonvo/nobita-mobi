import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nobita/pages/main/store/main_store.dart';
import 'package:nobita/theme/images.dart';
import 'package:nobita/theme/shadows.dart';

class BTNVBar extends StatelessWidget {
  final MainStore store;
  final BuildContext context;
  const BTNVBar(this.context, {super.key, required this.store});

  @override
  Widget build(_) {
    return Observer(
        builder: (_) => BaseNavigationBar(
              items: <BaseNavigationBarItem>[
                BaseNavigationBarItem(
                  icon: Images.iconHome,
                  title: '',
                ),
                BaseNavigationBarItem(
                  icon: Images.iconHistory,
                  title: '',
                ),
                BaseNavigationBarItem(
                  icon: Images.iconProfile,
                  title: '',
                ),
              ],
              indexSlelected: store.indexTabBar,
              selectedColor: Theme.of(context).primaryColor,
              color: Theme.of(context).disabledColor,
              onItemSelected: (int index) {
                store.setIndexTabBar(value: index);
                store.pageController.jumpToPage(index);
              },
              bgColor: Theme.of(context).backgroundColor,
              radius: 26,
              isShowText: false,
              boxShadow: Shadows.shadow3(context),
            ));
  }
}
