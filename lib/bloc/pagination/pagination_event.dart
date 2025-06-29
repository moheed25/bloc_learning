// pagination_event.dart
import 'package:equatable/equatable.dart';

abstract class PaginationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMoreItems extends PaginationEvent {}
