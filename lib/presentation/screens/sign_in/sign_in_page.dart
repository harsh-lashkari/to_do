import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:to_do/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:to_do/injection.dart';
import 'package:to_do/presentation/screens/sign_in/widgets/sign_in_form.dart';
import 'package:to_do/presentation/screens/sign_up/sign_up_page.dart';
import 'package:to_do/shared/text_style_constants.dart';
import 'package:to_do/shared/color_constants.dart';
import 'package:to_do/shared/sizeconfig.dart';

class SignInPageBlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInFormBloc>(),
      child: SignInPage(),
    );
  }
}

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                brightness: Brightness.dark,
                centerTitle: true,
                title: Text(
                  'Welcome',
                  style: GoogleFonts.quicksand(
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
                    'images/sign_in.png',
                    // width: 300,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 20,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 220,
                  child: SignInForm(),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Forgot Password',
              style: GoogleFonts.quicksand(
                fontSize: SizeConfig.safeBlockVertical * 15,
                fontWeight: FontWeight.bold,
                //fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                color: const Color(0xff347af0),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: GoogleFonts.quicksand(
                    fontSize: SizeConfig.safeBlockVertical * 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 5,
                ),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.push(
                      context,
                      PageTransition(
                        child: SignUpPageBlocProvider(),
                        type: PageTransitionType.rightToLeftWithFade,
                      ),
                    );
                  },
                  child: Text(
                    'SIGN UP',
                    style: GoogleFonts.quicksand(
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
            GestureDetector(
              onTap: () {
                context.read<SignInFormBloc>().add(
                      const SignInFormEvent.signInWithGooglePressed(),
                    );
              },
              child: Container(
                height: SizeConfig.safeBlockVertical * 75,
                color: const Color(0xffeaeaea),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 40,
                    ),
                    Image(
                      height: SizeConfig.safeBlockVertical * 30,
                      width: SizeConfig.safeBlockHorizontal * 30,
                      image: const AssetImage('images/google.png'),
                    ),
                    Text(
                      'SIGN IN WITH GOOGLE',
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        letterSpacing: 1,
                        fontSize: SizeConfig.safeBlockVertical * 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 40,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read<SignInFormBloc>().add(
                      const SignInFormEvent.signInWithEmailAndPasswordPressed(),
                    );
                // print("pressed");
              },
              child: Container(
                color: kButtonColor,
                width: double.maxFinite,
                height: SizeConfig.safeBlockVertical * 70,
                alignment: Alignment.center,
                child: Text(
                  "SIGN IN",
                  style: GoogleFonts.quicksand(
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
