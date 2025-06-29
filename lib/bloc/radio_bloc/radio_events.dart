// payment_event.dart
import 'package:equatable/equatable.dart';

abstract class PaymentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaymentMethodSelected extends PaymentEvent {
  final String selectedMethod;

  PaymentMethodSelected(this.selectedMethod);

  @override
  List<Object?> get props => [selectedMethod];
}
