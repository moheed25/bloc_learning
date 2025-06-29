
import 'package:bloc_learning/bloc/post_bloc/post_bloc.dart';
import 'package:bloc_learning/bloc/post_bloc/post_event.dart';
import 'package:bloc_learning/bloc/post_bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math show Random;

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

const names = ['Foo', 'Bar', 'Baz'];

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);

  void pickRandomNumber() {
    emit(names.getRandomElement());
  }
}

class _PostScreenState extends State<PostScreen> {
  late final NamesCubit namesCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namesCubit = NamesCubit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    namesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: Text('Post List using bloc'),
      ),
      body: BlocProvider(
        create: (_) => PostBloc()..add(PostFetched()),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            switch (state.status) {
              case PostStatus.failure:
                return GestureDetector(
                    onTap: () {
                      context.read<PostBloc>().add(PostFetched());
                    },
                    child: Center(child: Text(state.message.toString())));
              case PostStatus.success:
                if (state.posts.isEmpty) {
                  return const Center(child: Text('no posts'));
                }
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                        
                            hintText: 'Search ',
                            focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(width: 2, color: Colors.white),
      ),
                         enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(width: 2, color: Colors.white), //<-- SEE HERE
      
    ),),
                        onChanged: (value) {
                          context.read<PostBloc>().add(SearchItem(value));
                        },
                      ),
                    ),
                    Expanded(
                      child: state.searchMessage.isNotEmpty
                          ? Center(child: Text(state.searchMessage.toString()))
                          : ListView.builder(
                              itemCount: state.searchPostList.isEmpty
                                  ? state.posts.length
                                  : state.searchPostList.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (state.searchPostList.isNotEmpty) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: ListTile(
                                        title: Text(state
                                            .searchPostList[index].name
                                            .toString()),
                                        subtitle: Text(state
                                            .searchPostList[index].name
                                            .toString()),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: ListTile(
                                        title: Text(
                                            state.posts[index].name.toString()),
                                        subtitle: Text(
                                            state.posts[index].email.toString()),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                    ),
                  ],
                );
              case PostStatus.initial:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               StreamBuilder<String?>(
//                 stream: namesCubit.stream,
//                 builder: (context, snapshot) {
//                   final button = TextButton(
//                       onPressed: () {
//                         namesCubit.pickRandomNumber();
//                       },
//                       child: Text('Pick a random name'));

//                   switch (snapshot.connectionState) {
//                     case ConnectionState.waiting:
//                       return button;
//                     case ConnectionState.active:
//                       return Column(
//                         children: [Text(snapshot.data ?? ''), button],
//                       );
//                     case ConnectionState.done:
//                       return SizedBox();
//                     default:
//                       return SizedBox();
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }