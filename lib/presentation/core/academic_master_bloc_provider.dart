import 'package:academic_master/application/auth/auth_bloc.dart';
import 'package:academic_master/application/auth/edit_profile/edit_profile_bloc.dart';
import 'package:academic_master/application/auth/forgot_password_form/forgot_password_bloc.dart';
import 'package:academic_master/application/auth/register_form/register_form_bloc.dart';
import 'package:academic_master/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:academic_master/application/e_learning/add_user_comment/add_user_comment_bloc.dart';
import 'package:academic_master/application/e_learning/chats_and_friends/all_chatroom_watcher/all_chatroom_watcher_bloc.dart';
import 'package:academic_master/application/e_learning/chats_and_friends/personal_chat_message_actor/personal_chat_message_actor_bloc.dart';
import 'package:academic_master/application/e_learning/chats_and_friends/personal_chat_message_watcher/personal_chat_message_watcher_bloc.dart';
import 'package:academic_master/application/e_learning/chats_and_friends/watch_all_users_in_our_class/watch_all_users_in_our_class_bloc.dart';
import 'package:academic_master/application/e_learning/question_watcher/question_watcher_bloc.dart';
import 'package:academic_master/application/e_learning/subject_watcher/subject_watcher_bloc.dart';
import 'package:academic_master/application/e_learning/users_watcher/users_watcher_bloc.dart';
import 'package:academic_master/domain/auth/i_auth_facade.dart';
import 'package:academic_master/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcademicmasterBlocProvider extends StatelessWidget {
  const AcademicmasterBlocProvider({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => getIt<AuthBloc>()
            ..add(
              const AuthEvent.authCheckRequested(),
            ),
        ),
        BlocProvider<SignInFormBloc>(
          create: (context) => getIt<SignInFormBloc>(),
        ),
        BlocProvider<RegisterFormBloc>(
          create: (context) => getIt<RegisterFormBloc>(),
        ),
        BlocProvider<ForgotPasswordBloc>(
          create: (context) => ForgotPasswordBloc(
            getIt<IAuthFacade>(),
          ),
        ),
        BlocProvider<EditProfileBloc>(
          create: (context) => EditProfileBloc(
            getIt<IAuthFacade>(),
          ),
        ),
        BlocProvider(
          create: (context) => getIt<UsersWatcherBloc>()
            ..add(
              const UsersWatcherEvent.watchCurrentUser(),
            ),
        ),
        BlocProvider<SubjectWatcherBloc>(
          create: (context) => getIt<SubjectWatcherBloc>()
            ..add(const SubjectWatcherEvent.watchAllSubject()),
        ),
        BlocProvider<UsersWatcherBloc>(
          create: (context) => getIt<UsersWatcherBloc>(),
        ),
        BlocProvider<QuestionWatcherBloc>(
          create: (context) => getIt<QuestionWatcherBloc>()
            ..add(const QuestionWatcherEvent.watchAllQuestions()),
        ),
        BlocProvider<AddUserCommentBloc>(
          create: (context) => getIt<AddUserCommentBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<AllChatroomWatcherBloc>()
            ..add(
              const AllChatroomWatcherEvent.watchAllChatrooms(),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<WatchAllUsersInOurClassBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<PersonalChatMessageWatcherBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<PersonalChatMessageActorBloc>(),
        ),
      ],
      child: child,
    );
  }
}
