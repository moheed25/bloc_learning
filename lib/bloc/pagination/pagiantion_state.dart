// pagination_state.dart
import 'package:equatable/equatable.dart';

class PaginationState extends Equatable {
  final List<String> items;
  final bool isLoading;
  final bool hasReachedEnd;

  const PaginationState({
    required this.items,
    required this.isLoading,
    required this.hasReachedEnd,
  });

  PaginationState copyWith({
    List<String>? items,
    bool? isLoading,
    bool? hasReachedEnd,
  }) {
    return PaginationState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
    );
  }

  @override
  List<Object?> get props => [items, isLoading, hasReachedEnd];
}
