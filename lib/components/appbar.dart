import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget{
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _AppBarState();
}

class _AppBarState extends State<MyAppBar>{


  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        elevation : 0,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined), 
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite), 
            label: 'Favorite',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_2_outlined), 
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}