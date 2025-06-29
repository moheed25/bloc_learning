// payment_widget.dart
import 'package:bloc_learning/bloc/radio_bloc/radio_bloc.dart';
import 'package:bloc_learning/bloc/radio_bloc/radio_events.dart';
import 'package:bloc_learning/bloc/radio_bloc/radio_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PaymentRadioWidget extends StatelessWidget {
  final List<String> paymentMethods = [
    'Credit Card',
    'PayPal',
    'Cash on Delivery'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentBloc(),
      child: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: paymentMethods.map((method) {
                return RadioListTile<String>(
                  title: Text(method),
                  value: method,
                  groupValue: state.selectedMethod,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      context
                          .read<PaymentBloc>()
                          .add(PaymentMethodSelected(newValue));
                    }
                  },
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
