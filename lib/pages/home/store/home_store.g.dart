// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$isShowLoadingAtom =
      Atom(name: '_HomeStore.isShowLoading', context: context);

  @override
  bool get isShowLoading {
    _$isShowLoadingAtom.reportRead();
    return super.isShowLoading;
  }

  @override
  set isShowLoading(bool value) {
    _$isShowLoadingAtom.reportWrite(value, super.isShowLoading, () {
      super.isShowLoading = value;
    });
  }

  late final _$selectedMonthAtom =
      Atom(name: '_HomeStore.selectedMonth', context: context);

  @override
  String get selectedMonth {
    _$selectedMonthAtom.reportRead();
    return super.selectedMonth;
  }

  @override
  set selectedMonth(String value) {
    _$selectedMonthAtom.reportWrite(value, super.selectedMonth, () {
      super.selectedMonth = value;
    });
  }

  late final _$selectedYearAtom =
      Atom(name: '_HomeStore.selectedYear', context: context);

  @override
  String get selectedYear {
    _$selectedYearAtom.reportRead();
    return super.selectedYear;
  }

  @override
  set selectedYear(String value) {
    _$selectedYearAtom.reportWrite(value, super.selectedYear, () {
      super.selectedYear = value;
    });
  }

  late final _$dropdownMonthsAtom =
      Atom(name: '_HomeStore.dropdownMonths', context: context);

  @override
  ObservableList<DropdownMenuItem<String>> get dropdownMonths {
    _$dropdownMonthsAtom.reportRead();
    return super.dropdownMonths;
  }

  @override
  set dropdownMonths(ObservableList<DropdownMenuItem<String>> value) {
    _$dropdownMonthsAtom.reportWrite(value, super.dropdownMonths, () {
      super.dropdownMonths = value;
    });
  }

  late final _$dropdownYearsAtom =
      Atom(name: '_HomeStore.dropdownYears', context: context);

  @override
  ObservableList<DropdownMenuItem<String>> get dropdownYears {
    _$dropdownYearsAtom.reportRead();
    return super.dropdownYears;
  }

  @override
  set dropdownYears(ObservableList<DropdownMenuItem<String>> value) {
    _$dropdownYearsAtom.reportWrite(value, super.dropdownYears, () {
      super.dropdownYears = value;
    });
  }

  late final _$historyTransfersAtom =
      Atom(name: '_HomeStore.historyTransfers', context: context);

  @override
  ObservableList<HistoryTransfer> get historyTransfers {
    _$historyTransfersAtom.reportRead();
    return super.historyTransfers;
  }

  @override
  set historyTransfers(ObservableList<HistoryTransfer> value) {
    _$historyTransfersAtom.reportWrite(value, super.historyTransfers, () {
      super.historyTransfers = value;
    });
  }

  late final _$getBalanceAsyncAction =
      AsyncAction('_HomeStore.getBalance', context: context);

  @override
  Future<void> getBalance(BuildContext context) {
    return _$getBalanceAsyncAction.run(() => super.getBalance(context));
  }

  late final _$getTransferHistoryAsyncAction =
      AsyncAction('_HomeStore.getTransferHistory', context: context);

  @override
  Future<void> getTransferHistory(BuildContext context) {
    return _$getTransferHistoryAsyncAction
        .run(() => super.getTransferHistory(context));
  }

  @override
  String toString() {
    return '''
isShowLoading: ${isShowLoading},
selectedMonth: ${selectedMonth},
selectedYear: ${selectedYear},
dropdownMonths: ${dropdownMonths},
dropdownYears: ${dropdownYears},
historyTransfers: ${historyTransfers}
    ''';
  }
}
