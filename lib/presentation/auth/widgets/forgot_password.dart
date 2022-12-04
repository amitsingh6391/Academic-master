import 'package:academic_master/application/auth/forgot_password_form/forgot_password_bloc.dart';
import 'package:academic_master/presentation/auth/provider/auth_tab_provider.dart';
import 'package:academic_master/presentation/extension/util_extensions.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

const otpVerificationImageKey = Key('otp-verification-image-key');
const verifyOtpTextButtonKey = Key('verify-otp-textbutton-key');
const otpScreenVerify = 'otp-screen-verify';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthTabProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            if (state.showErrorMessages) {
              FlushbarHelper.createError(
                message: 'Please enter valid email, try Again 😪',
              ).show(context);
            }
            if (state.isSent) {
              FlushbarHelper.createSuccess(
                message:
                    'Password reset link sent is on your mail. Reset your password and login again',
              ).show(context);

              2.delay(
                () {
                  provider.updateTab(0);
                },
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 47),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 8),
                    Image.asset(
                      'assets/images/otp_verify.png',
                      key: otpVerificationImageKey,
                      width: 275,
                      height: 183,
                    ),
                    const SizedBox(height: 53),
                    const Text(
                      'Forgot Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Enter the email we will send password reset link on your mail',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.all(13.h),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        autocorrect: false,
                        onChanged: (value) => context
                            .read<ForgotPasswordBloc>()
                            .add(ForgotPasswordEvent.emailChanged(value)),
                        validator: (_) => context
                            .read<ForgotPasswordBloc>()
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
                    const SizedBox(height: 52),
                    TextButton(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        context.read<ForgotPasswordBloc>().add(
                              const ForgotPasswordEvent
                                  .sendPasswordResetEmailPressed(),
                            );
                      },
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Apptheme.primaryColor,
                        ),
                      ),
                      child: const SizedBox(
                        height: 48,
                        child: Center(
                          child: Text(
                            'Verify',
                            key: verifyOtpTextButtonKey,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Apptheme.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
