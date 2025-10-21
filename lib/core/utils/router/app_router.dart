
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lavescape/features/layout/views/app_layout.dart';
import 'package:lavescape/features/search/views/search_screen.dart';

abstract class AppRouter {
  static const String kAppLayoutView = '/appLayoutView';
  static const String kLoginView = '/LoginView';
  static const String kRegisterView = '/RegisterView';
  static const String kSearchView = '/SearchView';



  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      // GoRoute(
      //   path: '/',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const LoginScreen();
      //   },
      // ),
      // GoRoute(
      //   path: AppRouter.kLoginView,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const LoginScreen();
      //   },
      // ),
      //  GoRoute(
      //   path: AppRouter.kRegisterView,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const SignupScreen();
      //   },
      // ),
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const AppLayout();
        },
      ),
       GoRoute(
        path: kSearchView,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchScreen();
        },
      ),
      
    ],
  );
}
