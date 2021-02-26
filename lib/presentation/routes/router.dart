import 'package:auto_route/auto_route_annotations.dart';
import 'package:to_do/presentation/core/app_widget.dart';
import 'package:to_do/presentation/notes/note_overview/note_overview.dart';
import 'package:to_do/presentation/screens/sign_in/sign_in_page.dart';
import 'package:to_do/presentation/screens/splash/splash_page.dart';
import 'package:to_do/presentation/notes/note_form/note_form_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: AppWidget,),
    MaterialRoute(page: SignInPageBlocProvider),
    MaterialRoute(page: NoteOverviewPage),
    MaterialRoute(page: NoteFormPage, fullscreenDialog: true),
  ], 
  generateNavigationHelperExtension: true,
)
class $Router {}
