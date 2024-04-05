import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuto_doctor_appointement/utils/config.dart';

class APpointementCard extends StatefulWidget {
  const APpointementCard({super.key});

  @override
  State<APpointementCard> createState() => _APpointementCardState();
}

class _APpointementCardState extends State<APpointementCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children:<Widget> [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/avatar/doctor.jpeg"),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Dr Richard",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                      const SizedBox(height: 3,),
                      Text("Cardiologist",style: TextStyle(color: Colors.brown),),
                    ],
                  ),
                ],
              ),

              Config.spaceSmall,

              const ScheduleCard(),

              Config.spaceSmall,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red
                      ),
                      onPressed: (){},
                      child: Text("Cancel", style: TextStyle(color: Colors.white),)
                    )
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                      ),
                      onPressed: (){},
                      child: Text("Completed", style: TextStyle(color: Colors.white),)
                    )
                  )
                ],
              ),
              //Dortor informations
            ],
          ),
        ),
      ),
    );
  }
}


class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.calendar_today, color: Colors.grey, size: 15,),
          SizedBox(width: 5,),
          Text("Monday, 12/03/2024", style: TextStyle(color: Colors.grey),),
          SizedBox(width: 20,),
          Icon(Icons.alarm, color: Colors.grey, size: 15,),
          SizedBox(width: 5,),
          Flexible(child: Text("10:00 AM", style: TextStyle(color: Colors.grey, fontSize: 10),)),
        ],
      ),
    );
  }
}