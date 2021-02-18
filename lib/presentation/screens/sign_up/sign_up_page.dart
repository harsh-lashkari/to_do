import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:to_do/injection.dart';
import 'package:to_do/shared/text_style_constants.dart';
import 'package:to_do/shared/color_constants.dart';
import 'package:to_do/shared/sizeconfig.dart';
import 'widgets/sign_up_form.dart';

class SignUpPageBlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInFormBloc>(),
      child: SignUpPage(),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            SizeConfig.safeBlockVertical * 75,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                // leading: IconButton(
                //   icon: const Icon(
                //     Icons.arrow_back_ios_rounded,
                //   ),
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                // ),
                brightness: Brightness.dark,
                centerTitle: true,
                title: Text(
                  'Create Account',
                  style: GoogleFonts.roboto(
                    textStyle: kAppBarTextStyle,
                  ),
                ),
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
        body: ScrollConfiguration(
          behavior: const ScrollBehavior()
            ..buildViewportChrome(context, null, AxisDirection.down),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: "SignUp/SignInPageTransition",
                  child: Image.asset(
                    'images/sign_up.jpg',
                    width: 300,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                ),
                Text(
                  'REGISTER WITH EMAIL ADDRESS',
                  style: GoogleFonts.roboto(
                    fontSize: SizeConfig.safeBlockVertical * 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 25,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 220,
                  child: SignUpForm(),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: GoogleFonts.roboto(
                    fontSize: SizeConfig.safeBlockVertical * 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'SIGN IN',
                    style: GoogleFonts.roboto(
                      fontSize: SizeConfig.safeBlockVertical * 15,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      color: const Color(0xff347af0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 20,
            ),
            // Container(
            //   height: 75,
            //   color: const Color(0xffeaeaea),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const SizedBox(
            //         width: 25,
            //       ),
            //       const Image(
            //         height: 30,
            //         width: 30,
            //         image: AssetImage('images/google.png'),
            //       ),
            //       Text(
            //         'SIGN UP WITH GOOGLE',
            //         style: GoogleFonts.roboto(
            //           color: Colors.black,
            //           letterSpacing: 1,
            //           fontSize: 18,
            //           fontWeight: FontWeight.w700,
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 25,
            //       ),
            //     ],
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                context.read<SignInFormBloc>().add(
                      const SignInFormEvent
                          .registerWithEmailAndPasswordPressed(),
                    );
              },
              child: Container(
                color: kButtonColor,
                width: double.maxFinite,
                height: SizeConfig.safeBlockVertical * 70,
                alignment: Alignment.center,
                child: Text(
                  "SIGN UP",
                  style: GoogleFonts.roboto(
                    textStyle: kButtonTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyBehavior extends ScrollBehavior {
//   @override
//   Widget buildViewportChrome(
//       BuildContext context, Widget child, AxisDirection axisDirection) {
//     return child;
//   }
// }
