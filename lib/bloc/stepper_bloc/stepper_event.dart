// stepper_event.dart
import 'package:equatable/equatable.dart';

abstract class StepperEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StepContinue extends StepperEvent {}

class StepCancel extends StepperEvent {}

class StepTapped extends StepperEvent {
  final int index;

  StepTapped(this.index);

  @override
  List<Object?> get props => [index];
}
