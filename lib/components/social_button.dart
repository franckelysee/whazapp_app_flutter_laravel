import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tuto_doctor_appointement/utils/config.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.social});

  final String social;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        side: const BorderSide(color: Colors.black, width: 1),
      ),
      onPressed: (){}, 
      child: SizedBox(
      width: Config.screenWidth! * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset("assets/social_images/$social.png", width: 40, height: 40,),
          Text(social.toUpperCase(),style: const TextStyle(color: Colors.black),)
        ],
      ),
    ));
  }
}