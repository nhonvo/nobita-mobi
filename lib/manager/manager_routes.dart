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

  /// ## Manager contain all action routes of the app
  /// * [splashScreen] is the splash screen of the app and it is the first screen of the app
  static Map<String, Widget Function(BuildContext context)> manager = {
    splash: (context) => const SplashPage(),
    home: (context) => const MainPage(),
    login: (context) => const LoginPage(),
    register: (context) => const RegisterPage()
  };
}
