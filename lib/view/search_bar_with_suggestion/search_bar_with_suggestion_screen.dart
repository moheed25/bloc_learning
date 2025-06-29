// search_widget.dart
import 'package:bloc_learning/bloc/search_bar_with_suggestion/search_bar_with_suggestion_bloc.dart';
import 'package:bloc_learning/bloc/search_bar_with_suggestion/search_bar_with_suggestion_events.dart';
import 'package:bloc_learning/bloc/search_bar_with_suggestion/search_bar_with_suggestion_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchWidget extends StatelessWidget {
  final List<String> items = [
    'Apple',
    'Banana',
    'Orange',
    'Grapes',
    'Watermelon',
    'Mango',
    'Pineapple'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBloc(items),
      child: Scaffold(
        body: Column(
          children: [
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (query) {
                      context.read<SearchBloc>().add(SearchTextChanged(query));
                    },
                  ),
                );
              },
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.results.isEmpty) {
                  return const Text('No results');
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.results.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.results[index]),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
