// bottom_nav_widget.dart
import 'package:bloc_learning/bloc/bottom_nav_bar/nav_bar_bloc.dart';
import 'package:bloc_learning/bloc/bottom_nav_bar/nav_bar_event.dart';
import 'package:bloc_learning/bloc/bottom_nav_bar/nav_bar_state.dart';
import 'package:bloc_learning/view/nav_bar_widget/screens/home_screen.dart';
import 'package:bloc_learning/view/nav_bar_widget/screens/profile_screen.dart';
import 'package:bloc_learning/view/nav_bar_widget/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BottomNavBarWidget extends StatelessWidget {
  BottomNavBarWidget({super.key});

  final List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavBloc(),
      child: BlocBuilder<NavBloc, NavState>(
        builder: (context, state) {
          return Scaffold(
            body: screens[state.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.selectedIndex,
              onTap: (index) {
                context.read<NavBloc>().add(NavItemSelected(index));
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
