import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuto_doctor_appointement/components/button.dart';
import 'package:tuto_doctor_appointement/components/custom_appbar.dart';
import 'package:tuto_doctor_appointement/utils/config.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {

  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Doctor Details",
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                isFav = !isFav;

              });
            },
            icon: FaIcon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              AboutDoctor(),
              DetailBody(),
              // const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Button(
                  width: double.infinity, 
                  title: 'Book Appointment', 
                  disable: false, 
                  onPressed: (){
                    Navigator.of(context).pushNamed("booking_page");
                  }
                ),
              )
        
              //les details du docteur
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("booking_page");
          
        },
        tooltip: "Book Appointment",
        child: const Icon(Icons.calendar_month),
      ),
    );
  }
}


class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(
        children:  <Widget>[
          CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage("assets/avatar/doctor.jpeg"),
            backgroundColor: Colors.white,
          ),
          Config.spaceSmall,
          const Text("Dr Richard", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.4,color: Colors.black),),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'MBBS (University of Dhaka), FCPS (University of Dhaka), MD (University of Dhaka)',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'Boston General Hospital, Dhaka',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,

        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
          DoctorInfo(),
          Config.spaceLarge,
          const Text("About Doctor",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
          Config.spaceSmall,
          Text("Dr. Richard is an experience Dentist at Dhaka. He has been working in the field of Dentistry for 10 years. He has been working in the field of Dentistry for 10 years. He has been working in the field of Dentistry for 10 years. ",)
          
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:const <Widget>[
        InfoCard(label: "Patients", value: "100"),
        SizedBox(width: 10,),
        InfoCard(label: "Experience", value: "10 years"),
        SizedBox(width: 10,),
        InfoCard(label: "Rating", value: "3.9"),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key , required this.label, required this.value});


  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Config.primaryColor
            ),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            child: Column(
              children:  <Widget>[
                Text(label, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 12),),
                SizedBox(height: 10,),
                Text(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),

              ],
            ),
          ),
        );
  }
}