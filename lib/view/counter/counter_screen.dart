


import 'package:bloc_learning/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_learning/bloc/counter_bloc/counter_states.dart';
import 'package:bloc_learning/bloc/snack_bar/snack_bar_bloc.dart';
import 'package:bloc_learning/bloc/snack_bar/snack_bar_event.dart';
import 'package:bloc_learning/bloc/snack_bar/snack_bar_state.dart';
import 'package:bloc_learning/view/image_picker/image_picker_screen.dart';
import 'package:bloc_learning/view/snack_bar/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../bloc/counter_bloc/counter_events.dart' show IncrementCounter, DecrementCounter;



class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  @override
  Widget build(BuildContext context) {
    return SnackbarListener(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter Example using Bloc'),
        ),
        body: SafeArea(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc , CounterState>(
                  buildWhen: (previous, current) => previous.counter != current.counter,
                  builder: (context, state){
                    return Center(child: Text(state.counter.toString() ,
                      style: const TextStyle(color: Colors.black , fontSize: 60),));
                  }
              ),
              // BlocBuilder<CounterBloc , CounterState>(
              //     buildWhen: (previous, current) => previous.isSwitchOn != current.isSwitchOn,
              //     builder: (context, state){
              //       return Center(child: Text(state.isSwitchOn.toString() ,
              //         style: const TextStyle(color: Colors.black , fontSize: 60),));
              //     }
              // ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    context.read<CounterBloc>().add(IncrementCounter());
                  }, child: const Text('Add')),
                  const SizedBox(width: 20,),
                  ElevatedButton(onPressed: (){
                //    context.read<CounterBloc>().add( SwitchEvent());
                    context.read<CounterBloc>().add( DecrementCounter());
                  }, child: const Text('Removed')),
                ],
              ),
      
              SizedBox(height: 100,),
               ElevatedButton(onPressed: (){
                  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ImagePickerScreen()),
        );
               }, child: Text("Next")),
              SizedBox(height: 100,),
               BlocBuilder<SnackbarBloc , SnackbarState>(
                  ///buildWhen: (previous, current) => previous.counter != current.counter,
                  builder:  (context, state){
                    return
               ElevatedButton(onPressed: (){
                context.read<SnackbarBloc>().add(
        ShowSnackbar(message: "Profile updated successfully!"),
      );
      context.read<SnackbarBloc>().add(
  ShowSnackbar(message: 'This is a global Snackbar!', isError: false),
);

      
               }, child: Text("Show SnackBar"));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}