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
      path: '/comarcas/:pro',
      builder: (context, state) {
        final String pro = state.pathParameters['pro']!;
        return ComarquesScreen(pro: pro,);
      },
    ),
    GoRoute(
      name: 'info1',
      path: '/info1/:pro/:comar',
      builder: (context, state) {
        final String pro = state.pathParameters['pro']!;
        final String comar = state.pathParameters['comar']!;
        return InfoComarca1Screen(pro: pro,comar:comar);
      }
    ),
    GoRoute(
      name: 'info2',
      path: '/info2/:pro/:comar',
      builder: (context, state) {
        final String pro = state.pathParameters['pro']!;
        final String comar = state.pathParameters['comar']!;
        return InfoComarca2Screen(pro: pro,comar:comar);
      }
    ),
  ],
);