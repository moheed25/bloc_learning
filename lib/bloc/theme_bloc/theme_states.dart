// toggle_state.dart
import 'package:equatable/equatable.dart';

class ToggleState extends Equatable {
  final bool isDarkMode;

  const ToggleState({required this.isDarkMode});

  ToggleState copyWith({bool? isDarkMode}) {
    return ToggleState(isDarkMode: isDarkMode ?? this.isDarkMode);
  }

  @override
  List<Object?> get props => [isDarkMode];
}
