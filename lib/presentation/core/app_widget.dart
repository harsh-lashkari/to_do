import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/presentation/routes/router.gr.dart' as app_router;
import 'package:to_do/application/auth/auth_bloc.dart';
import 'package:to_do/presentation/screens/sign_in/sign_in_page.dart';
import '../../injection.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0x99FFFFFF),
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TO-DO',
        theme: ThemeData.light().copyWith(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        home: SignInPageBlocProvider(),
        builder: ExtendedNavigator.builder(
          router: app_router.Router(),
        ),
      ),
    );
  }
}
