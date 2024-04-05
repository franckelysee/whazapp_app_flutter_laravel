import 'package:flutter/material.dart';
import 'package:tuto_doctor_appointement/components/button.dart';
import 'package:tuto_doctor_appointement/utils/config.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obscureText = true;

  void _toggleObscureText(){
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Config.primaryColor,
              decoration: const InputDecoration(
                hintText: "Email Address",
                labelText: "Email",
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.email_outlined),
                prefixIconColor: Config.primaryColor,
              ),
            ),
            Config.spaceSmall,
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              cursorColor: Config.primaryColor,
              obscureText:  obscureText,
              decoration:  InputDecoration(
                hintText: "Password",
                labelText: "Password",
                alignLabelWithHint: true,
                prefixIcon:  Icon(Icons.lock_outline),
                prefixIconColor: Config.primaryColor,
                suffixIcon: IconButton(
                  onPressed: ()=>_toggleObscureText(),
                  icon: obscureText 
                    ? const Icon(Icons.visibility_off_outlined, color: Colors.black38,) 
                    : const Icon(Icons.visibility_outlined , color: Config.primaryColor)),
              ),
            ),
            Config.spaceSmall,
            Button(
              width: double.infinity, 
              title: "Sign In", 
              disable: false, 
              onPressed: (){
                Navigator.of(context).pushNamed("main");
              }
            ),
          ],
        ),
      ),
    );
  }
}