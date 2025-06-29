// snackbar_state.dart
import 'package:equatable/equatable.dart';

class SnackbarState extends Equatable {
  final String? message;
  final bool isError;

  const SnackbarState({this.message, this.isError = false});

  factory SnackbarState.initial() => const SnackbarState();

  @override
  List<Object?> get props => [message ?? '', isError];
}
