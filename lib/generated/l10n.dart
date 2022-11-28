// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `nobita`
  String get app_name {
    return Intl.message(
      'nobita',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `hdback_hackathon`
  String get hintUserName {
    return Intl.message(
      'hdback_hackathon',
      name: 'hintUserName',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `******`
  String get hintPassword {
    return Intl.message(
      '******',
      name: 'hintPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get createNewAccount {
    return Intl.message(
      'Create a new account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Fullname`
  String get fullname {
    return Intl.message(
      'Fullname',
      name: 'fullname',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `I have a account`
  String get iHaveAccount {
    return Intl.message(
      'I have a account',
      name: 'iHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `a@example.com`
  String get hintEmail {
    return Intl.message(
      'a@example.com',
      name: 'hintEmail',
      desc: '',
      args: [],
    );
  }

  /// `Nguyen Duc Hoa`
  String get hintFullName {
    return Intl.message(
      'Nguyen Duc Hoa',
      name: 'hintFullName',
      desc: '',
      args: [],
    );
  }

  /// `039123456`
  String get hintPhone {
    return Intl.message(
      '039123456',
      name: 'hintPhone',
      desc: '',
      args: [],
    );
  }

  /// `Account number`
  String get accountNumber {
    return Intl.message(
      'Account number',
      name: 'accountNumber',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get balance {
    return Intl.message(
      'Balance',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Copied`
  String get copied {
    return Intl.message(
      'Copied',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Themes`
  String get themes {
    return Intl.message(
      'Themes',
      name: 'themes',
      desc: '',
      args: [],
    );
  }

  /// `Receive`
  String get receive {
    return Intl.message(
      'Receive',
      name: 'receive',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Lixi`
  String get lixi {
    return Intl.message(
      'Lixi',
      name: 'lixi',
      desc: '',
      args: [],
    );
  }

  /// `Update account info`
  String get updateInfo {
    return Intl.message(
      'Update account info',
      name: 'updateInfo',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get scan {
    return Intl.message(
      'Scan',
      name: 'scan',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueT {
    return Intl.message(
      'Continue',
      name: 'continueT',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all data`
  String get pleaseFillAllData {
    return Intl.message(
      'Please fill all data',
      name: 'pleaseFillAllData',
      desc: '',
      args: [],
    );
  }

  /// `INTERNET UNAVAILABLE`
  String get interNetUnavailable {
    return Intl.message(
      'INTERNET UNAVAILABLE',
      name: 'interNetUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Info Receiver`
  String get infoReceiver {
    return Intl.message(
      'Info Receiver',
      name: 'infoReceiver',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Sended`
  String get sended {
    return Intl.message(
      'Sended',
      name: 'sended',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Wrong User Name or Password`
  String get wrongUserNameOrPassword {
    return Intl.message(
      'Wrong User Name or Password',
      name: 'wrongUserNameOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid`
  String get emailIsNotValid {
    return Intl.message(
      'Email is not valid',
      name: 'emailIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Phone is not valid`
  String get phoneIsNotValid {
    return Intl.message(
      'Phone is not valid',
      name: 'phoneIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Password and Confirm Password are not the same`
  String get passwordAndConfirmPasswordNotSame {
    return Intl.message(
      'Password and Confirm Password are not the same',
      name: 'passwordAndConfirmPasswordNotSame',
      desc: '',
      args: [],
    );
  }

  /// `Account already exists`
  String get accountAlreadyExists {
    return Intl.message(
      'Account already exists',
      name: 'accountAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Change password successfully`
  String get changePasswordSuccess {
    return Intl.message(
      'Change password successfully',
      name: 'changePasswordSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get oldPassword {
    return Intl.message(
      'Old password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change password failed`
  String get changePasswordFailed {
    return Intl.message(
      'Change password failed',
      name: 'changePasswordFailed',
      desc: '',
      args: [],
    );
  }

  /// `Wrong old password`
  String get wrongOldPassword {
    return Intl.message(
      'Wrong old password',
      name: 'wrongOldPassword',
      desc: '',
      args: [],
    );
  }

  /// `The new password is the same as the old password`
  String get theNewPasswordSame {
    return Intl.message(
      'The new password is the same as the old password',
      name: 'theNewPasswordSame',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `The transfer history is empty`
  String get transferHistoryIsEmpty {
    return Intl.message(
      'The transfer history is empty',
      name: 'transferHistoryIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to`
  String get confirmAreYou {
    return Intl.message(
      'Are you sure you want to',
      name: 'confirmAreYou',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the amount as a number`
  String get pleaseEnterAmount {
    return Intl.message(
      'Please enter the amount as a number',
      name: 'pleaseEnterAmount',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `This your account number. Please enter other account number`
  String get thisYourAccount {
    return Intl.message(
      'This your account number. Please enter other account number',
      name: 'thisYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get failed {
    return Intl.message(
      'Failed',
      name: 'failed',
      desc: '',
      args: [],
    );
  }

  /// `One`
  String get one {
    return Intl.message(
      'One',
      name: 'one',
      desc: '',
      args: [],
    );
  }

  /// `Two`
  String get two {
    return Intl.message(
      'Two',
      name: 'two',
      desc: '',
      args: [],
    );
  }

  /// `Three`
  String get three {
    return Intl.message(
      'Three',
      name: 'three',
      desc: '',
      args: [],
    );
  }

  /// `Four`
  String get four {
    return Intl.message(
      'Four',
      name: 'four',
      desc: '',
      args: [],
    );
  }

  /// `Five`
  String get five {
    return Intl.message(
      'Five',
      name: 'five',
      desc: '',
      args: [],
    );
  }

  /// `Six`
  String get six {
    return Intl.message(
      'Six',
      name: 'six',
      desc: '',
      args: [],
    );
  }

  /// `Seven`
  String get seven {
    return Intl.message(
      'Seven',
      name: 'seven',
      desc: '',
      args: [],
    );
  }

  /// `Eight`
  String get eight {
    return Intl.message(
      'Eight',
      name: 'eight',
      desc: '',
      args: [],
    );
  }

  /// `Nine`
  String get nine {
    return Intl.message(
      'Nine',
      name: 'nine',
      desc: '',
      args: [],
    );
  }

  /// `Ten`
  String get ten {
    return Intl.message(
      'Ten',
      name: 'ten',
      desc: '',
      args: [],
    );
  }

  /// `Mươi`
  String get muoi {
    return Intl.message(
      'Mươi',
      name: 'muoi',
      desc: '',
      args: [],
    );
  }

  /// `oh`
  String get oh {
    return Intl.message(
      'oh',
      name: 'oh',
      desc: '',
      args: [],
    );
  }

  /// `dozen`
  String get dozen {
    return Intl.message(
      'dozen',
      name: 'dozen',
      desc: '',
      args: [],
    );
  }

  /// `unit`
  String get unit {
    return Intl.message(
      'unit',
      name: 'unit',
      desc: '',
      args: [],
    );
  }

  /// `hundred`
  String get hundred {
    return Intl.message(
      'hundred',
      name: 'hundred',
      desc: '',
      args: [],
    );
  }

  /// `thousand`
  String get thousand {
    return Intl.message(
      'thousand',
      name: 'thousand',
      desc: '',
      args: [],
    );
  }

  /// `million`
  String get million {
    return Intl.message(
      'million',
      name: 'million',
      desc: '',
      args: [],
    );
  }

  /// `billion`
  String get billion {
    return Intl.message(
      'billion',
      name: 'billion',
      desc: '',
      args: [],
    );
  }

  /// `Twenty`
  String get twenty {
    return Intl.message(
      'Twenty',
      name: 'twenty',
      desc: '',
      args: [],
    );
  }

  /// `Thirty`
  String get thirty {
    return Intl.message(
      'Thirty',
      name: 'thirty',
      desc: '',
      args: [],
    );
  }

  /// `Forty`
  String get forty {
    return Intl.message(
      'Forty',
      name: 'forty',
      desc: '',
      args: [],
    );
  }

  /// `Fifty`
  String get fifty {
    return Intl.message(
      'Fifty',
      name: 'fifty',
      desc: '',
      args: [],
    );
  }

  /// `Sixties`
  String get sixties {
    return Intl.message(
      'Sixties',
      name: 'sixties',
      desc: '',
      args: [],
    );
  }

  /// `Seventies`
  String get seventies {
    return Intl.message(
      'Seventies',
      name: 'seventies',
      desc: '',
      args: [],
    );
  }

  /// `Eighty`
  String get eighty {
    return Intl.message(
      'Eighty',
      name: 'eighty',
      desc: '',
      args: [],
    );
  }

  /// `Ninety`
  String get ninety {
    return Intl.message(
      'Ninety',
      name: 'ninety',
      desc: '',
      args: [],
    );
  }

  /// `Save recipient`
  String get saveRecipient {
    return Intl.message(
      'Save recipient',
      name: 'saveRecipient',
      desc: '',
      args: [],
    );
  }

  /// `Save recipient successfully`
  String get addContactSuccessfully {
    return Intl.message(
      'Save recipient successfully',
      name: 'addContactSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Save recipient failed`
  String get addContactFailed {
    return Intl.message(
      'Save recipient failed',
      name: 'addContactFailed',
      desc: '',
      args: [],
    );
  }

  /// `Successfully`
  String get successfully {
    return Intl.message(
      'Successfully',
      name: 'successfully',
      desc: '',
      args: [],
    );
  }

  /// `delete`
  String get delete {
    return Intl.message(
      'delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete contact failed`
  String get deleteContactFailed {
    return Intl.message(
      'Delete contact failed',
      name: 'deleteContactFailed',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
