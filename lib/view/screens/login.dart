import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:jeevika_job_posting/view/screens/register.dart';

import 'homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  void validate() {
    if (_formKey.currentState!.validate()) {
      print("Ok");
    } else {
      print("Error");
    }
  }

  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login.jpg'),
                fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              Container(
                padding: const EdgeInsets.only(top: 110, left: 40),
                child: const Text(
                  'Welcome to\nJeevika',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 230, left: 35, right: 35),
                    child: Column(children: [
                      Form(
                        key: _formKey,
                        child: Column(children: [
                          TextFormField(
                            validator: MultiValidator([
                              EmailValidator(errorText: "Not Valid"),
                              RequiredValidator(errorText: "Required")
                            ]),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: 'Email',
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: 'Password',
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password?',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 16),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                  color: Colors.black,
                                  onPressed: () {
                                    validate();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) =>
                                            const MyHomePage()),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.arrow_forward),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("Don't have an Account?"),
                              TextButton(
                                  onPressed: () {
                                    validate();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                const Register())));
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(fontSize: 22),
                                  )),
                            ],
                          ),
                        ]),
                      )
                    ]),
                  ),
                ),
              )
            ])));
  }
}
