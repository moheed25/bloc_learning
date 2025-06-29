// search_state.dart
import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  final String query;
  final List<String> results;

  const SearchState({required this.query, required this.results});

  SearchState copyWith({String? query, List<String>? results}) {
    return SearchState(
      query: query ?? this.query,
      results: results ?? this.results,
    );
  }

  @override
  List<Object?> get props => [query, results];
}
