// search_bloc.dart
import 'package:bloc_learning/bloc/search_bar_with_suggestion/search_bar_with_suggestion_events.dart';
import 'package:bloc_learning/bloc/search_bar_with_suggestion/search_bar_with_suggestion_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final List<String> allItems;

  SearchBloc(this.allItems)
      : super(const SearchState(query: '', results: [])) {
    on<SearchTextChanged>((event, emit) {
      final query = event.query.toLowerCase();
      final filtered = allItems
          .where((item) => item.toLowerCase().contains(query))
          .toList();
      emit(SearchState(query: query, results: filtered));
    });
  }
}
