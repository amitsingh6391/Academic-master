import 'package:academic_master/application/e_learning/question_actor/question_actor_bloc.dart';
import 'package:academic_master/application/e_learning/users_watcher/users_watcher_bloc.dart';
import 'package:academic_master/domain/e_learning/question.dart';
import 'package:academic_master/injection.dart';
import 'package:academic_master/presentation/core/empty.dart';
import 'package:academic_master/presentation/core/error.dart';
import 'package:academic_master/presentation/core/loading.dart';
import 'package:academic_master/presentation/e_learning/e_learning_dashboard/widgets/delete_confirmatation_pop_up.dart';
import 'package:academic_master/presentation/routes/router.gr.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:academic_master/presentation/utils/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class PostCrudPopup extends StatelessWidget {
  Question question;

  PostCrudPopup({
    super.key,
    required this.question,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocProvider(
      create: (context) => getIt<QuestionActorBloc>(),
      child: Align(
        child: Container(
          height: 180,
          width: 320,
          // ignore: sort_child_properties_last
          child: BlocProvider(
            create: (context) => getIt<UsersWatcherBloc>()
              ..add(
                const UsersWatcherEvent.watchCurrentUser(),
              ),
            child: BlocBuilder<UsersWatcherBloc, UsersWatcherState>(
              builder: (context, state) {
                return state.map(
                  initial: (_) => CircleLoading(),
                  loadInProgress: (_) => CircleLoading(),
                  loadSuccess: (currentLoginUser) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          if (currentLoginUser.users.first.id.getorCrash() ==
                              question.userId.getorCrash()) {
                            context.read<QuestionActorBloc>().add(
                                  QuestionActorEvent.deleted(question),
                                );

                            AutoRouter.of(context).pop().then((value) {
                              showGeneralDialog(
                                barrierLabel: "Barrier",
                                barrierDismissible: true,
                                barrierColor: Colors.black.withOpacity(0.5),
                                transitionDuration:
                                    const Duration(milliseconds: 800),
                                context: context,
                                pageBuilder: (_, __, ___) {
                                  return PostDeleteConfirmatationPopup(
                                    message: "Post deleted",
                                  );
                                },
                                transitionBuilder: (_, anim, __, child) {
                                  return SlideTransition(
                                    // ignore: require_trailing_commas
                                    position: Tween(
                                      begin: const Offset(1, 3),
                                      end: Offset.zero,
                                    ).animate(anim),
                                    child: child,
                                  );
                                },
                              );
                            });
                          } else {
                            AutoRouter.of(context).pop().then((value) {
                              showGeneralDialog(
                                barrierLabel: "Barrier",
                                barrierDismissible: true,
                                barrierColor: Colors.black.withOpacity(0.5),
                                transitionDuration:
                                    const Duration(milliseconds: 800),
                                context: context,
                                pageBuilder: (_, __, ___) {
                                  return PostDeleteConfirmatationPopup(
                                    message:
                                        "You do'nt have permission to delete this question",
                                  );
                                },
                                transitionBuilder: (_, anim, __, child) {
                                  return SlideTransition(
                                    // ignore: require_trailing_commas
                                    position: Tween(
                                      begin: const Offset(1, 3),
                                      end: Offset.zero,
                                    ).animate(anim),
                                    child: child,
                                  );
                                },
                              );
                            });
                          }
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: leftPadding,
                              ),
                              child: Text(
                                "Delete post",
                                style: Apptheme(context).boldText.copyWith(
                                      color: Apptheme.assentColor,
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 150),
                            const Icon(
                              Icons.delete_outline,
                              color: Apptheme.primaryColor,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          if (currentLoginUser.users.first.id.getorCrash() ==
                              question.userId.getorCrash()) {
                            AutoRouter.of(context).push(
                              QuestionFormRoute(editedQuestion: question),
                            );
                          } else {
                            AutoRouter.of(context).pop().then((value) {
                              showGeneralDialog(
                                barrierLabel: "Barrier",
                                barrierDismissible: true,
                                barrierColor: Colors.black.withOpacity(0.5),
                                transitionDuration:
                                    const Duration(milliseconds: 800),
                                context: context,
                                pageBuilder: (_, __, ___) {
                                  return PostDeleteConfirmatationPopup(
                                    message:
                                        "You do'nt have permission to edit this question",
                                  );
                                },
                                transitionBuilder: (_, anim, __, child) {
                                  return SlideTransition(
                                    // ignore: require_trailing_commas
                                    position: Tween(
                                      begin: const Offset(1, 3),
                                      end: Offset.zero,
                                    ).animate(anim),
                                    child: child,
                                  );
                                },
                              );
                            });
                          }
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: leftPadding,
                              ),
                              child: Text(
                                "Edit post",
                                style: Apptheme(context).boldText.copyWith(
                                      color: Apptheme.assentColor,
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 170),
                            const Icon(
                              Icons.edit_outlined,
                              color: Apptheme.primaryColor,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: leftPadding,
                            ),
                            child: Text(
                              "Copy Link",
                              style: Apptheme(context).boldText.copyWith(
                                    color: Apptheme.assentColor,
                                    fontSize: 15,
                                    decoration: TextDecoration.none,
                                  ),
                            ),
                          ),
                          const SizedBox(width: 165),
                          Transform.rotate(
                            angle: 15,
                            child: const Icon(
                              Icons.link_outlined,
                              color: Apptheme.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  loadFailure: (_) => const ErrorCard(),
                  empty: (_) => const EmptyScreen(
                    message: "No user can delete",
                    showLottie: false,
                  ),
                );
              },
            ),
          ),
          margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
