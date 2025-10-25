
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
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithDefaultTransition(state: state, child: const LoginScreen());
        },
      ),
      GoRoute(
        path: AppRouter.kLoginView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithDefaultTransition(state: state, child: const LoginScreen());
        },
      ),
      GoRoute(
        path: AppRouter.kRegisterWithPhoneView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithDefaultTransition(state: state, child: const SignUpWithPhoneScreen());
        },
      ),
      GoRoute(
        path: AppRouter.kRegisterWithEmailView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithDefaultTransition(state: state, child: const SignUpWithEmailScreen());
        },
      ),
      GoRoute(
        path: AppRouter.kCompleteRegisterView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithDefaultTransition(
            state: state,
            child: CompleteSignupScreen(phoneOrEmailAndType: state.extra as Map<String, String>),
          );
        },
      ),
      GoRoute(
        path: kAppLayoutView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithDefaultTransition(state: state, child: AppLayout());
        },
      ),
      GoRoute(
        path: kSearchView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithDefaultTransition(state: state, child: const SearchScreen());
        },
      ),
      GoRoute(
        path: kSearchResultView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          Map<String, String> searchResultFilter = state.extra as Map<String, String>;
          return buildPageWithDefaultTransition(
            state: state,
            child: SearchResultScreen(
              categoryName: searchResultFilter['categoryName'] ?? '',
              city: searchResultFilter['city'] ?? '',
              data: searchResultFilter['date'] ?? '',
              numberOfAdults: searchResultFilter['numberOfAdults'] ?? '',
            ),
          );
        },
      ),
      GoRoute(
        path: kVerifyView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithDefaultTransition(
            state: state,
            child: VerificationScreen(
              phoneOrEmailAndType: state.extra as Map<String, String>,
            ),
          );
        },
      ),
      GoRoute(
        path: kGuestCreatedView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithDefaultTransition(state: state, child: GuestCreatedScreen());
        },
      ),
    ],
  );
static CustomTransitionPage buildPageWithDefaultTransition({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // 👇 Global transition effect for all pages
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: child,
        );
      },
    );
  }
}
