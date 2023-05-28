import 'package:flutter/material.dart';
import 'package:flutter_application/utiles/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  // connecting to firebase
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.homeRoute);

      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 0),
          Image.asset(
            'assets/images/hey.png',
            fit: BoxFit.cover,
            // height: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Welcome $name",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Your User Name",
                        labelText: "Username"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "UserName cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    controller: emailController,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Your Password", labelText: "Password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 6) {
                        return "Length cannot be less than 6";
                      }
                      return null;
                    },
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: context.theme.buttonColor,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      // onTap: () => moveToHome(context),
                      onTap: () {
                        print('Login Clicked');
                        if (_formKey.currentState!.validate()) {
                          _auth.signInWithEmailAndPassword(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString());
                          ;
                        }
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 45,
                        width: changeButton ? 50 : 150,
                        alignment: Alignment.center,
                        child: changeButton
                            ? (Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 30,
                              ))
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                        // decoration: BoxDecoration(
                        //   shape: changeButton
                        //       ? BoxShape.circle
                        //       : BoxShape.rectangle,
                        //   color: Colors.deepPurple,
                        // )
                      ),
                    ),
                  )
                  // ElevatedButton(
                  //   style:
                  //       ElevatedButton.styleFrom(minimumSize: Size(150, 45)),
                  //   onPressed: () =>
                  //       {Navigator.pushNamed(context, MyRoute.homeRoute)},
                  //   child: Text("Login"),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
