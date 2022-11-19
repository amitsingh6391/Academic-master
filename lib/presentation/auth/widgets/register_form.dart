import 'package:academic_master/application/auth/auth_bloc.dart';
import 'package:academic_master/application/auth/register_form/register_form_bloc.dart';
import 'package:academic_master/presentation/core/custum_textfield.dart';
import 'package:academic_master/presentation/core/loading.dart';
import 'package:academic_master/presentation/routes/router.gr.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Myclass extends StatefulWidget {
  @override
  _MyclassState createState() => _MyclassState();
}

class _MyclassState extends State<Myclass> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  int _currentStep = 0;

  StepperType stepperType = StepperType.vertical;

  TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  late String finalCourse = "btech";
  late String finalBranch = "cse";
  late String finalYear = "firstYear";

  double btechCircleHeight = 120;
  double bpharmaCircleHeight = 120;
  double dpharmaCircleHeight = 120;
  Color btechCircleColor = Apptheme.secondaryColor;
  Color bpharmaCircleColor = Apptheme.secondaryColor;
  Color dpharmaCircleColor = Apptheme.secondaryColor;

  double cseCircleHeight = 120;
  double mechnicalCircleHeight = 120;
  double civilCircleHeight = 120;
  double eceCircleHeight = 120;
  double itCircleHeight = 120;
  double electricalCircleHeight = 120;

  Color cseCircleColor = Apptheme.secondaryColor;
  Color mechnicalCircleColor = Apptheme.secondaryColor;
  Color civilCircleColor = Apptheme.secondaryColor;
  Color eceCircleColor = Apptheme.secondaryColor;
  Color itCircleColor = Apptheme.secondaryColor;
  Color electricalCircleColor = Apptheme.secondaryColor;

  double firstYearCircleHeight = 120;
  double secondYearCircleHeight = 120;
  double thirdYearCircleHeight = 120;
  double fourthYearCircleHeight = 120;

  Color firstYearCircleColor = Apptheme.secondaryColor;
  Color secondYearCircleColor = Apptheme.secondaryColor;
  Color thirdYearCircleColor = Apptheme.secondaryColor;
  Color fourthYearCircleColor = Apptheme.secondaryColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<RegisterFormBloc, RegisterFormState>(
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
        return IgnorePointer(
          ignoring: state.isSubmitting,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                if (state.isSubmitting)
                  Positioned(
                    top: size.height * 0.28,
                    left: size.width * 0.4,
                    child: CircleLoading(),
                  ),
                const SizedBox(height: 30),
                Stepper(
                  type: stepperType,
                  physics: const ScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued,
                  onStepCancel: cancel,
                  steps: <Step>[
                    Step(
                      title: const Text('Basic Details'),
                      subtitle: const Text("STEP 1"),
                      content: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            InputField(
                              labelText: 'User Name',
                              prefixIcon: const Icon(Icons.person_outline),
                              onChanged: (value) => context
                                  .read<RegisterFormBloc>()
                                  .add(RegisterFormEvent.nameChanged(value!)),
                              validator: (_) => context
                                  .read<RegisterFormBloc>()
                                  .state
                                  .name
                                  .value
                                  .fold(
                                    (f) => f.maybeMap(
                                      empty: (_) => 'Invalid Name',
                                      orElse: () => null,
                                    ),
                                    (_) => null,
                                  ),
                            ),
                            InputField(
                              labelText: 'Email',
                              prefixIcon: const Icon(Icons.email_outlined),
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) => context
                                  .read<RegisterFormBloc>()
                                  .add(RegisterFormEvent.emailChanged(value!)),
                              validator: (_) => context
                                  .read<RegisterFormBloc>()
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
                            InputField(
                              labelText: 'Phone Number',
                              prefixIcon:
                                  const Icon(Icons.phone_android_outlined),
                              keyboardType: TextInputType.phone,
                              onChanged: (value) =>
                                  context.read<RegisterFormBloc>().add(
                                        RegisterFormEvent.phoneNumberChanged(
                                          value!,
                                        ),
                                      ),
                              validator: (_) => context
                                  .read<RegisterFormBloc>()
                                  .state
                                  .phoneNumber
                                  .value
                                  .fold(
                                    (f) => f.maybeMap(
                                      invalidPhoneNumber: (_) =>
                                          'Invalid Number',
                                      orElse: () => null,
                                    ),
                                    (_) => null,
                                  ),
                            ),
                            InputField(
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock_outline),
                              isPassword: true,
                              onChanged: (value) =>
                                  context.read<RegisterFormBloc>().add(
                                        RegisterFormEvent.passwordChanged(
                                          value!,
                                        ),
                                      ),
                              validator: (_) => context
                                  .read<RegisterFormBloc>()
                                  .state
                                  .password
                                  .value
                                  .fold(
                                    (f) => f.maybeMap(
                                      shortPassword: (_) => 'Short Password',
                                      orElse: () => null,
                                    ),
                                    (_) => null,
                                  ),
                            ),
                            InputField(
                              labelText: 'College',
                              prefixIcon: const Icon(Icons.school),
                              onChanged: (value) => context
                                  .read<RegisterFormBloc>()
                                  .add(
                                    RegisterFormEvent.collegeChanged(value!),
                                  ),
                              validator: (_) => context
                                  .read<RegisterFormBloc>()
                                  .state
                                  .college
                                  .value
                                  .fold(
                                    (f) => f.maybeMap(
                                      empty: (_) => 'Invalid College',
                                      orElse: () => null,
                                    ),
                                    (_) => null,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: const Text('Course'),
                      subtitle: const Text("STEP 2"),
                      content: Wrap(
                        children: <Widget>[
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      btechCircleHeight = 200;
                                      bpharmaCircleHeight = 120;
                                      dpharmaCircleHeight = 120;

                                      btechCircleColor = Apptheme.primaryColor;
                                      bpharmaCircleColor =
                                          Apptheme.secondaryColor;
                                      dpharmaCircleColor =
                                          Apptheme.secondaryColor;

                                      finalCourse = "btech";
                                    });
                                  },
                                  onDoubleTap: () {
                                    setState(() {
                                      btechCircleHeight = 120;
                                      btechCircleColor =
                                          Apptheme.secondaryColor;
                                    });
                                  },
                                  child: mycircle(
                                    "BTECH",
                                    btechCircleHeight,
                                    btechCircleColor,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      bpharmaCircleHeight = 200;
                                      bpharmaCircleColor =
                                          Apptheme.primaryColor;

                                      btechCircleHeight = 120;

                                      dpharmaCircleHeight = 120;

                                      btechCircleColor =
                                          Apptheme.secondaryColor;
                                      dpharmaCircleColor =
                                          Apptheme.secondaryColor;

                                      finalCourse = "bpharma";
                                    });
                                  },
                                  onDoubleTap: () {
                                    setState(() {
                                      bpharmaCircleHeight = 120;
                                      bpharmaCircleColor =
                                          Apptheme.secondaryColor;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 38.0,
                                    ),
                                    child: mycircle(
                                      "BPHARMA",
                                      bpharmaCircleHeight,
                                      bpharmaCircleColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                dpharmaCircleHeight = 200;
                                dpharmaCircleColor = Apptheme.primaryColor;

                                bpharmaCircleHeight = 120;
                                btechCircleHeight = 120;

                                btechCircleColor = Apptheme.secondaryColor;
                                bpharmaCircleColor = Apptheme.secondaryColor;

                                finalCourse = "dpharma";
                              });
                            },
                            onDoubleTap: () {
                              setState(() {
                                dpharmaCircleHeight = 120;
                                dpharmaCircleColor = Apptheme.secondaryColor;
                              });
                            },
                            child: mycircle(
                              "DPHARMA",
                              dpharmaCircleHeight,
                              dpharmaCircleColor,
                            ),
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: const Text('Branch'),
                      subtitle: const Text("STEP 3  ( only for btech)"),
                      content: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      cseCircleHeight = 150;
                                      cseCircleColor = Apptheme.primaryColor;

                                      civilCircleHeight = 120;
                                      mechnicalCircleHeight = 120;
                                      eceCircleHeight = 120;
                                      electricalCircleHeight = 120;
                                      itCircleHeight = 120;

                                      civilCircleColor =
                                          Apptheme.secondaryColor;
                                      mechnicalCircleColor =
                                          Apptheme.secondaryColor;
                                      eceCircleColor = Apptheme.secondaryColor;
                                      electricalCircleColor =
                                          Apptheme.secondaryColor;
                                      itCircleColor = Apptheme.secondaryColor;

                                      finalBranch = "cse";
                                    });
                                  },
                                  onDoubleTap: () {
                                    setState(() {
                                      cseCircleHeight = 120;
                                      cseCircleColor = Apptheme.secondaryColor;
                                    });
                                  },
                                  child: mycircle(
                                    "CSE",
                                    cseCircleHeight,
                                    cseCircleColor,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      mechnicalCircleHeight = 200;
                                      civilCircleHeight = 120;
                                      cseCircleHeight = 120;
                                      eceCircleHeight = 120;
                                      electricalCircleHeight = 120;
                                      itCircleHeight = 120;

                                      mechnicalCircleColor =
                                          Apptheme.primaryColor;

                                      civilCircleColor =
                                          Apptheme.secondaryColor;

                                      civilCircleColor =
                                          Apptheme.secondaryColor;
                                      cseCircleColor = Apptheme.secondaryColor;
                                      eceCircleColor = Apptheme.secondaryColor;
                                      electricalCircleColor =
                                          Apptheme.secondaryColor;
                                      itCircleColor = Apptheme.secondaryColor;

                                      finalBranch = "mechnical";
                                    });
                                  },
                                  onDoubleTap: () {
                                    setState(() {
                                      mechnicalCircleHeight = 120;
                                      mechnicalCircleColor =
                                          Apptheme.secondaryColor;
                                    });
                                  },
                                  child: mycircle(
                                    "MECHNICAL",
                                    mechnicalCircleHeight,
                                    mechnicalCircleColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        civilCircleHeight = 200;
                                        mechnicalCircleHeight = 120;
                                        cseCircleHeight = 120;
                                        eceCircleHeight = 120;
                                        electricalCircleHeight = 120;
                                        itCircleHeight = 120;

                                        civilCircleColor =
                                            Apptheme.primaryColor;

                                        mechnicalCircleColor =
                                            Apptheme.secondaryColor;

                                        cseCircleColor =
                                            Apptheme.secondaryColor;
                                        eceCircleColor =
                                            Apptheme.secondaryColor;
                                        electricalCircleColor =
                                            Apptheme.secondaryColor;
                                        itCircleColor = Apptheme.secondaryColor;

                                        finalBranch = "civil";
                                      });
                                    },
                                    onDoubleTap: () {
                                      setState(() {
                                        civilCircleHeight = 120;
                                        civilCircleColor =
                                            Apptheme.secondaryColor;
                                      });
                                    },
                                    child: mycircle(
                                      "C I V I L",
                                      civilCircleHeight,
                                      civilCircleColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        itCircleHeight = 150;
                                        mechnicalCircleHeight = 120;
                                        cseCircleHeight = 120;
                                        eceCircleHeight = 120;
                                        electricalCircleHeight = 120;
                                        civilCircleHeight = 120;

                                        itCircleColor = Apptheme.primaryColor;

                                        mechnicalCircleColor =
                                            Apptheme.secondaryColor;

                                        cseCircleColor =
                                            Apptheme.secondaryColor;
                                        eceCircleColor =
                                            Apptheme.secondaryColor;
                                        electricalCircleColor =
                                            Apptheme.secondaryColor;
                                        civilCircleColor =
                                            Apptheme.secondaryColor;

                                        finalBranch = "it";
                                      });
                                    },
                                    onDoubleTap: () {
                                      setState(() {
                                        itCircleHeight = 120;
                                        itCircleColor = Apptheme.secondaryColor;
                                      });
                                    },
                                    child: mycircle(
                                      " I  T ",
                                      itCircleHeight,
                                      itCircleColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        eceCircleHeight = 150;
                                        mechnicalCircleHeight = 120;
                                        cseCircleHeight = 120;
                                        civilCircleHeight = 120;
                                        electricalCircleHeight = 120;
                                        itCircleHeight = 120;

                                        eceCircleColor = Apptheme.primaryColor;

                                        mechnicalCircleColor =
                                            Apptheme.secondaryColor;

                                        cseCircleColor =
                                            Apptheme.secondaryColor;
                                        civilCircleColor =
                                            Apptheme.secondaryColor;
                                        electricalCircleColor =
                                            Apptheme.secondaryColor;
                                        itCircleColor = Apptheme.secondaryColor;

                                        finalBranch = "ece";
                                      });
                                    },
                                    onDoubleTap: () {
                                      setState(() {
                                        eceCircleHeight = 120;
                                        eceCircleColor =
                                            Apptheme.secondaryColor;
                                      });
                                    },
                                    child: mycircle(
                                      " E C E",
                                      eceCircleHeight,
                                      eceCircleColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        electricalCircleHeight = 200;
                                        mechnicalCircleHeight = 120;
                                        cseCircleHeight = 120;
                                        eceCircleHeight = 120;
                                        civilCircleHeight = 120;
                                        itCircleHeight = 120;

                                        electricalCircleColor =
                                            Apptheme.primaryColor;

                                        mechnicalCircleColor =
                                            Apptheme.secondaryColor;

                                        cseCircleColor =
                                            Apptheme.secondaryColor;
                                        eceCircleColor =
                                            Apptheme.secondaryColor;
                                        civilCircleColor =
                                            Apptheme.secondaryColor;
                                        itCircleColor = Apptheme.secondaryColor;

                                        finalBranch = "electrical";
                                      });
                                    },
                                    onDoubleTap: () {
                                      setState(() {
                                        electricalCircleHeight = 120;
                                        electricalCircleColor =
                                            Apptheme.secondaryColor;
                                      });
                                    },
                                    child: mycircle(
                                      "ELECTRICAL",
                                      electricalCircleHeight,
                                      electricalCircleColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: const Text('Year'),
                      subtitle: const Text("STEP 4"),
                      content: Column(
                        children: [
                          if (finalCourse == "btech" ||
                              finalCourse == "bpharma")
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            firstYearCircleHeight = 200;
                                            secondYearCircleHeight = 120;
                                            thirdYearCircleHeight = 120;
                                            fourthYearCircleHeight = 120;
                                            firstYearCircleColor =
                                                Apptheme.primaryColor;
                                            secondYearCircleColor =
                                                Apptheme.secondaryColor;
                                            thirdYearCircleColor =
                                                Apptheme.secondaryColor;
                                            fourthYearCircleColor =
                                                Apptheme.secondaryColor;

                                            finalYear = "firstYear";
                                          });
                                        },
                                        onDoubleTap: () {
                                          setState(() {
                                            firstYearCircleHeight = 120;
                                            firstYearCircleColor =
                                                Apptheme.secondaryColor;
                                          });
                                        },
                                        child: mycircle(
                                          "1 year",
                                          firstYearCircleHeight,
                                          firstYearCircleColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            secondYearCircleHeight = 200;
                                            firstYearCircleHeight = 120;
                                            thirdYearCircleHeight = 120;
                                            fourthYearCircleHeight = 120;
                                            secondYearCircleColor =
                                                Apptheme.primaryColor;
                                            firstYearCircleColor =
                                                Apptheme.secondaryColor;
                                            thirdYearCircleColor =
                                                Apptheme.secondaryColor;
                                            fourthYearCircleColor =
                                                Apptheme.secondaryColor;
                                            finalYear = "secondYear";
                                          });
                                        },
                                        onDoubleTap: () {
                                          setState(() {
                                            secondYearCircleHeight = 120;
                                            secondYearCircleColor =
                                                Apptheme.secondaryColor;
                                          });
                                        },
                                        child: mycircle(
                                          "2 year",
                                          secondYearCircleHeight,
                                          secondYearCircleColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              thirdYearCircleHeight = 200;
                                              secondYearCircleHeight = 120;
                                              firstYearCircleHeight = 120;
                                              fourthYearCircleHeight = 120;
                                              thirdYearCircleColor =
                                                  Apptheme.primaryColor;
                                              secondYearCircleColor =
                                                  Apptheme.secondaryColor;
                                              firstYearCircleColor =
                                                  Apptheme.secondaryColor;
                                              fourthYearCircleColor =
                                                  Apptheme.secondaryColor;
                                              finalYear = "thirdYear";
                                            });
                                          },
                                          onDoubleTap: () {
                                            setState(() {
                                              thirdYearCircleHeight = 120;
                                              thirdYearCircleColor =
                                                  Apptheme.secondaryColor;
                                            });
                                          },
                                          child: mycircle(
                                            "3 year",
                                            thirdYearCircleHeight,
                                            thirdYearCircleColor,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              fourthYearCircleHeight = 200;
                                              firstYearCircleHeight = 120;
                                              thirdYearCircleHeight = 120;
                                              secondYearCircleHeight = 120;
                                              fourthYearCircleColor =
                                                  Apptheme.primaryColor;
                                              firstYearCircleColor =
                                                  Apptheme.secondaryColor;
                                              thirdYearCircleColor =
                                                  Apptheme.secondaryColor;
                                              secondYearCircleColor =
                                                  Apptheme.secondaryColor;
                                              finalYear = "fourthYear";
                                            });
                                          },
                                          onDoubleTap: () {
                                            setState(() {
                                              fourthYearCircleHeight = 120;
                                              fourthYearCircleColor =
                                                  Apptheme.secondaryColor;
                                            });
                                          },
                                          child: mycircle(
                                            "4 year",
                                            fourthYearCircleHeight,
                                            fourthYearCircleColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          else
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        firstYearCircleHeight = 200;
                                        secondYearCircleHeight = 120;
                                        thirdYearCircleHeight = 120;
                                        fourthYearCircleHeight = 120;
                                        firstYearCircleColor =
                                            Apptheme.primaryColor;
                                        secondYearCircleColor =
                                            Apptheme.secondaryColor;
                                        thirdYearCircleColor =
                                            Apptheme.secondaryColor;
                                        fourthYearCircleColor =
                                            Apptheme.secondaryColor;
                                        finalYear = "firstYear";
                                      });
                                    },
                                    onDoubleTap: () {
                                      setState(() {
                                        firstYearCircleHeight = 120;
                                        firstYearCircleColor =
                                            Apptheme.secondaryColor;
                                      });
                                    },
                                    child: mycircle(
                                      "1 year",
                                      firstYearCircleHeight,
                                      firstYearCircleColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        secondYearCircleHeight = 200;
                                        firstYearCircleHeight = 120;
                                        thirdYearCircleHeight = 120;
                                        fourthYearCircleHeight = 120;
                                        secondYearCircleColor =
                                            Apptheme.primaryColor;
                                        firstYearCircleColor =
                                            Apptheme.secondaryColor;
                                        thirdYearCircleColor =
                                            Apptheme.secondaryColor;
                                        fourthYearCircleColor =
                                            Apptheme.secondaryColor;
                                        finalYear = "secondYear";
                                      });
                                    },
                                    onDoubleTap: () {
                                      setState(() {
                                        firstYearCircleHeight = 120;
                                        firstYearCircleColor =
                                            Apptheme.secondaryColor;
                                      });
                                    },
                                    child: mycircle(
                                      "2 year",
                                      secondYearCircleHeight,
                                      secondYearCircleColor,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 3
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  AnimatedContainer mycircle(
    String title,
    double circleHeight,
    Color circleColor,
  ) {
    return AnimatedContainer(
      height: circleHeight,
      duration: const Duration(seconds: 3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: "Circular",
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  void tapped(int step) {
    setState(() => _currentStep = step);
  }

  void continued() {
    if (_currentStep >= 2) {
      if (_currentStep < 3) {
        setState(
          () {
            _currentStep += 1;
          },
        );
      } else {
        debugPrint("my final branch $finalBranch");
        debugPrint(finalCourse);
        debugPrint(finalYear);

        context
            .read<RegisterFormBloc>()
            .add(RegisterFormEvent.courseChanged(finalCourse));
        context
            .read<RegisterFormBloc>()
            .add(RegisterFormEvent.branchChanged(finalBranch));
        context
            .read<RegisterFormBloc>()
            .add(RegisterFormEvent.yearChanged(finalYear));

        context
            .read<RegisterFormBloc>()
            .add(RegisterFormEvent.courseChanged(finalCourse));
        context
            .read<RegisterFormBloc>()
            .add(RegisterFormEvent.branchChanged(finalBranch));
        context
            .read<RegisterFormBloc>()
            .add(RegisterFormEvent.yearChanged(finalYear));

        FocusScope.of(context).unfocus();
        context.read<RegisterFormBloc>().add(
              const RegisterFormEvent.registerWithEmailAndPasswordPressed(),
            );
      }
    } else {
      if (_currentStep == 0) {
        if (formKey.currentState!.validate()) {
          setState(() {
            _currentStep += 1;
          });
        }
      } else {
        if (_currentStep == 1) {
          if ([
            "btech",
            "bpharma",
            "dpharma",
          ].contains(finalCourse)) {
            context
                .read<RegisterFormBloc>()
                .add(RegisterFormEvent.courseChanged(finalCourse));

            setState(() {
              if (finalCourse == "btech") {
                _currentStep += 1;
              } else {
                _currentStep += 2;
                finalCourse == "bpharma"
                    ? finalBranch = "bpharma"
                    : finalBranch = "dpharma";
              }
            });
          }
        }
      }
    }
  }

  void cancel() {
    // ignore: unnecessary_statements
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}

class LoadingIndicator {}
