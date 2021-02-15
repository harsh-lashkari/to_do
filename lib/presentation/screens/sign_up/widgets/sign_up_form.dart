import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:to_do/shared/sizeconfig.dart';
import 'package:to_do/shared/text_style_constants.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          // ignore: deprecated_member_use
          autovalidate: state.showErrorMessages,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.safeBlockHorizontal * 15,
                  right: SizeConfig.safeBlockHorizontal * 15,
                ),
                child: TextFormField(
                  style: GoogleFonts.quicksand(
                    textStyle: kFormFieldTextStyle,
                  ),
                  decoration: const InputDecoration(
                    // contentPadding: EdgeInsets.only(bottom: 10),
                    prefixIcon: Icon(
                      Icons.email_rounded,
                    ),
                    labelText: 'Email Address',
                  ),
                  autocorrect: false,
                  onChanged: (value) => context
                      .read<SignInFormBloc>()
                      .add(SignInFormEvent.emailInput(value)),
                  validator: (_) => context
                      .read<SignInFormBloc>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          invalidEmail: (_) => 'Invalid Email',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.safeBlockHorizontal * 15,
                  right: SizeConfig.safeBlockHorizontal * 15,
                ),
                child: TextFormField(
                  style: GoogleFonts.quicksand(
                    textStyle: kFormFieldTextStyle,
                  ),
                  decoration: const InputDecoration(
                    // contentPadding: EdgeInsets.only(bottom: 10),
                    // fillColor: Colors.white,
                    // focusColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.lock_rounded,
                    ),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  autocorrect: false,
                  onChanged: (value) {
                    context
                        .read<SignInFormBloc>()
                        .add(SignInFormEvent.passwordInput(value));
                  },
                  validator: (_) =>
                      context.read<SignInFormBloc>().state.password.value.fold(
                            (f) => f.maybeMap(
                              shortPassword: (_) => 'Short Password',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
