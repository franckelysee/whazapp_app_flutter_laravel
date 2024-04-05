import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuto_doctor_appointement/components/appointment_card.dart';
import 'package:tuto_doctor_appointement/components/doctor_card.dart';
import 'package:tuto_doctor_appointement/utils/config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> categories = [
    {
      "icon":FontAwesomeIcons.userDoctor,
      "category": "General",
    },
    {
      "icon":FontAwesomeIcons.teeth,
      "category": "Dentist",
    },
    {
      "icon":FontAwesomeIcons.userNurse,
      "category": "Nurse",
    },
    {
      "icon":FontAwesomeIcons.heartPulse,
      "category": "Cardiologist",
    },
    {
      "icon":FontAwesomeIcons.hand,
      "category": "Dermatologist",
    },
    {
      "icon":FontAwesomeIcons.stethoscope,
      "category": "Orthopedic",
    },
  ];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Francklin",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/avatar/francklin.png"),
                      ),
                    ),
                  ]
                ),
            
                Config.spaceMedium,
            
                const Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
            
                Config.spaceSmall,
                SizedBox(
                  height: Config.heightSize! * 0.05,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(categories.length, (index){
                      return Card(
                        margin: const EdgeInsets.only(right: 20),
                        color: Config.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              FaIcon(
                                categories[index]["icon"],
                                color: Colors.white,
                              ),
                              SizedBox(width: 20,),
                              Text(
                                categories[index]["category"],
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ],
                          )
                        ),
                      );
                    }),
                  ),
                ),
            
                Config.spaceMedium,
            
                const Text(
                  "Appointment Today",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
            
                Config.spaceSmall,
                APpointementCard(),
            
                Config.spaceMedium,
                const Text(
                  'Top Doctors',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
            
                Config.spaceSmall,
                Column(
                  children: List<Widget>.generate(10, (index){
                    return DoctorCard();
                  })
                ),
                
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}