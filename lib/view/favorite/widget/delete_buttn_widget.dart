
import 'package:bloc_learning/bloc/favorite/favorite_bloc.dart';
import 'package:bloc_learning/bloc/favorite/favorite_events.dart';
import 'package:bloc_learning/bloc/favorite/favorite_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DeleteButtonWidget extends StatelessWidget {
  const DeleteButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      buildWhen: (previous, current) =>  previous.tempFavouriteList != current.tempFavouriteList,
      builder: (context, state) {
        return Visibility(
            visible: state.tempFavouriteList.isNotEmpty ?  true : false ,
            child: IconButton(onPressed: () {
              context.read<FavouriteBloc>().add(DeleteItem());
            },
                icon: const Icon(Icons.delete_outline , color: Colors.red,))
        );
      },
    );
  }
}