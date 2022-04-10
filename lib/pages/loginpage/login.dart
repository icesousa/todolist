import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/pages/homepage/homepage.dart';
import 'package:todolist/pages/sign/sign.dart';
import 'package:todolist/widgets/customTextForm.dart';
import 'package:string_validator/string_validator.dart' as validator;
import 'package:ms_undraw/ms_undraw.dart';

void main() {}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final TextEditingController usernameController1 = TextEditingController();
final TextEditingController passwordController1 = TextEditingController();
final TextEditingController passwordController2 = TextEditingController();
final TextEditingController emailController1 = TextEditingController();
final TextEditingController emailController2 = TextEditingController();

final GlobalKey<FormState> _keyFormLogin = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _keyFormLogin,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Container(
            color: Color.fromRGBO(255, 255, 255, 1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UnDraw(
                      height: 300,
                      width: 200,
                      illustration: UnDrawIllustration.access_account,
                      color: Color(0xff769FCE),
                      placeholder: Text("Illustration is loading..."),
                    ),
                    Text(
                      'Log in to Taskdo.io',
                      style: GoogleFonts.ubuntu(
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
                      hinttext: 'Insert ur username',
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
                      controller: passwordController1,
                      labeltext: 'Password',
                      hinttext: 'Insert ur password',
                      keyboardType: TextInputType.name,
                      maxLines: 1,
                      icon: Icons.lock,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff769FCE)),
                          onPressed: () {
                            if (_keyFormLogin.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            }
                          },
                          child: Text('Log in'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff769FCE)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignPage()),
                            );
                          },
                          child: Text('Sign in'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
