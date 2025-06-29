// payment_state.dart
import 'package:equatable/equatable.dart';

class PaymentState extends Equatable {
  final String selectedMethod;

  const PaymentState({required this.selectedMethod});

  PaymentState copyWith({String? selectedMethod}) {
    return PaymentState(
      selectedMethod: selectedMethod ?? this.selectedMethod,
    );
  }

  @override
  List<Object?> get props => [selectedMethod];
}
