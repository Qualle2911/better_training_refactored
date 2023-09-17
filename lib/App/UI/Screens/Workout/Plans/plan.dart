import 'package:better_training_refactored/App/UI/Screens/Workout/Plans/plan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:better_training_refactored/App/UI/Widgets/Cards/PlanCard/PlanCard.dart';
import 'package:better_training_refactored/DB/tables.dart';
import 'package:better_training_refactored/injectable/injectable_handler.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

class Plan extends StatefulWidget {
  const Plan({Key? key}) : super(key: key);

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlanCubit(),
      child: BlocBuilder<PlanCubit, PlanState>(builder: (context, state) {
        if (state is PlanInitial) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is PlanLoaded) {
          int current = state.currentPlan;
          List<TrainingsPlanData> data = state.plaene;
          return data.isEmpty
              ? const _EmptyView()
              : PlanningContent(
                  current: current,
                  data: data,
                );
        } else {
          return const Scaffold(
            body: Center(
              child: Text("Error"),
            ),
          );
        }
      }),
    );
  }
}

class PlanningContent extends StatefulWidget {
  final Widget image = SvgPicture.asset("assets/img/whole_body.svg");
  final DateTime lastSession = DateTime.now();
  final Logger logger = getIt<Env>().logger;
  final int current;
  final List<TrainingsPlanData> data;

  PlanningContent({Key? key, required this.current, required this.data})
      : super(key: key);

  @override
  State<PlanningContent> createState() => _PlanningContentState();
}

class _PlanningContentState extends State<PlanningContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            PlanCardExpanded(
                              data: widget.data[widget.current],
                            ),
                            (widget.data.length > 1)
                                ? CarouselSlider(
                                    items: [
                                      for (int i = 0; i < widget.data.length; i++)
                                        PlanCardCollapsed(
                                          posId: i,
                                          data: widget.data[i],
                                        ),
                                    ],
                                    options: CarouselOptions(
                                      height: 100,
                                      padEnds: false,
                                      viewportFraction: 1,
                                      scrollDirection: Axis.vertical,
                                      enlargeCenterPage: false,
                                      enableInfiniteScroll:
                                          widget.data.length > 1 ? true : false,
                                      initialPage: widget.current + 1 < widget.data.length
                                          ? widget.current + 1
                                          : 0,
                                      onPageChanged: (index, reason) {
                                        widget.logger.i("onPageChanged: $index, $reason");
                                        setState(() {});
                                      },
                                    ),
                                    carouselController:
                                        context.read<PlanCubit>().planCarouselController,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: const [
                      Expanded(child: PlanCardAdd()),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(24.0),
          child: Text("No plans yet"),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Divider(),
                  Row(
                    children: const [
                      Expanded(child: PlanCardAdd()),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
