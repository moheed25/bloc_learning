// payment_bloc.dart
import 'package:bloc_learning/bloc/radio_bloc/radio_events.dart';
import 'package:bloc_learning/bloc/radio_bloc/radio_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState(selectedMethod: 'Credit Card')) {
    on<PaymentMethodSelected>((event, emit) {
      emit(state.copyWith(selectedMethod: event.selectedMethod));
    });
  }
}
