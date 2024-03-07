import 'package:flutter/material.dart';


class NextElement extends StatefulWidget {
  const NextElement({super.key});

  @override
  State<NextElement> createState() => _NextElementState();
}

class _NextElementState extends State<NextElement> {
  int currentPage = 0;
  final PageController _page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        child: PageView(
          controller: _page,
          onPageChanged: ((value) {
            setState(() {
              currentPage = value;
            });
          }),
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.black,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          _page.jumpToPage(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Color(0xFF075E54),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
            backgroundColor: Color(0xFF075E54),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            backgroundColor: Color(0xFF075E54),
            label: "Person",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            backgroundColor: Color(0xFF075E54),
            label: "Menu",
          ),
        ],
      )
    );
  }
}