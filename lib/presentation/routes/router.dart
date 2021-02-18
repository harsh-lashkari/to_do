import 'package:auto_route/auto_route_annotations.dart';
import 'package:to_do/presentation/screens/sign_in/sign_in_page.dart';
import 'package:to_do/presentation/screens/splash/splash_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      page: SplashPage,
      initial: true,
    ),
    MaterialRoute(page: SignInPageBlocProvider),
  ],
  generateNavigationHelperExtension: true,
)
class $Router {}
