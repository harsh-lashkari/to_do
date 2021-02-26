// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../domain/notes/note.dart';
import '../core/app_widget.dart';
import '../notes/note_form/note_form_page.dart';
import '../notes/note_overview/note_overview.dart';
import '../screens/sign_in/sign_in_page.dart';
import '../screens/splash/splash_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String appWidget = '/app-widget';
  static const String signInPageBlocProvider = '/sign-in-page-bloc-provider';
  static const String noteOverviewPage = '/note-overview-page';
  static const String noteFormPage = '/note-form-page';
  static const all = <String>{
    splashPage,
    appWidget,
    signInPageBlocProvider,
    noteOverviewPage,
    noteFormPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.appWidget, page: AppWidget),
    RouteDef(Routes.signInPageBlocProvider, page: SignInPageBlocProvider),
    RouteDef(Routes.noteOverviewPage, page: NoteOverviewPage),
    RouteDef(Routes.noteFormPage, page: NoteFormPage),
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
    AppWidget: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AppWidget(),
        settings: data,
      );
    },
    SignInPageBlocProvider: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInPageBlocProvider(),
        settings: data,
      );
    },
    NoteOverviewPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => NoteOverviewPage(),
        settings: data,
      );
    },
    NoteFormPage: (data) {
      final args = data.getArgs<NoteFormPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => NoteFormPage(
          key: args.key,
          editedNote: args.editedNote,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashPage() => push<dynamic>(Routes.splashPage);

  Future<dynamic> pushAppWidget() => push<dynamic>(Routes.appWidget);

  Future<dynamic> pushSignInPageBlocProvider() =>
      push<dynamic>(Routes.signInPageBlocProvider);

  Future<dynamic> pushNoteOverviewPage() =>
      push<dynamic>(Routes.noteOverviewPage);

  Future<dynamic> pushNoteFormPage({
    Key key,
    @required Note editedNote,
  }) =>
      push<dynamic>(
        Routes.noteFormPage,
        arguments: NoteFormPageArguments(key: key, editedNote: editedNote),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// NoteFormPage arguments holder class
class NoteFormPageArguments {
  final Key key;
  final Note editedNote;
  NoteFormPageArguments({this.key, @required this.editedNote});
}
