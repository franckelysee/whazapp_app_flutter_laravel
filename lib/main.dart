import 'package:flutter/material.dart';
import 'package:tuto_doctor_appointement/main_layout.dart';
import 'package:tuto_doctor_appointement/screens/auth_page.dart';
import 'package:tuto_doctor_appointement/screens/booking_page.dart';
import 'package:tuto_doctor_appointement/screens/doctor_details.dart';
import 'package:tuto_doctor_appointement/screens/success_booked.dart';
import 'package:tuto_doctor_appointement/utils/config.dart';

void main() {
  runApp(const MyApp());
}
const Color primaryColor = Color(0xFF075E54);
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //this is for push navigator
  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //define themedata here
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Doctor App',
      theme: ThemeData(
        //pre-define iput decoration
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed
        )
      ),
      initialRoute: '/',
      routes: {
        //this is initial route of the app
        // which is page (login and signup)

        '/':(context) => const AutPage(),
        "main":(context) => const MainLayout(),
        'doctor_details':(context) => const DoctorDetails(),
        'booking_page':(context) => const BookingPage(),
        'success_booking':(context)=> const AppointmentBooked(),
      },
    );
  }
}
