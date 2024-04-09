import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuto_doctor_appointement/utils/config.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title, this.route, this.icon, this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(50.0);//valeur par defaut du appbar

  final String? title;
  final String? route;
  final FaIcon? icon;
  final List<Widget>? actions;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(widget.title!, style: const TextStyle(fontSize:20,color: Colors.black),),
      leading: widget.icon != null ? Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Config.primaryColor
        ),
        child: IconButton(
          onPressed: () {
            // si la route est fournie alors, ce boutons redirige vers cette route
            if(widget.route != null){
              Navigator.pushNamed(context, widget.route!);
            }else{
              Navigator.pop(context);
            }
          },
          icon: widget.icon!,
          iconSize: 16,
          color: Colors.white,
        ),
      ): null,
      actions: widget.actions?? null,
    );
  }
}