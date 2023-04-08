// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:academic_master/domain/e_learning/question.dart' as _i12;
import 'package:academic_master/presentation/auth/sign_in_page.dart' as _i2;
import 'package:academic_master/presentation/e_learning/chats_and_friends/personal_chat_screen.dart'
    as _i4;
import 'package:academic_master/presentation/e_learning/chats_and_friends/students_group_chat_screen.dart'
    as _i3;
import 'package:academic_master/presentation/e_learning/e_learning_dashboard/question_and_comments/question_form.dart'
    as _i7;
import 'package:academic_master/presentation/e_learning/homepage.dart' as _i5;
import 'package:academic_master/presentation/e_learning/profile/edit_profile.dart'
    as _i6;
import 'package:academic_master/presentation/e_learning/subjects/widgets/subject_pdfview.dart'
    as _i8;
import 'package:academic_master/presentation/splash/splash_page.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/cupertino.dart' as _i11;
import 'package:flutter/material.dart' as _i10;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.SplashPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SignInPage(),
      );
    },
    StudentsGroupChatScreen.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.StudentsGroupChatScreen(),
      );
    },
    PersonalChatScreen.name: (routeData) {
      final args = routeData.argsAs<PersonalChatScreenArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.PersonalChatScreen(
          key: args.key,
          partnerId: args.partnerId,
        ),
      );
    },
    Homepage.name: (routeData) {
      final args =
          routeData.argsAs<HomepageArgs>(orElse: () => const HomepageArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.Homepage(
          intialIndex: args.intialIndex,
          key: args.key,
        ),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.EditProfilePage(),
      );
    },
    QuestionFormRoute.name: (routeData) {
      final args = routeData.argsAs<QuestionFormRouteArgs>(
          orElse: () => const QuestionFormRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.QuestionFormPage(
          key: args.key,
          editedQuestion: args.editedQuestion,
        ),
      );
    },
    SubjectPdfView.name: (routeData) {
      final args = routeData.argsAs<SubjectPdfViewArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.SubjectPdfView(args.url),
      );
    },
  };
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i9.PageRouteInfo<void> {
  const SignInRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.StudentsGroupChatScreen]
class StudentsGroupChatScreen extends _i9.PageRouteInfo<void> {
  const StudentsGroupChatScreen({List<_i9.PageRouteInfo>? children})
      : super(
          StudentsGroupChatScreen.name,
          initialChildren: children,
        );

  static const String name = 'StudentsGroupChatScreen';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PersonalChatScreen]
class PersonalChatScreen extends _i9.PageRouteInfo<PersonalChatScreenArgs> {
  PersonalChatScreen({
    _i10.Key? key,
    required String partnerId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          PersonalChatScreen.name,
          args: PersonalChatScreenArgs(
            key: key,
            partnerId: partnerId,
          ),
          initialChildren: children,
        );

  static const String name = 'PersonalChatScreen';

  static const _i9.PageInfo<PersonalChatScreenArgs> page =
      _i9.PageInfo<PersonalChatScreenArgs>(name);
}

class PersonalChatScreenArgs {
  const PersonalChatScreenArgs({
    this.key,
    required this.partnerId,
  });

  final _i10.Key? key;

  final String partnerId;

  @override
  String toString() {
    return 'PersonalChatScreenArgs{key: $key, partnerId: $partnerId}';
  }
}

/// generated route for
/// [_i5.Homepage]
class Homepage extends _i9.PageRouteInfo<HomepageArgs> {
  Homepage({
    int? intialIndex,
    _i11.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          Homepage.name,
          args: HomepageArgs(
            intialIndex: intialIndex,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'Homepage';

  static const _i9.PageInfo<HomepageArgs> page =
      _i9.PageInfo<HomepageArgs>(name);
}

class HomepageArgs {
  const HomepageArgs({
    this.intialIndex,
    this.key,
  });

  final int? intialIndex;

  final _i11.Key? key;

  @override
  String toString() {
    return 'HomepageArgs{intialIndex: $intialIndex, key: $key}';
  }
}

/// generated route for
/// [_i6.EditProfilePage]
class EditProfileRoute extends _i9.PageRouteInfo<void> {
  const EditProfileRoute({List<_i9.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.QuestionFormPage]
class QuestionFormRoute extends _i9.PageRouteInfo<QuestionFormRouteArgs> {
  QuestionFormRoute({
    _i10.Key? key,
    _i12.Question? editedQuestion,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          QuestionFormRoute.name,
          args: QuestionFormRouteArgs(
            key: key,
            editedQuestion: editedQuestion,
          ),
          initialChildren: children,
        );

  static const String name = 'QuestionFormRoute';

  static const _i9.PageInfo<QuestionFormRouteArgs> page =
      _i9.PageInfo<QuestionFormRouteArgs>(name);
}

class QuestionFormRouteArgs {
  const QuestionFormRouteArgs({
    this.key,
    this.editedQuestion,
  });

  final _i10.Key? key;

  final _i12.Question? editedQuestion;

  @override
  String toString() {
    return 'QuestionFormRouteArgs{key: $key, editedQuestion: $editedQuestion}';
  }
}

/// generated route for
/// [_i8.SubjectPdfView]
class SubjectPdfView extends _i9.PageRouteInfo<SubjectPdfViewArgs> {
  SubjectPdfView({
    required String url,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          SubjectPdfView.name,
          args: SubjectPdfViewArgs(url: url),
          initialChildren: children,
        );

  static const String name = 'SubjectPdfView';

  static const _i9.PageInfo<SubjectPdfViewArgs> page =
      _i9.PageInfo<SubjectPdfViewArgs>(name);
}

class SubjectPdfViewArgs {
  const SubjectPdfViewArgs({required this.url});

  final String url;

  @override
  String toString() {
    return 'SubjectPdfViewArgs{url: $url}';
  }
}
