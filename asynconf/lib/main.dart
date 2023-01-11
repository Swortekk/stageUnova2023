import 'package:asynconf/pages/eventPage.dart';
import 'package:asynconf/pages/homePage.dart';
import 'package:asynconf/pages/addEventPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _idPage = 0;

  setCurrentPage(int numPage) {
    setState(() {
      _idPage = numPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const [
            Text("Accueil"),
            Text("Liste des conférences"),
            Text("Formulaire")
          ][_idPage],
        ),
        body: const [HomePage(), EventPage(), AddEventPage()][_idPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _idPage,
          onTap: (numPage) => setCurrentPage(numPage),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          iconSize: 30,
          elevation: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Accueil",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "Planning",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Ajout",
            ),
          ],
        ),
      ),
    );
  }
}
