import 'package:go_router/go_router.dart';
import 'package:flutterdocs/presentation/views/views.dart';

// GoRouter configuration
final routerApp = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/profile",
      builder: (context, state) => const UserProfilePage(),
    )
  ],
  debugLogDiagnostics: true,
);
