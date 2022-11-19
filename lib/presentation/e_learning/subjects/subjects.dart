import 'package:academic_master/application/e_learning/subject_watcher/subject_watcher_bloc.dart';
import 'package:academic_master/domain/e_learning/subject_material.dart';
import 'package:academic_master/presentation/core/appbar.dart';
import 'package:academic_master/presentation/core/critical_failure.dart';
import 'package:academic_master/presentation/core/loading.dart';
import 'package:academic_master/presentation/e_learning/subjects/widgets/subject_tile.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Subjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(),
        body: BlocBuilder<SubjectWatcherBloc, SubjectWatcherState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => Container(),
              loadInProgress: (_) => Center(child: FindLoading()),
              loadSuccess: (state) {
                return ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.h,
                        top: 20.h,
                        bottom: 10.h,
                      ),
                      child: Text(
                        "Subjects",
                        textAlign: TextAlign.start,
                        style: Apptheme(context)
                            .boldText
                            .copyWith(fontSize: 20.sp),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.subjects[0].studyMaterial.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1.sw > 450 ? 3 : 2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final StudyMaterial material = state
                            .subjects[0].studyMaterial
                            .getorCrash()
                            .get(index);

                        return SubjectDisplay(
                          studyMaterials: material,
                        );
                      },
                    ),
                  ],
                );
              },
              loadFailure: (state) {
                return CriticalFailureDisplay(
                  failure: state.firbaseFailure,
                );
              },
            );
          },
        ),
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
        left: 10.h,
        right: 10.h,
        bottom: 10.h,
        top: 10.h,
      ),
      child: FlipCard(
        speed: 2000,
        back: BackWidget(studyMaterials: studyMaterials),
        front: FrontWidget(studyMaterials: studyMaterials),
      ),
    );
  }
}

class FrontWidget extends StatelessWidget {
  const FrontWidget({
    Key? key,
    required this.studyMaterials,
  }) : super(key: key);

  final StudyMaterial studyMaterials;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(int.parse(studyMaterials.subjectColor.getorCrash())),
        borderRadius: BorderRadius.circular(20.h),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(top: 1.sw > 450 ? 20.h : 30.h),
              child: SvgPicture.network(
                studyMaterials.subjectIcon.getorCrash(),
                height: 1.sw > 450 ? 60.w : 60.h,
                width: 1.sw > 450 ? 60.w : 70.h,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(top: 1.sw > 450 ? 15.h : 3.h),
              child: Text(
                studyMaterials.subjectName.getorCrash(),
                style: Apptheme(context).boldText.copyWith(
                      fontSize: 18.h,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BackWidget extends StatelessWidget {
  const BackWidget({
    Key? key,
    required this.studyMaterials,
  }) : super(key: key);

  final StudyMaterial studyMaterials;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: 1.sw > 450 ? 1.sw / 3 : 1.sw / 2.5,
          decoration: BoxDecoration(
            color: Apptheme.backgroundColor,
            borderRadius: BorderRadius.circular(20.h),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              // top: 1.sw > 450 ? 30.h : 10.h,
              bottom: 10.h,
            ),
            child: Column(
              children: [
                Sujectile(
                  title: "Notes",
                  url: studyMaterials.subjectNote.getorCrash(),
                  backColor: studyMaterials.subjectColor.getorCrash(),
                ),
                Sujectile(
                  title: "Paper",
                  url: studyMaterials.subjectPaper.getorCrash(),
                  backColor: studyMaterials.subjectColor.getorCrash(),
                ),
                Sujectile(
                  title: "Syllaybus",
                  url: studyMaterials.subjectSyllaybus.getorCrash(),
                  backColor: studyMaterials.subjectColor.getorCrash(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
