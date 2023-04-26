import 'package:flutter/material.dart';
import 'package:flutter_task3/login2.dart';
import 'package:google_fonts/google_fonts.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  String fullname = '';
  late String email, pass;
  final _email = TextEditingController();
  final _pass = TextEditingController();
  bool isUser = false;
  List<Map<String, String>> users = [
    {
      "username": "mounika.p@codetru.com",
      "password": "Dev@123",
      "fullname": "Mounika",
      "accesstoken": "agbjgjtjj1999"
    },
    {
      "username": "saiteja@codetru.com",
      "password": "Admin@123",
      "fullname": "Sai Teja Puppala",
      "accesstoken": "agbjgjtjj1997"
    },
    {
      "username": "hemanth@codetru.com",
      "password": "Admins@123",
      "fullname": "Hemanth Macha",
      "accesstoken": "agbjgjtjj1998"
    },
    {
      "username": "rohith@codetru.com",
      "password": "Rohith@123",
      "fullname": "Rohith Rajabhanu",
      "accesstoken": "agbjgjtjj199"
    },
    {
      "username": "vinay@codetru.com",
      "password": "123@Vinay",
      "fullname": "vinay Perala",
      "accesstoken": "agbjgjtjj1996"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Color.fromARGB(255, 212, 0, 42),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                        child: Text(
                          'Sign in to your account',
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(60, 0, 60, 20),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.',
                          // style: TextStyle(fontSize: 13),
                          // textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      child: SizedBox(
                        width: 350,
                        child: TextFormField(
                          controller: _email,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email = value!;
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Email Address',
                            labelStyle: TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: SizedBox(
                        width: 350,
                        child: TextFormField(
                          obscureText: true,
                          controller: _pass,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null; // Return null if the validation passes
                          },
                          onSaved: (value) {
                            pass = value!;
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            value: isChecked,
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool!;
                              });
                            },
                          ),
                          Text("Remember Me"),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: Colors.blue.shade500,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: SizedBox(
                        width: 330,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // _formKey.currentState!.save();
                              for (int i = 0; i < users.length; i++) {
                                if (users[i]['username'] == _email.text &&
                                    users[i]['password'] == _pass.text) {
                                  isUser = true;
                                  fullname = users[i]['fullname']!;

                                  break;
                                }
                              }
                            }

                            if (isUser && isChecked) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login2(
                                    fullname: fullname,
                                    
                                  ),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Error"),
                                    content:
                                        Text("Incorrect email or password"),
                                    actions: [
                                      TextButton(
                                        child: Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.orange.shade900),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
