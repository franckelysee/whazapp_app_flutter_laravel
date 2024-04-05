import 'package:flutter/material.dart';
import 'package:tuto_doctor_appointement/utils/config.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.route});

  final String route;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                
                width: Config.widthSize! * 0.3,
                height: 100,
                child: Image.asset("assets/avatar/doctor.jpeg", fit: BoxFit.fill,),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Dr Richard Tan",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
                      const SizedBox(height: 3,),
                      Text("Cardiologist",style: TextStyle(color: Colors.brown),),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.star_border, color: Colors.yellow, size: 16,),
                          Spacer(flex: 1,),
                          Text("4.5", style: TextStyle(color: Colors.black),),
                          Spacer(flex: 2,),
                          Text("(120 Reviews)", style: TextStyle(color: Colors.black),),
                          Spacer(flex: 7,)
                        ],
                      )
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
        onTap: () {
          //redirige vers la page doctor details
          Navigator.of(context).pushNamed(route);
        },
      ),
    );
  }
}