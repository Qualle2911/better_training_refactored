import 'package:better_training_refactored/App/UI/Screens/Workout/Exercises/exercises_cubit.dart';
import 'package:better_training_refactored/App/UI/Widgets/Cards/ExerciseCard/exercise_card.dart';
import 'package:better_training_refactored/DB/tables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Exercises extends StatelessWidget {
  const Exercises({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExercisesCubit(),
      child: BlocBuilder<ExercisesCubit, ExercisesState>(
        builder: (context, state) {
          if (state is ExercisesInitial) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is ExercisesLoaded) {
            int current = state.selectedExercise;
            List<UebungenData> data = state.exercises;
            return data.isEmpty
                ? const _EmptyView()
                : _FilledView(data: data, current: current);
          } else {
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          }
        },
      ),
    );
  }
}

class _FilledView extends StatelessWidget {
  const _FilledView({
    required this.data,
    required this.current,
  });

  final List<UebungenData> data;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                ExerciseCardExpanded(
                  data: data[current],
                ),
                (data.length > 1)
                    ? CarouselSlider(
                        items: [
                          for (int i = 0; i < data.length; i++)
                            ExerciseCardCollapsed(
                              posId: i,
                              data: data[i],
                            ),
                        ],
                        options: CarouselOptions(
                          height: 100,
                          padEnds: false,
                          viewportFraction: 1,
                          scrollDirection: Axis.vertical,
                          enlargeCenterPage: false,
                          enableInfiniteScroll: data.length > 1 ? true : false,
                          initialPage:
                              current + 1 < data.length ? current + 1 : 0,
                        ),
                        carouselController: context
                            .read<ExercisesCubit>()
                            .exerciseCarouselController,
                      )
                    : const SizedBox(),
              ],
            ),
            const Divider(),
            Row(
              children: const [
                Expanded(child: ExerciseCardAdd()),
              ],
            ),
            const Divider(),
          ],
        ),
      ],
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(24.0),
          child: Text("No plans yet"),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Divider(),
            Row(
              children: const [
                Expanded(child: ExerciseCardAdd()),
              ],
            ),
            const Divider(),
          ],
        ),
      ],
    );
  }
}
