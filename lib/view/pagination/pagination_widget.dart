// pagination_widget.dart
import 'package:bloc_learning/bloc/pagination/pagiantion_bloc.dart';
import 'package:bloc_learning/bloc/pagination/pagiantion_state.dart';
import 'package:bloc_learning/bloc/pagination/pagination_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PaginationWidget extends StatelessWidget {
  const PaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaginationBloc()..add(FetchMoreItems()),
      child: BlocBuilder<PaginationBloc, PaginationState>(
        builder: (context, state) {
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification.metrics.pixels ==
                      scrollNotification.metrics.maxScrollExtent &&
                  !state.isLoading &&
                  !state.hasReachedEnd) {
                context.read<PaginationBloc>().add(FetchMoreItems());
              }
              return false;
            },
            child: Scaffold(
              body: ListView.builder(
                itemCount: state.hasReachedEnd
                    ? state.items.length
                    : state.items.length + 1,
                itemBuilder: (context, index) {
                  if (index >= state.items.length) {
                    return const Center(
                        child: Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    ));
                  }
                  return ListTile(
                    title: Text(state.items[index]),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
