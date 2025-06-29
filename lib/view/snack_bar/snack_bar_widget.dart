// snackbar_listener.dart
import 'package:bloc_learning/bloc/snack_bar/snack_bar_bloc.dart';
import 'package:bloc_learning/bloc/snack_bar/snack_bar_event.dart';
import 'package:bloc_learning/bloc/snack_bar/snack_bar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SnackbarListener extends StatelessWidget {
  final Widget child;

  const SnackbarListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SnackbarBloc, SnackbarState>(
      listener: (context, state) {
        if (state.message != null && state.message!.isNotEmpty) {
          final snackBar = SnackBar(
            content: Text(state.message!),
            backgroundColor: state.isError ? Colors.red : Colors.green,
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);

          // Clear after showing
          context.read<SnackbarBloc>().add(ClearSnackbar());
        }
      },
      child: child,
    );
  }
}
