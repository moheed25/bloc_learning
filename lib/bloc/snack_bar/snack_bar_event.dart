// snackbar_event.dart
import 'package:equatable/equatable.dart';

abstract class SnackbarEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShowSnackbar extends SnackbarEvent {
  final String message;
  final bool isError;

  ShowSnackbar({required this.message, this.isError = false});

  @override
  List<Object?> get props => [message, isError];
}

class ClearSnackbar extends SnackbarEvent {}
