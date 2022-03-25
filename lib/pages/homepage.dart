import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Tasks',
                      style: GoogleFonts.ubuntu(
                          color: Color(0xff769FCE),
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_circle),
                    color: Colors.blue,
                    tooltip: 'New task',
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    DateFormat('MMMM,dd').format(DateTime.now()),
                    style: GoogleFonts.ubuntu(
                      fontSize: 11,
                      color: Color(0xff95a5a6),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
