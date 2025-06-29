// stepper_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'stepper_event.dart';
import 'stepper_state.dart';

class StepperBloc extends Bloc<StepperEvent, StepperState> {
  StepperBloc() : super(const StepperState(currentStep: 0)) {
    on<StepContinue>((event, emit) {
      if (state.currentStep < 2) {
        emit(state.copyWith(currentStep: state.currentStep + 1));
      }
    });

    on<StepCancel>((event, emit) {
      if (state.currentStep > 0) {
        emit(state.copyWith(currentStep: state.currentStep - 1));
      }
    });

    on<StepTapped>((event, emit) {
      emit(state.copyWith(currentStep: event.index));
    });
  }
}
