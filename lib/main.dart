import 'package:flutter/material.dart';
import './ReadQuran.dart';
import './PrayerTimes.dart';

void main() {
  runApp(const RootPage());
}

class SLPrayerTimes extends StatelessWidget {
  const SLPrayerTimes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
theme: ThemeData(
primarySwatch:Colors.green,
),
      home: RootPage(),
    );
  }
}


class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = [
    PrayerTimes(),
    ReadQuran(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Sri Lankan Prayer times'),
        ),

        body: pages[currentPage],


        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.watch_later_outlined), label: 'தொழுகை நேரங்கள்'),
            NavigationDestination(icon: Icon(Icons.menu_book), label: 'திருக்குர்ஆன்'),

          ],
          onDestinationSelected: (int index){
            setState(() {
              currentPage = index;
            },);

          },
          selectedIndex: currentPage,
        ),

      ),
    );
  }
}
