import 'package:go_router/go_router.dart';
// import 'package:login/views/Dashboard.dart';
// import 'package:login/views/lupa.dart';
import 'package:register/views/register.dart';

final rutepage = GoRouter(
  initialLocation: '/register',
  routes: [
    // GoRoute(
    //   path: '/login',
    //   builder: (context, state) => const LoginPage(),
    // ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterPage(),
    ),
    // GoRoute(
    //   path: '/lupa-password',
    //   builder: (context, state) => const LupaPassword(),
    // ),
    // GoRoute(
    //   path: '/dashboard',
    //   builder: (context, state) => const DashboardPage(),
    // ),
  ],
);