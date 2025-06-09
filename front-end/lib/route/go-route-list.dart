import 'package:go_router/go_router.dart';
import 'package:login/views/dashboard.dart';
import '/views/login.dart';
import '/views/register.dart';
// import 'views/dashboard.dart';
// import 'package:login/views/lupa.dart';


final rutepage = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterPage(),
    ),
    // GoRoute(
    //   path: '/lupa-password',
    //   builder: (context, state) => const LupaPassword(),
    // ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardPage(),
    ),
  ],
);