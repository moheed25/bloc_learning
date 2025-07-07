
import 'package:bloc_learning/bloc/bottom_nav_bar/nav_bar_bloc.dart';
import 'package:bloc_learning/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_learning/bloc/favorite/favorite_bloc.dart';
import 'package:bloc_learning/bloc/favorite/favorite_events.dart';
import 'package:bloc_learning/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_learning/bloc/snack_bar/snack_bar_bloc.dart';
import 'package:bloc_learning/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_learning/bloc/theme_bloc/theme_bloc.dart';
import 'package:bloc_learning/bloc/todo/todo_bloc.dart';
import 'package:bloc_learning/repository/favorite_repository.dart';
import 'package:bloc_learning/utils/image_picker_utils.dart';
import 'package:bloc_learning/view/counter/counter_screen.dart';

import 'package:bloc_learning/view/snack_bar/snack_bar_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

// Hello Everyone
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_)=> NavBloc()),
          BlocProvider(create: (_)=> SnackbarBloc()),
         // BlocProvider(create: (_)=> searcb)
          // BlocProvider(create: (_) => MyFormBloc()),
          BlocProvider(create: (_) => SwitchBloc()),
          BlocProvider(create: (_) => ToDoBloc()),
          BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
          BlocProvider(create: (_) => ToggleBloc()),
          BlocProvider(
              create: (_) => FavouriteBloc(FavouriteRepository())
                ..add(FetchFavouriteList())),
        ],
        child: SnackbarListener(
          child: MaterialApp(
              title: 'Flutter Demo',
              //
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.blue,
              ),
              home:
                 
              
                // PaginationWidget()
                 //     StepperBlocWidget()
              //BottomNavBarWidget()
              //SearchWidget()
                  // LoginScreen()
          //PaymentRadioWidget()
          //                ToggleSwitchWidget()
              //PostScreen()
              // ImagePickerScreen()
              // ToDoScreen ()
              //  SwitchWidget()
           CounterScreen(),
              // EqualityTest()
              //FavouriteScreen()
          
              //
              ),
        ));
  }
}
