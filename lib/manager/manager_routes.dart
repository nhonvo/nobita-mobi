part of 'manager_path_routes.dart';

/// ## Manager Path Routes contain all the path of the app
/// * Example:
/// ```dart
/// static String splashScreen = '/';
/// ```
///
/// * Example:
/// ```dart
/// splashScreen: (context) => SplashScreen(),
/// ```
class ManagerRoutes {
  ManagerRoutes._();

  static String splash = '/';
  static String home = '/home';
  static String login = '/login';
  static String register = '/register';
  static String profile = '/profile';
  static String receive = '/receive';
  static String scan = '/scan';
  static String send = '/send';
  static String sendTicket = '/sendTicket';
  static String changePassword = '/changePassword';
  static String sendOTP = '/sendOTP';
  static String lixi = '/lixi';
  static String lixiSend = '/lixiSend';
  static String lixiCreate = '/lixiCreate';
  static String lixiReceive = '/lixiReceive';

  /// ## Manager contain all action routes of the app
  /// * [splashScreen] is the splash screen of the app and it is the first screen of the app
  static Map<String, Widget Function(BuildContext context)> manager = {
    splash: (context) => const SplashPage(),
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    register: (context) => const RegisterPage(),
    profile: (context) => const ProfilePage(),
    receive: (context) => const ReceivePage(),
    scan: (context) => const ScanPage(),
    send: (context) => const SendPage(),
    sendTicket: (context) => const SendTicketPage(),
    changePassword: (context) => const ChangePasswordPage(),
    sendOTP: (context) => const SendOTPPage(),
    lixi: (context) => const LixiPage(),
    lixiSend: (context) => const LixiSendPage(),
    lixiCreate: (context) => const LixiCreatePage(),
    lixiReceive: (context) => const LixiReceivePage()
  };
}
