import 'package:flutter/material.dart';
import 'package:tuto_doctor_appointement/components/appointment_card.dart';
import 'package:tuto_doctor_appointement/utils/config.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus {upcomming, Completed, Cancel}

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcomming;//initial status
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      "doctor_name":"Francklin",
      "category":"General",
      "doctor_profile":"assets/avatar/doctor.jpeg",
      "doctor_rating":4.5,
      "status":FilterStatus.upcomming,
    },

    {
      "doctor_name":"Richard",
      "category":"Cardiologist",
      "doctor_profile":"assets/avatar/doctor.jpeg",
      "doctor_rating":3.5,
      "status":FilterStatus.Completed,
    },

    {
      "doctor_name":"Tony Johnson",
      "category":"Dental",
      "doctor_profile":"assets/avatar/doctor.jpeg",
      "doctor_rating":4,
      "status":FilterStatus.Cancel,
    },
    {
      "doctor_name":"Amanda wang",
      "category":"Nurse",
      "doctor_profile":"assets/avatar/doctor.jpeg",
      "doctor_rating":3.7,
      "status":FilterStatus.Cancel,
    },
  ];
  @override
  Widget build(BuildContext context) {
    // List<dynamic> filteredSchedules = schedules.where((element) => element["status"] == status.name).toList();
    List<dynamic> filteredSchedules = schedules.where((var schedule){
      return schedule["status"] == status;
    }).toList();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Appointment Schedule",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Config.spaceSmall,

            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for(FilterStatus filterStatus in FilterStatus.values) ...[
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                if(filterStatus == FilterStatus.upcomming){
                                  status = FilterStatus.upcomming;
                                  _alignment = Alignment.centerLeft;
                                }
                                else if( filterStatus == FilterStatus.Completed){
                                  status = FilterStatus.Completed;
                                  _alignment = Alignment.center;
                                }else if ( filterStatus == FilterStatus.Cancel){
                                  status = FilterStatus.Cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(child: Text(filterStatus.name)),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text(status.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),

                  ),
                )
              ],
            ),

            Config.spaceMedium,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: (context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length -1 == index;
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: !isLastElement ? const EdgeInsets.only(bottom: 10) : EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(_schedule["doctor_profile"]),
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_schedule["doctor_name"], style: const TextStyle(fontWeight: FontWeight.bold),),
                                  Text(_schedule["category"]),
                                ],
                              ),
                              const Spacer(),
                              Text("${_schedule["doctor_rating"]}"),
                              const Icon(Icons.star, color: Colors.yellow, size: 16,),
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
                                    backgroundColor: Config.primaryColor
                                  ),
                                  onPressed: (){},
                                  child: Text("Reschedule", style: TextStyle(color: Colors.white),)
                                ),
                              ),
                            ],
                          ),
                        ],

                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}