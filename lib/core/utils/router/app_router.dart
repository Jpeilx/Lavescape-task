
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lavescape/features/auth/views/guest_created_screen.dart';
import 'package:lavescape/features/auth/views/login_screen.dart';
import 'package:lavescape/features/auth/views/complete_signup_screen.dart';
import 'package:lavescape/features/auth/views/sign_up_with_email_screen.dart';
import 'package:lavescape/features/auth/views/sign_up_with_phone_screen.dart';
import 'package:lavescape/features/auth/views/verfication_screen.dart';
import 'package:lavescape/features/layout/views/app_layout.dart';
import 'package:lavescape/features/search_result/views/search_result_screen.dart';
import 'package:lavescape/features/search/views/search_screen.dart';

abstract class AppRouter {
  static const String kAppLayoutView = '/appLayoutView';
  static const String kLoginView = '/LoginView';
  static const String kRegisterView = '/RegisterView';
  static const String kRegisterWithPhoneView = '/RegisterWithPhoneView';
  static const String kRegisterWithEmailView = '/RegisterWithEmailView';
  static const String kCompleteRegisterView = '/CompleteRegisterView';
  static const String kSearchView = '/SearchView';
  static const String kSearchResultView = '/SearchResultView';
  static const String kVerifyView = '/VerifyView';
  static const String kGuestCreatedView = '/GuestCreatedView';



  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: AppRouter.kLoginView,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
       GoRoute(
        path: AppRouter.kRegisterWithPhoneView,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpWithPhoneScreen();
        },
      ),
       GoRoute(
        path: AppRouter.kRegisterWithEmailView,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpWithEmailScreen();
        },
      ),
       GoRoute(
        path: AppRouter.kCompleteRegisterView,
        builder: (BuildContext context, GoRouterState state) {
          return  CompleteSignupScreen( phoneOrEmailAndType: state.extra as Map<String, String>,);
        },
      ),
      GoRoute(
        path: kAppLayoutView,
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
      GoRoute(
        path: kSearchResultView ,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchResultScreen();
        },
      ),
       GoRoute(
        path: kVerifyView,
        builder: (BuildContext context, GoRouterState state) {
          return VerificationScreen(
            phoneOrEmailAndType: state.extra as Map<String, String>,
          );
        },
      ),
       GoRoute(
        path: kGuestCreatedView,
        builder: (BuildContext context, GoRouterState state) {
          return GuestCreatedScreen();
        },
      ),
      
    ],
  );
}
