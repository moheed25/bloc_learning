// stepper_state.dart
import 'package:equatable/equatable.dart';

class StepperState extends Equatable {
  final int currentStep;

  const StepperState({required this.currentStep});

  StepperState copyWith({int? currentStep}) {
    return StepperState(currentStep: currentStep ?? this.currentStep);
  }

  @override
  List<Object?> get props => [currentStep];
}
