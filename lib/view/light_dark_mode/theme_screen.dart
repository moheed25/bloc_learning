

// toggle_widget.dart

import 'package:bloc_learning/bloc/theme_bloc/theme_events.dart';
import 'package:bloc_learning/bloc/theme_bloc/theme_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/theme_bloc/theme_bloc.dart';


class ToggleSwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ToggleBloc(),
      child: BlocBuilder<ToggleBloc, ToggleState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: state.isDarkMode ? Colors.black : Colors.white,
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
 Text('Dark Mode',style: TextStyle(
                    color:  state.isDarkMode ? Colors.white : Colors.black,
                  ),),
                SizedBox(width: 50,),
                  Switch(
activeColor:  state.isDarkMode ? Colors.white : Colors.black,
                    value: state.isDarkMode,
                    onChanged: (value) {
                      context.read<ToggleBloc>().add(ToggleSwitched(value));
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
