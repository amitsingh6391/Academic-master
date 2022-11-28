import 'dart:async';

import 'package:academic_master/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

const otpVerificationImageKey = Key('otp-verification-image-key');
const verifyOtpTextButtonKey = Key('verify-otp-textbutton-key');
const otpScreenVerify = 'otp-screen-verify';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  late TextEditingController otpTextController;

  final _formKey = GlobalKey<FormState>();

  String? _inputValidations(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter OTP';
    } else if (value.length < 6) {
      return 'Please enter valid OTP';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    otpTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    otpTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                  'Verification Code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Enter the verification code we just sent you on your email address',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                _OtpCountdownTimer(),
                const SizedBox(height: 52),
                TextButton(
                  onPressed: () {},
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
        ),
      ),
    );
  }
}

class _OtpCountdownTimer extends StatefulWidget {
  const _OtpCountdownTimer({
    super.key,
  });

  @override
  State<_OtpCountdownTimer> createState() => _OtpCountdownTimerState();
}

class _OtpCountdownTimerState extends State<_OtpCountdownTimer> {
  late StreamController<int> _timerController;
  late Timer _timer;

  void _startTimer() {
    int _counter;
    _counter = 300;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter >= 0) {
        _timerController.add(_counter--);
      } else {
        _timer.cancel();
      }
    });
  }

  String _secondsToMinutes(final int seconds) {
    return '${(seconds / 60).floor()}:${seconds % 60}';
  }

  @override
  void initState() {
    super.initState();
    _timerController = StreamController<int>();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _timerController.close();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return StreamBuilder<int>(
      stream: _timerController.stream,
      initialData: 300,
      builder: (final context, final snapshot) {
        return snapshot.data! > 0
            ? Text(
                'Code expires in ${_secondsToMinutes(snapshot.data!)} mins',
                textAlign: TextAlign.center,
              )
            : InkWell(
                child: const Text(
                  'Resend verification code',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Apptheme.lightCardColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  _timerController.add(300);
                  _startTimer();
                },
              );
      },
    );
  }
}
