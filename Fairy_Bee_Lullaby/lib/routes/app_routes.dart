import '../features/auth/screens/splash_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/signup_screen.dart'; // ✅ Add this
import '../features/parent/screens/parent_home.dart';
import '../features/child/screens/child_home.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const signup = '/signup'; // ✅ Add this
  static const parentHome = '/parentHome';
  static const childHome = '/childHome';

  static final routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(), // ✅ Add this
    parentHome: (context) => const ParentHome(),
    childHome: (context) => const ChildHome(),
  };
}
