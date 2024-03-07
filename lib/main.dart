import 'package:flutter/material.dart';
import 'package:tuto_doctor_appointement/next_element.dart';

void main() {
  runApp(const MyApp());
}
const Color primaryColor = Color(0xFF075E54);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'WhatsApp'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: widget.title),
      body: Center(
        child: ElevatedButton(
          child: const Text("GO TO NEXT"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NextElement()),
            );
          },
        ),
      ),
    );
  }
}



class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new  Size.fromHeight(50.0);
  const MyAppBar({super.key, required this.title});

  final String title; 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}