// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStore, Store {
  late final _$currentThemeAtom =
      Atom(name: '_AppStore.currentTheme', context: context);

  @override
  ThemeData get currentTheme {
    _$currentThemeAtom.reportRead();
    return super.currentTheme;
  }

  @override
  set currentTheme(ThemeData value) {
    _$currentThemeAtom.reportWrite(value, super.currentTheme, () {
      super.currentTheme = value;
    });
  }

  late final _$currentEnumThemeAtom =
      Atom(name: '_AppStore.currentEnumTheme', context: context);

  @override
  EnumThemes get currentEnumTheme {
    _$currentEnumThemeAtom.reportRead();
    return super.currentEnumTheme;
  }

  @override
  set currentEnumTheme(EnumThemes value) {
    _$currentEnumThemeAtom.reportWrite(value, super.currentEnumTheme, () {
      super.currentEnumTheme = value;
    });
  }

  late final _$localeAtom = Atom(name: '_AppStore.locale', context: context);

  @override
  Locale get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(Locale value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  late final _$toggleThemeAsyncAction =
      AsyncAction('_AppStore.toggleTheme', context: context);

  @override
  Future<void> toggleTheme() {
    return _$toggleThemeAsyncAction.run(() => super.toggleTheme());
  }

  late final _$getThemeAsyncAction =
      AsyncAction('_AppStore.getTheme', context: context);

  @override
  Future<void> getTheme() {
    return _$getThemeAsyncAction.run(() => super.getTheme());
  }

  late final _$setLanguagesAsyncAction =
      AsyncAction('_AppStore.setLanguages', context: context);

  @override
  Future<void> setLanguages(BuildContext context,
      {required String languageCode}) {
    return _$setLanguagesAsyncAction
        .run(() => super.setLanguages(context, languageCode: languageCode));
  }

  late final _$_AppStoreActionController =
      ActionController(name: '_AppStore', context: context);

  @override
  void setLocale(BuildContext context, Locale newLocale) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.setLocale');
    try {
      return super.setLocale(context, newLocale);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTheme: ${currentTheme},
currentEnumTheme: ${currentEnumTheme},
locale: ${locale}
    ''';
  }
}
