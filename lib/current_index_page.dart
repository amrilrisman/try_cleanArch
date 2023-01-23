import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:stats/stats.dart';

class CurrentIndexPage extends StatelessWidget {
  CurrentIndexPage({Key? key}) : super(key: key);
  final ValueNotifier<int> _indexPage = ValueNotifier<int>(0);
  final List<Widget> pages = const <Widget>[
    HomePage(),
    StastPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Todo'),
      ),
      body: ValueListenableBuilder<int>(
          valueListenable: _indexPage,
          builder: (context, index, _) => pages.elementAt(index)),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _indexPage,
        builder: (context, indexPage, _) {
          return BottomNavigationBar(
            onTap: (int index) {
              _indexPage.value = index;
            },
            currentIndex: indexPage,
            selectedItemColor: primaryColors,
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.note,
                ),
                label: 'TODOS',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bar_chart_sharp,
                ),
                label: 'Stats',
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNamed.addTodo);
        },
        backgroundColor: primaryColors,
        child: const Icon(
          Icons.post_add_sharp,
          color: Colors.white,
        ),
      ),
    );
  }
}
