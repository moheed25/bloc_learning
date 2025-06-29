// snackbar_bloc.dart
import 'package:bloc_learning/bloc/snack_bar/snack_bar_event.dart';
import 'package:bloc_learning/bloc/snack_bar/snack_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SnackbarBloc extends Bloc<SnackbarEvent, SnackbarState> {
  SnackbarBloc() : super(SnackbarState.initial()) {
    on<ShowSnackbar>((event, emit) {
      emit(SnackbarState(message: event.message, isError: event.isError));
    });
    on<ClearSnackbar>((event, emit) {
      emit(SnackbarState.initial());
    });
  }
}
