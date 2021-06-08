import 'package:flutter/material.dart';

import 'cadastro_screen.dart';
import 'interesse_widget.dart';
import 'todos_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<AdminHomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CadastroScreen(),
    TodosWidget(),
    InteresseWidget()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.add_box), label: 'Cadastrar'),
          new BottomNavigationBarItem(
              icon: Icon(Icons.view_headline_sharp), label: 'Todos'),
          new BottomNavigationBarItem(
              icon: Icon(Icons.clean_hands_rounded), label: 'Interesse em Doar')
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
