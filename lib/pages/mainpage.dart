import 'package:flutter/material.dart';
import 'package:flutter_colombia/pages/add_lugar.dart';
import 'package:flutter_colombia/pages/list_lugares.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [
      const ListLugares(),
      const AddLugar(),
      const AddLugar(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lugares turisticos de Colombia",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 1, 169, 184),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        elevation: 10,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey[500],
              ),
              activeIcon: const Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
              backgroundColor: Colors.grey[100]),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
                color: Colors.grey[500],
              ),
              activeIcon: const Icon(Icons.map_outlined),
              label: 'Maps',
              backgroundColor: Colors.grey[100]),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                color: Colors.grey[500],
              ),
              activeIcon: const Icon(Icons.add_outlined),
              label: 'Add Place',
              backgroundColor: Colors.grey[100])
        ],
        selectedItemColor: Colors.indigo[800],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 16, 1, 81),
        hoverColor: const Color.fromARGB(255, 3, 234, 246),
        splashColor: Colors.green,
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
