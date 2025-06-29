// nav_bloc.dart
import 'package:bloc_learning/bloc/bottom_nav_bar/nav_bar_event.dart';
import 'package:bloc_learning/bloc/bottom_nav_bar/nav_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(const NavState(selectedIndex: 0)) {
    on<NavItemSelected>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
  }
}
