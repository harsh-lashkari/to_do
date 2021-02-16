// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/sign_in/sign_in_page.dart';
import '../splash/splash_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String signInPageBlocProvider = '/sign-in-page-bloc-provider';
  static const all = <String>{
    splashPage,
    signInPageBlocProvider,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.signInPageBlocProvider, page: SignInPageBlocProvider),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashPage(),
        settings: data,
      );
    },
    SignInPageBlocProvider: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInPageBlocProvider(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashPage() => push<dynamic>(Routes.splashPage);

  Future<dynamic> pushSignInPageBlocProvider() =>
      push<dynamic>(Routes.signInPageBlocProvider);
}
