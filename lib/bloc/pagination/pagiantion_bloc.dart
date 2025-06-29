// pagination_bloc.dart
import 'package:bloc_learning/bloc/pagination/pagiantion_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pagination_event.dart';

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  PaginationBloc()
      : super(const PaginationState(items: [], isLoading: false, hasReachedEnd: false)) {
    on<FetchMoreItems>(_onFetchMoreItems);
  }

  Future<void> _onFetchMoreItems(
      FetchMoreItems event, Emitter<PaginationState> emit) async {
    if (state.isLoading || state.hasReachedEnd) return;

    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 2)); // Simulate API delay

    final newItems = List.generate(20, (index) => 'Item ${state.items.length + index + 1}');

    emit(state.copyWith(
      items: List.from(state.items)..addAll(newItems),
      isLoading: false,
      hasReachedEnd: newItems.isEmpty, // Change this based on your API.
    ));
  }
}
