// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todolist/pages/constants.dart';
import 'package:todolist/pages/loginpage/login.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(52);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xff769FCE),
      title: Text(
        'welcome, ice ${usernameController1.text}',
        style: GoogleFonts.ubuntu(
            textStyle: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        )),
      ),
      actions: const [
        CircleAvatar(
          foregroundImage: AssetImage('content/profile_pic.png'),
        )
      ],
    );
  }
}
