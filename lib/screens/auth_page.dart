import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuto_doctor_appointement/components/login_form.dart';
import 'package:tuto_doctor_appointement/components/social_button.dart';
import 'package:tuto_doctor_appointement/utils/config.dart';
import 'package:tuto_doctor_appointement/utils/text.dart';

class AutPage extends StatefulWidget {
  const AutPage({super.key});

  @override
  State<AutPage> createState() => _AutPageState();
}

class _AutPageState extends State<AutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Text(
                AppText.endText["welcome_text"]!,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold
                ),
              ),
              Config.spaceSmall,
              Center(
                child: Text(
                  AppText.endText["signIn_text"]!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Config.spaceSmall,
              LoginForm(),
              Config.spaceSmall,
              Center(
                child: TextButton(
                  onPressed: (){},
                  child: Text(
                    AppText.endText["forgot_password"]!,
                    style: const TextStyle(
                      color: Config.primaryColor
                    ),
                  ),
                ),
              ),
              // add social button sign in
              const Spacer(),
              Center(
                child: Text(
                  AppText.endText["social-login"]!,
                  style:  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SocialButton(social: "google"),
                  SocialButton(social: "facebook"),
                ],
              ),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppText.endText["signUp_text"]!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade500
                    ),
                  ),
                  const Text(
                    'sign up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          )
        ),
      )
    );
  }
}