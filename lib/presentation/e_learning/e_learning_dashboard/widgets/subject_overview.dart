import 'package:academic_master/application/e_learning/subject_watcher/subject_watcher_bloc.dart';
import 'package:academic_master/domain/e_learning/subject.dart';
import 'package:academic_master/domain/e_learning/subject_material.dart';
import 'package:academic_master/presentation/core/critical_failure.dart';
import 'package:academic_master/presentation/core/error.dart';
import 'package:academic_master/presentation/core/loading.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kt_dart/collection.dart';
import 'package:nil/nil.dart';

class SubjectOverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    );

    return BlocBuilder<SubjectWatcherBloc, SubjectWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => FindLoading(),
          loadSuccess: (state) {
            return SizedBox(
              height: 1.sw > 450 ? 400.h : 230.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final subject = state.subjects[index];
                  if (subject.failureOption.isSome()) {
                    return const ErrorCard();
                  } else {
                    return 1.sw < 451
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SubjectHeader(),
                              SubjectCard(subject: subject),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SubjectHeader(),
                              SubjectCard(subject: subject),
                            ],
                          );
                  }
                },
                itemCount: state.subjects.size,
              ),
            );
          },
          loadFailure: (state) {
            return CriticalFailureDisplay(
              failure: state.firbaseFailure,
            );
          },
        );
      },
    );
  }
}

class SubjectCard extends StatelessWidget {
  final Subject subject;

  const SubjectCard({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (subject.studyMaterial.length > 0) ...[
          ...subject.studyMaterial
              .getorCrash()
              .map(
                (studyMaterial) => SubjectDisplay(
                  studyMaterials: studyMaterial,
                ),
              )
              .iter
        ],
      ],
    );
  }
}

class SubjectHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    );
    return Padding(
      padding: EdgeInsets.only(
        left: 20.h,
        top: 1.sw > 450 ? 1.h : 20.h,
      ),
      child: Row(
        children: [
          Text(
            "Subjects",
            textAlign: TextAlign.end,
            style: Apptheme(context).thinText.copyWith(
                  fontSize: 20.sp,
                ),
          ),
          SizedBox(
            width: 1.sw / 2,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.h,
              top: 20.h,
            ),
            child: TextButton(
              onPressed: () {
                debugPrint("View all");
              },
              child: 1.sw < 451 ? const Text("View All > ") : nil,
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectDisplay extends StatelessWidget {
  final StudyMaterial studyMaterials;

  const SubjectDisplay({
    Key? key,
    required this.studyMaterials,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    );
    return Padding(
      padding: EdgeInsets.only(
        left: 20.h,
      ),
      child: Wrap(
        children: [
          Container(
            height: 1.sw > 450 ? 200.h : 130.h,
            width: 1.sw > 450 ? 1.sw / 3 : 130.h,
            decoration: BoxDecoration(
              color: Color(int.parse(studyMaterials.subjectColor.getorCrash())),
              // color: Apptheme.secondaryColor,
              borderRadius: BorderRadius.circular(20.h),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.h,
                right: 10.h,
                top: 1.sw > 450 ? 30.h : 20.h,
              ),
              child: Column(
                children: [
                  Center(
                    child: SvgPicture.network(
                      studyMaterials.subjectIcon.getorCrash(),
                      height: 1.sw > 450 ? 100.h : 70.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.sw > 450 ? 16.h : 15.h),
                    child: Text(
                      studyMaterials.subjectName.getorCrash(),
                      style:
                          Apptheme(context).boldText.copyWith(fontSize: 17.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
