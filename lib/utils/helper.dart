import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nobita/generated/l10n.dart';

class Helper {
  Helper._();
  static String callNumber(BuildContext context, {required int number}) {
    if (number.toString().length > 16) return '';
    String result = '';
    while (number > 0) {
      int numLen = number.toString().length;
      int num = number ~/ pow(10, numLen - 1);
      result = result +
          ' ' +
          _callNumber(context, number: num) +
          ' ' +
          _callUnit(context, digits: numLen, number: num);
      if (S.of(context).app_name == 'nobita' && numLen > 1)
        result = result + ' and';
      number = (number % pow(10, numLen - 1)).toInt();
    }
    return result
        .replaceAll(
            S.of(context).one + ' ' + S.of(context).dozen, S.of(context).ten)
        .replaceAll('Ten One', 'Eleven')
        .replaceAll('Ten Two', 'Twelve')
        .replaceAll('Two Mươi', S.of(context).twenty)
        .replaceAll('Three Mươi', S.of(context).thirty)
        .replaceAll('Four Mươi', S.of(context).forty)
        .replaceAll('Five Mươi', S.of(context).fifty)
        .replaceAll('Six Mươi', S.of(context).sixties)
        .replaceAll('Seven Mươi', S.of(context).seventies)
        .replaceAll('Eight Mươi', S.of(context).eighty)
        .replaceAll('Nine Mươi', S.of(context).ninety);
  }

  static String _callNumber(BuildContext context, {required int number}) {
    switch (number) {
      case 0:
        return S.of(context).oh;
      case 1:
        return S.of(context).one;
      case 2:
        return S.of(context).two;
      case 3:
        return S.of(context).three;
      case 4:
        return S.of(context).four;
      case 5:
        return S.of(context).five;
      case 6:
        return S.of(context).six;
      case 7:
        return S.of(context).seven;
      case 8:
        return S.of(context).eight;
      case 9:
        return S.of(context).nine;

      default:
        return '';
    }
  }

  static String _callUnit(BuildContext context,
      {required int digits, required int number}) {
    switch (digits) {
      case 1:
        return S.of(context).unit;
      case 2:
        if (number == 1)
          return S.of(context).dozen;
        else
          return S.of(context).muoi;
      case 5:
        if (number == 1)
          return S.of(context).dozen + ' ' + S.of(context).thousand;
        else
          return S.of(context).muoi + ' ' + S.of(context).thousand;
      case 8:
        if (number == 1)
          return S.of(context).dozen + ' ' + S.of(context).million;
        else
          return S.of(context).muoi + ' ' + S.of(context).million;
      case 11:
        if (number == 1)
          return S.of(context).dozen + ' ' + S.of(context).billion;
        else
          return S.of(context).muoi + ' ' + S.of(context).billion;
      case 14:
        if (number == 1)
          return S.of(context).dozen +
              ' ' +
              S.of(context).thousand +
              ' ' +
              S.of(context).billion;
        else
          return S.of(context).muoi +
              ' ' +
              S.of(context).billion +
              ' ' +
              S.of(context).billion;
      case 3:
        return S.of(context).hundred;
      case 6:
        return S.of(context).hundred + ' ' + S.of(context).thousand;
      case 9:
        return S.of(context).hundred + ' ' + S.of(context).million;
      case 12:
        return S.of(context).hundred + ' ' + S.of(context).billion;
      case 15:
        return S.of(context).hundred +
            ' ' +
            S.of(context).thousand +
            ' ' +
            S.of(context).billion;
      case 4:
        return S.of(context).thousand;
      case 13:
        return S.of(context).thousand + ' ' + S.of(context).billion;
      case 16:
        return S.of(context).thousand +
            ' ' +
            S.of(context).thousand +
            ' ' +
            S.of(context).billion;
      case 7:
        return S.of(context).million;
      case 10:
        return S.of(context).billion;

      default:
        return '';
    }
  }
}
