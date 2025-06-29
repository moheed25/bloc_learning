// toggle_event.dart
import 'package:equatable/equatable.dart';

abstract class ToggleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ToggleSwitched extends ToggleEvent {
  final bool isEnabled;

  ToggleSwitched(this.isEnabled);

  @override
  List<Object?> get props => [isEnabled];
}