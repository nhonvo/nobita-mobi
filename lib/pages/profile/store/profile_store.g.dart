// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStore, Store {
  Computed<bool>? _$isEnComputed;

  @override
  bool get isEn => (_$isEnComputed ??=
          Computed<bool>(() => super.isEn, name: '_ProfileStore.isEn'))
      .value;

  late final _$_localeLanguageAtom =
      Atom(name: '_ProfileStore._localeLanguage', context: context);

  @override
  String get _localeLanguage {
    _$_localeLanguageAtom.reportRead();
    return super._localeLanguage;
  }

  @override
  set _localeLanguage(String value) {
    _$_localeLanguageAtom.reportWrite(value, super._localeLanguage, () {
      super._localeLanguage = value;
    });
  }

  late final _$setLanguagesAsyncAction =
      AsyncAction('_ProfileStore.setLanguages', context: context);

  @override
  Future<void> setLanguages(BuildContext context,
      {required String languageCode}) {
    return _$setLanguagesAsyncAction
        .run(() => super.setLanguages(context, languageCode: languageCode));
  }

  @override
  String toString() {
    return '''
isEn: ${isEn}
    ''';
  }
}
