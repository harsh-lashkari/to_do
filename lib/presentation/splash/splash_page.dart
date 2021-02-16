import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/application/auth/auth_bloc.dart';
import 'package:to_do/presentation/routes/router.gr.dart';
import 'package:to_do/shared/sizeconfig.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
            initial: (_) {},
            authenticated: (_) {
              print('I AM AUTHENTICATED');
              // ExtendedNavigator.of(context).replace(Routes.);
            },
            unauthenticated: (_) async {
              await Future.delayed(
                const Duration(seconds: 3),
              );
              ExtendedNavigator.of(context).replace(
                Routes.signInPageBlocProvider,
              );
            });
      },
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical * 150,
                bottom: SizeConfig.safeBlockVertical * 150,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'NOTES',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w200,
                      fontSize: SizeConfig.safeBlockVertical * 50,
                    ),
                  ),
                  // SizedBox(
                  //   height: SizeConfig.safeBlockVertical * 50,
                  // ),
                  Image(
                    image: const AssetImage('images/splash.png'),
                    width: SizeConfig.safeBlockHorizontal * 500,
                  ),
                  // SizedBox(
                  //   height: SizeConfig.safeBlockVertical * 50,
                  // ),
                  SpinKitFadingCube(
                    color: Colors.black,
                    size: SizeConfig.safeBlockHorizontal * 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
