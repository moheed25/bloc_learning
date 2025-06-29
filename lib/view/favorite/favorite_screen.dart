
import 'package:bloc_learning/bloc/favorite/favorite_bloc.dart';
import 'package:bloc_learning/bloc/favorite/favorite_events.dart';
import 'package:bloc_learning/bloc/favorite/favorite_states.dart';
import 'package:bloc_learning/model/favorite_model/favorite_item_model.dart';
import 'package:bloc_learning/view/favorite/widget/delete_buttn_widget.dart';
import 'package:bloc_learning/view/todo/todo_screen/to_do_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App Example using Bloc'),
        actions: const [DeleteButtonWidget()],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: BlocBuilder<FavouriteBloc, FavouriteState>(
              builder: (BuildContext context, state) {
                switch (state.listStatus) {
                  case ListStatus.loading:
                    return const Center(child: CircularProgressIndicator());
                  case ListStatus.failure:
                    return const Center(child: Text('error'));
                  case ListStatus.success:
                    return ListView.builder(
                      shrinkWrap: true,
                        itemCount: state.favouriteList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Checkbox(
                                value: state.tempFavouriteList
                                        .contains(state.favouriteList[index])
                                    ? true
                                    : false,
                                onChanged: (bool? value) {
                                  FavouriteItemModel item =
                                      state.favouriteList[index];
                                  if (value!) {
                                    context
                                        .read<FavouriteBloc>()
                                        .add(SelectItem(item: item));
                                  } else {
                                    context
                                        .read<FavouriteBloc>()
                                        .add(UnSelectItem(item: item));
                                  }
                                },
                              ),
                              title: Text(
                                state.favouriteList[index].value,
                                style: TextStyle(
                                    decoration: state.tempFavouriteList
                                            .contains(state.favouriteList[index])
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    color: state.tempFavouriteList
                                            .contains(state.favouriteList[index])
                                        ? Colors.red
                                        : Colors.white),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  FavouriteItemModel item =
                                      state.favouriteList[index];
          
                                  context.read<FavouriteBloc>().add(FavouriteItem(
                                      item: FavouriteItemModel(
                                          id: item.id,
                                          isFavourite:
                                              item.isFavourite ? false : true,
                                          value: item.value)));
                                },
                                icon: Icon(state.favouriteList[index].isFavourite
                                    ? Icons.favorite
                                    : Icons.favorite_outline),
                                color: state.favouriteList[index].isFavourite
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                          );
                        });
                }
              },
            ),
          ),
    
     SizedBox(height:10,),
             ElevatedButton(onPressed: (){
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ToDoScreen()),
  );
             }, child: Text("Next"))
        ],
      ),
    );
  }
}
