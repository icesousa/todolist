import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/pages/homepage/homepage.dart';
import 'package:todolist/pages/todolist_page/todolist_page.dart';
import 'package:todolist/widgets/customTextForm.dart';
import 'package:string_validator/string_validator.dart' as validator;
import '../loginpage/login.dart';
import 'package:ms_undraw/ms_undraw.dart';

final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

void main() {}

class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey2,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UnDraw(
                    height: 300,
                    width: 200,
                    illustration: UnDrawIllustration.sign_in,
                    color: Color(0xff769FCE),
                    placeholder: Text("Illustration is loading..."),
                  ),
                  Text(
                    'Sign in to Taskdo.io',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff769FCE)),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomTextForm(
                    icon: Icons.person,
                    obscureText: false,
                    controller: usernameController1,
                    labeltext: 'Username',
                    hinttext: 'Insert your username',
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field cant be empty';
                      } else if (!validator.isLength(text, 0, 20)) {
                        return 'Username is too long';
                      }
                      return null;
                    },
                  ),
                  CustomTextForm(
                    icon: Icons.lock,
                    controller: passwordController1,
                    labeltext: 'Password',
                    hinttext: 'insert ur password',
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    obscureText: true,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field can\'t be empty';
                      } else if (!validator.isLength(text, 0, 20)) {
                        return 'Password is too long';
                      }
                      return null;
                    },
                  ),
                  CustomTextForm(
                    icon: Icons.lock,
                    controller: passwordController2,
                    labeltext: 'Confirm Password',
                    hinttext: 'Put ur password',
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    obscureText: true,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field can\'t be empty';
                      } else if (passwordController1.text !=
                          passwordController2.text) {
                        return 'Password must be the same';
                      } else if (!validator.isLength(text, 0, 20)) {
                        return 'Password is too long';
                      }
                      return null;
                    },
                  ),
                  CustomTextForm(
                    icon: Icons.mail,
                    obscureText: false,
                    controller: emailController1,
                    labeltext: 'E-mail',
                    hinttext: 'Insert your e-mail',
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field cant be empty';
                      } else if (!validator.isEmail(text)) {
                        return 'Isn\'t a e-mail';
                      }
                      return null;
                    },
                  ),
                  CustomTextForm(
                    icon: Icons.mail,
                    obscureText: false,
                    controller: emailController2,
                    labeltext: 'Confirm E-mail',
                    hinttext: 'Insert the same e-mail',
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field cant be empty';
                      } else if (!validator.isEmail(text)) {
                        return 'Isn\'t a e-mail';
                      } else if (emailController1.text !=
                          emailController2.text) {
                        return 'e-mail don\'t match';
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff769FCE)),
                        onPressed: () {
                          if (_formKey2.currentState!.validate()) {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TodoListPage()),
                              );
                            });
                          }
                        },
                        child: Text('Sign in'),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff769FCE)),
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          });
                        },
                        child: Text('go in'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
