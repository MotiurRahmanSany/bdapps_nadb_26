import 'package:go_router/go_router.dart';

import '../providers/auth_provider.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

/// Builds the app's GoRouter, wired to [authProvider] so navigation reacts
/// automatically whenever the login state changes (login/logout).
GoRouter buildRouter(AuthProvider authProvider) {
  return GoRouter(
    initialLocation: '/login',
    refreshListenable: authProvider,
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
    redirect: (context, state) {
      // Still loading saved session from SharedPreferences -> don't redirect yet.
      if (authProvider.isLoading) return null;

      final loggedIn = authProvider.isLoggedIn;
      final goingToLogin = state.matchedLocation == '/login';

      // Not logged in and trying to reach a protected screen -> send to login.
      if (!loggedIn && !goingToLogin) return '/login';

      // Logged in but sitting on the login screen -> send to home.
      if (loggedIn && goingToLogin) return '/home';

      return null; // no redirect needed
    },
  );
}
