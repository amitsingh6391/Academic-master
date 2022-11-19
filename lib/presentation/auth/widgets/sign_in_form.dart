import 'package:academic_master/application/auth/auth_bloc.dart';
import 'package:academic_master/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:academic_master/presentation/auth/provider/auth_tab_provider.dart';
import 'package:academic_master/presentation/core/loading.dart';
import 'package:academic_master/presentation/routes/router.gr.dart';
import "package:academic_master/presentation/theme/theme.dart";
import 'package:academic_master/presentation/utils/constants.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatelessWidget {
  Widget buildAsset() {
    return Lottie.asset(
      'assets/lottiefiles/signinmen.json',
      animate: true,
      height: 100.w * 2,
      width: 100.w * 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthTabProvider>(context, listen: false);

    ScreenUtil.init(
      context,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    );

    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              FlushbarHelper.createError(
                message: failure.map(
                  cancelledByUser: (_) => 'Cancelled',
                  serverError: (_) => 'Server error',
                  emailAlreadyInUse: (_) => 'Email already in use',
                  invalidEmailAndPasswordCombination: (_) =>
                      'Invalid email and password combination',
                ),
              ).show(context);
            },
            (_) {
              debugPrint("i m authnicated");
              AutoRouter.of(context).replace(Homepage());

              context
                  .read<AuthBloc>()
                  .add(const AuthEvent.authCheckRequested());
            },
          ),
        );
      },
      builder: (context, state) {
        final signInForm = Form(
          // autovalidate: state.showErrorMessages,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                  left: leftPadding - 13,
                ),
                child: Text(
                  "Login",
                  textAlign: TextAlign.start,
                  style: Apptheme(context).normalText.copyWith(
                        fontSize: 50.sp,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(13.h),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                  autocorrect: false,
                  onChanged: (value) => context
                      .read<SignInFormBloc>()
                      .add(SignInFormEvent.emailChanged(value)),
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
              Padding(
                padding: EdgeInsets.all(13.h),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                  autocorrect: false,
                  obscureText: true,
                  onChanged: (value) => context
                      .read<SignInFormBloc>()
                      .add(SignInFormEvent.passwordChanged(value)),
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
              if (state.isSubmitting)
                CircleLoading()
              else
                Padding(
                  padding: EdgeInsets.only(
                    left: 22.h,
                    top: 15.h,
                    right: 22.h,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      context.read<SignInFormBloc>().add(
                            const SignInFormEvent
                                .signInWithEmailAndPasswordPressed(),
                          );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.h),
                      child: const Text('SignIn'),
                    ),
                  ),
                ),
              SizedBox(height: 26.w),
              Center(
                child: Text(
                  "OR",
                  style: Apptheme(context).normalText.copyWith(
                        fontSize: 30.h,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 25.h,
                  top: 15.h,
                  right: 25.h,
                ),
                child: SignInButtonBuilder(
                  text: '',
                  fontSize: 15.h,
                  image: Padding(
                    padding: EdgeInsets.only(left: 50.h),
                    child: SvgPicture.asset(
                      "assets/images/google.svg",
                      width: 50.h,
                      height: 50.h,
                    ),
                  ),
                  onPressed: () {
                    // context.read<SignInFormBloc>().add(
                    //     const SignInFormEvent.signInWithGooglePressed());
                  },
                  backgroundColor: Apptheme.primaryColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 28.h,
                  right: 8.0.h,
                  top: 15.h,
                  bottom: 20.h,
                ),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20.h,
                  children: [
                    TextButton(
                      onPressed: () {
                        provider.updateTab(2);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: Apptheme(context).normalText.copyWith(
                              fontSize: 15.sp,
                              color: Apptheme.primaryColor,
                            ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          // flex: 1,
                          child: Text(
                            'Do not have an account? ',
                            style: Apptheme(context).normalText.copyWith(
                                  fontSize: 12.sp,
                                ),
                          ),
                        ),
                        Flexible(
                          // flex: 1,
                          child: TextButton(
                            onPressed: () {
                              provider.updateTab(1);
                            },
                            child: Text(
                              'Create new',
                              style: Apptheme(context).normalText.copyWith(
                                    fontSize: 15.sp,
                                    color: Apptheme.primaryColor,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
        return IgnorePointer(
          ignoring: state.isSubmitting,
          child: ScreenUtil().screenWidth < 451
              ? ListView(
                  children: [
                    Center(
                      child: buildAsset(),
                    ),
                    signInForm,
                    SvgPicture.asset(
                      "assets/images/wave_bottom.svg",
                      height: 65.h,
                      fit: BoxFit.fill,
                    ),
                  ],
                )
              : Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: buildAsset(),
                      ),
                      Expanded(child: signInForm),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
