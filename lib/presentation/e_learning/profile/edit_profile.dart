import 'package:academic_master/application/auth/edit_profile/edit_profile_bloc.dart';
import 'package:academic_master/application/e_learning/users_watcher/users_watcher_bloc.dart';
import 'package:academic_master/domain/auth/user.dart';
import 'package:academic_master/injection.dart';
import 'package:academic_master/presentation/core/custom_drop_down.dart';
import 'package:academic_master/presentation/core/custum_textfield.dart';
import 'package:academic_master/presentation/core/error.dart';
import 'package:academic_master/presentation/core/loading.dart';
import 'package:academic_master/presentation/extension/util_extensions.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:academic_master/presentation/utils/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late UsersWatcherBloc _usersWatcherBloc;

  late EditProfileBloc _editProfileBloc;
  @override
  void initState() {
    _editProfileBloc = getIt<EditProfileBloc>();
    _usersWatcherBloc = getIt<UsersWatcherBloc>()
      ..add(const UsersWatcherEvent.watchCurrentUser());

    1.delay(
      () {
        _usersWatcherBloc.state.mapOrNull(
          loadSuccess: (value) => _preUserState(value.users.first),
        );
      },
    );
    super.initState();
  }

  void _preUserState(User currentUser) {
    _editProfileBloc.add(
      EditProfileEvent.emailChanged(currentUser.email.getorCrash()),
    );
    _editProfileBloc.add(
      EditProfileEvent.nameChanged(
        currentUser.name.getorCrash(),
      ),
    );
    _editProfileBloc.add(
      EditProfileEvent.courseChanged(
        currentUser.course.getorCrash(),
      ),
    );
    _editProfileBloc.add(
      EditProfileEvent.branchChanged(
        currentUser.branch.getorCrash(),
      ),
    );

    _editProfileBloc.add(
      EditProfileEvent.yearChanged(
        currentUser.year.getorCrash(),
      ),
    );
    _editProfileBloc.add(
      EditProfileEvent.phoneNumberChanged(
        currentUser.contactNumber.getorCrash(),
      ),
    );
    _editProfileBloc.add(
      EditProfileEvent.collegeChanged(
        currentUser.college.getorCrash(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: leftPadding,
          right: rightpadding,
          top: topPadding1,
        ),
        child: SingleChildScrollView(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<UsersWatcherBloc>()
                  ..add(
                    const UsersWatcherEvent.watchCurrentUser(),
                  ),
              ),
              BlocProvider(
                create: (context) => _editProfileBloc,
              ),
            ],
            child: BlocBuilder<UsersWatcherBloc, UsersWatcherState>(
              builder: (context, state) {
                return state.map(
                  empty: (_) => const ErrorCard(),
                  initial: (value) => CircleLoading(),
                  loadFailure: (value) => const ErrorCard(),
                  loadInProgress: (value) => CircleLoading(),
                  loadSuccess: (value) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                AutoRouter.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20.h,
                                color: Apptheme.primaryColor,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Edit Profile",
                              style: Apptheme(context).boldText.copyWith(
                                    fontSize: 15.h,
                                  ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                _editProfileBloc.add(
                                  const EditProfileEvent.editProfilePressed(),
                                );

                                context.popRoute();
                              },
                              child: Image(
                                height: 20.h,
                                width: 20.h,
                                color: Apptheme.primaryColor,
                                image:
                                    const AssetImage("assets/icons/tick.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2 * toppadding,
                        ),
                        Text("Name", style: Apptheme(context).boldText),
                        SizedBox(
                          height: toppadding / 4,
                        ),
                        InputField(
                          hintText:
                              value.users.first.name.getorCrash().toUpperCase(),
                          textStyle: Apptheme(context).normalText,
                          inputBorder: const UnderlineInputBorder(),
                          focusBorder: const UnderlineInputBorder(),
                          onChanged: (value) {
                            debugPrint("this is name changed");
                            _editProfileBloc
                                .add(EditProfileEvent.nameChanged(value!));
                          },
                          validator: (_) =>
                              _editProfileBloc.state.name.value.fold(
                            (f) => f.maybeMap(
                              empty: (_) => 'Invalid Name',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                        ),
                        SizedBox(
                          height: toppadding,
                        ),
                        Text(
                          "Course",
                          style: Apptheme(context).boldText,
                        ),
                        SizedBox(
                          height: toppadding / 4,
                        ),
                        CustomDropDownButton(
                          items: const [
                            "btech",
                            "bpharma",
                            "dpharma",
                          ],
                          hintText: value.users.first.course
                              .getorCrash()
                              .toUpperCase(),
                          backgroundColor: Apptheme.backgroundColor,
                          onChanged: (value) {
                            debugPrint("this is user ");
                            _editProfileBloc
                                .add(EditProfileEvent.courseChanged(value!));
                          },
                          onTap: () {},
                          enableBorder: false,
                        ),
                        SizedBox(
                          height: toppadding,
                        ),
                        Text(
                          "Branch",
                          style: Apptheme(context).boldText,
                        ),
                        SizedBox(
                          height: toppadding / 4,
                        ),
                        CustomDropDownButton(
                          items: branchBtech,
                          hintText: value.users.first.branch
                              .getorCrash()
                              .toUpperCase(),
                          backgroundColor: Apptheme.backgroundColor,
                          onChanged: (value) {
                            _editProfileBloc
                                .add(EditProfileEvent.branchChanged(value!));
                          },
                          onTap: () {},
                          enableBorder: false,
                        ),
                        SizedBox(
                          height: toppadding,
                        ),
                        Text(
                          "Year",
                          style: Apptheme(context).boldText,
                        ),
                        SizedBox(
                          height: toppadding / 4,
                        ),
                        CustomDropDownButton(
                          items: yearBtech,
                          hintText:
                              value.users.first.year.getorCrash().toUpperCase(),
                          backgroundColor: Apptheme.backgroundColor,
                          onChanged: (value) {
                            _editProfileBloc
                                .add(EditProfileEvent.yearChanged(value!));
                          },
                          onTap: () {},
                          enableBorder: false,
                        ),
                        SizedBox(
                          height: toppadding,
                        ),
                        Text("Contact", style: Apptheme(context).boldText),
                        SizedBox(
                          height: toppadding / 4,
                        ),
                        InputField(
                          hintText: value.users.first.contactNumber
                              .getorCrash()
                              .toUpperCase(),
                          textStyle: Apptheme(context).normalText,
                          inputBorder: const UnderlineInputBorder(),
                          focusBorder: const UnderlineInputBorder(),
                          onChanged: (value) {
                            _editProfileBloc.add(
                              EditProfileEvent.phoneNumberChanged(value!),
                            );
                          },
                          validator: (_) =>
                              _editProfileBloc.state.phoneNumber.value.fold(
                            (f) => f.maybeMap(
                              invalidPhoneNumber: (_) => 'Invalid Number',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                        ),
                        SizedBox(
                          height: toppadding,
                        ),
                        Text("College", style: Apptheme(context).boldText),
                        SizedBox(
                          height: toppadding / 4,
                        ),
                        InputField(
                          hintText: value.users.first.college
                              .getorCrash()
                              .toUpperCase(),
                          textStyle: Apptheme(context).normalText,
                          inputBorder: const UnderlineInputBorder(),
                          focusBorder: const UnderlineInputBorder(),
                          onChanged: (value) {
                            _editProfileBloc.add(
                              EditProfileEvent.collegeChanged(value!),
                            );
                          },
                          validator: (_) =>
                              _editProfileBloc.state.college.value.fold(
                            (f) => f.maybeMap(
                              empty: (_) => 'Invalid College',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                        ),
                        SizedBox(
                          height: 3 * toppadding,
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
