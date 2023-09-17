import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_plan_view.dart';
import 'change_plan_controller_cubit.dart';

class ChangePlan extends StatelessWidget {
  const ChangePlan({Key? key}) : super(key: key);
  static int id = -1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePlanControllerCubit(id),
      child: const ChangePlanView(),
    );
  }
}
