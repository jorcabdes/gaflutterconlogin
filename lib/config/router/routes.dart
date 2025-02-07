import 'package:gaflutter/screens/screens.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gaflutter/screens/screens.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'login',
      path: '/', 
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: 'register',
      path: '/register', 
      builder: (context, state) => const RegistroPage(),
    ),
    GoRoute(
      name: 'favoritas',
      path: '/favoritas',
      builder: (context, state) => const TasksScreen(),
    ),
    GoRoute(
      name: 'provincias',
      path: '/provincias',
      builder: (context, state) => const ProvinciasScreen(),
    ),
    GoRoute(
      name: 'comarcas',
      path: '/comarcas/:pro',
      builder: (context, state) {
        final String pro = state.pathParameters['pro']!;
        return ComarquesScreen(pro: pro,);
      },
    ),
    GoRoute(
      name: 'info1',
      path: '/info1/:comar',
      builder: (context, state) {
        final String comar = state.pathParameters['comar']!;
        return InfoComarca1Screen(comar:comar);
      }
    ),
    GoRoute(
      name: 'info2',
      path: '/info2/:comar',
      builder: (context, state) {
        final String comar = state.pathParameters['comar']!;
        return InfoComarca2Screen(comar:comar);
      }
    ),
  ],
  redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;
    final currentPath = state.uri.path;
    if (user != null && (currentPath == '/login' || currentPath == '/register')) {
      return '/provincias';
    }

    // Si el usuario no está autenticado y no está intentando acceder al login o registro, redirige al login
    if (user == null && currentPath != '/login' && currentPath != '/register') {
     return('/');
    }
    return null; // No redirigir
  },
);