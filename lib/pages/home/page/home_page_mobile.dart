import 'package:flutter/material.dart';
import 'package:nobita/enums/enum_languages.dart';
import 'package:nobita/generated/l10n.dart';
import 'package:nobita/pages/home/store/home_store.dart';

class HomePageMobile extends StatelessWidget {
  final HomeStore store;
  const HomePageMobile(this.store, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).app_name,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            IconButton(
                onPressed: () {
                  _onPressedToogleLanguage(context);
                },
                icon: const Icon(Icons.language))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _onPressedToggleTheme();
      }),
    );
  }

  void _onPressedToggleTheme() {
    store.appStore.toggleTheme();
  }

  void _onPressedToogleLanguage(BuildContext context) {
    if (store.appStore.locale == Locale(EnumLanguages.vi.name)) {
      store.appStore.setLanguages(context, languageCode: EnumLanguages.en.name);
    } else {
      store.appStore.setLanguages(context, languageCode: EnumLanguages.vi.name);
    }
  }
}
