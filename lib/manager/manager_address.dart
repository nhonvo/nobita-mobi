/// ## Manager Address contain all the information about the manager address.
/// * [domain] is the domain of the api app
/// * Example:
/// ```dart
/// import 'package:trygo/manager/manager_address.dart';
/// ...
/// url : ManagerAddress.domain;
/// ...
/// ```
class ManagerAddress {
  ManagerAddress._();
  static const String domain = 'https://hdbank-api.azurewebsites.net/api';
  // static const String domain = 'http://192.168.1.107:3001';
  //!--        BASE URL       -->

  // User
  static const String baseUser = '/User';
  static const String register = '$baseUser/register';
  static const String login = '$baseUser/login';
  static const String getInfo = '$baseUser/get-info';
  static const String getBalance = '$baseUser/balance';
  static const String getInfoById = '$baseUser/get-info-by-account-number';
  static const String tranfer = '$baseUser/tranfer';
  static const String getTransferHistory = '$baseUser/get-transfer-history';
  static const String changePassword = '$baseUser/change-password';
  static const String addContact = '$baseUser/add-contact';
  static const String getContacts = '$baseUser/get-contacts';
  static const String deleteContact = '$baseUser/delete-contact';

  // LuckyMoney
  static const String baseLuckey = '/LuckyMoney';
  static const String luckyMoneyCreateRoom = '$baseLuckey/create-room';
  static const String luckyMoneyJoinRoom = '$baseLuckey/join-room';
  static const String luckyMoneyDeleteRoom = '$baseLuckey/delete-room';
  static const String luckyMoneyGetRoom = '$baseLuckey/get-room';
  static const String luckyMoneyLeaveRoom = '$baseLuckey/leave-room';
  static const String luckyMoneySendMoney = '$baseLuckey/send-money';
  static const String luckyMoneyGetParticipant = '$baseLuckey/get-participant';
}
