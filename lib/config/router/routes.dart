import 'package:gaflutter/screens/screens.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'login',
      path: '/', 
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: 'provincias',
      path: '/provincias',
      builder: (context, state) => const ProvinciasScreen(),
    ),
    GoRoute(
      name: 'comarcas',
      path: '/comarcas',
      builder: (context, state) => const ComarquesScreen(),
    ),
    GoRoute(
      name: 'info1',
      path: '/info1',
      builder: (context, state) => const InfoComarca1Screen(),
    ),
    GoRoute(
      name: 'info2',
      path: '/info2',
      builder: (context, state) => const InfoComarca2Screen(),
    ),
  ],
);