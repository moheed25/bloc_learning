// stepper_widget.dart
import 'package:bloc_learning/bloc/stepper_bloc/stepper_boc.dart';
import 'package:bloc_learning/bloc/stepper_bloc/stepper_event.dart';
import 'package:bloc_learning/bloc/stepper_bloc/stepper_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StepperBlocWidget extends StatelessWidget {
  const StepperBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StepperBloc(),
      child: BlocBuilder<StepperBloc, StepperState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Stepper(
                  currentStep: state.currentStep,
                  onStepContinue: () {
                    context.read<StepperBloc>().add(StepContinue());
                  },
                  onStepCancel: () {
                    context.read<StepperBloc>().add(StepCancel());
                  },
                  onStepTapped: (index) {
                    context.read<StepperBloc>().add(StepTapped(index));
                  },
                  steps: const [
                    Step(
                      title: Text('Step 1'),
                      content: Text('Enter info for Step 1'),
                    ),
                    Step(
                      title: Text('Step 2'),
                      content: Text('Enter info for Step 2'),
                    ),
                    Step(
                      title: Text('Step 3'),
                      content: Text('Enter info for Step 3'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
