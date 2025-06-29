// nav_state.dart
import 'package:equatable/equatable.dart';

class NavState extends Equatable {
  final int selectedIndex;

  const NavState({required this.selectedIndex});

  NavState copyWith({int? selectedIndex}) {
    return NavState(selectedIndex: selectedIndex ?? this.selectedIndex);
  }

  @override
  List<Object?> get props => [selectedIndex];
}
