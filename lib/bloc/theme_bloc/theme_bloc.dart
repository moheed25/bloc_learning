// toggle_bloc.dart



import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/theme_bloc/theme_events.dart';
import 'package:bloc_learning/bloc/theme_bloc/theme_states.dart';

class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleBloc() : super(const ToggleState(isDarkMode: false)) {
    on<ToggleSwitched>((event, emit) {
      emit(state.copyWith(isDarkMode: event.isEnabled));
    });
  }
}
