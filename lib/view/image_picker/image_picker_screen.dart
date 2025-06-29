

import 'dart:io';


import 'package:bloc_learning/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_learning/bloc/image_picker/image_picker_events.dart';
import 'package:bloc_learning/bloc/image_picker/image_picker_states.dart';
import 'package:bloc_learning/view/favorite/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text('Image Picker Example using Bloc '),
      ),
      body: Column(
        children: [
          SizedBox(height: 200,),
          Center(
            child: BlocBuilder<ImagePickerBloc , ImagePickerState>(
                builder: (context, state){
                  return state.file == null ? InkWell(
                    onTap: (){
                      context.read<ImagePickerBloc>().add(CameraCapture());
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.camera),
          
                    ),
                  ) : Image.file(File(state.file!.path.toString()),height: 200,width: 200,);
                }
            ),
          ),
             SizedBox(height: 200,),
             ElevatedButton(onPressed: (){
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FavouriteScreen()),
  );
             }, child: Text("Next"))
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          
        },
      ),
    );
  }
}