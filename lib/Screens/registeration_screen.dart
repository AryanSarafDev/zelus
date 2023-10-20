import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zelus/Screens/OTP%20Screen.dart';
import 'package:zelus/Screens/signup_form.dart';

import '../Services/authService.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthService _service = AuthService();
  TextEditingController key = TextEditingController();
  TextEditingController key1 = TextEditingController();
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              height: height * 0.6,
              width: width * 0.9,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.09),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.asset(
                        'images/Zelus.png',
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.001,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Username",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  TextField(
                    controller: key,
                    cursorColor: Colors.blue,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(255, 255, 255, 0.09),
                      filled: true,
                      border: InputBorder.none,
                      hintText: "Enter Username",
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "E-mail",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  TextField(
                    controller: key1,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.blue,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(255, 255, 255, 0.09),
                      filled: true,
                      border: InputBorder.none,
                      hintText: "Enter e-mail",
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                  ),
                  Center(
                    child: CheckboxListTile(
                      value: _value,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _value = newValue!;
                        });
                      },
                      title: Text('Want to host a Loyalty Program?'),
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                      tileColor: Colors.black,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _service.sendOTP(key1.text);

                        Get.defaultDialog(title:"Enter OTP",barrierDismissible: false,content: OtpScreen(email: key1.text,name: key.text,isorg: _value,));
                        },
                        child: Text('Next'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_rounded))
        ]),
      ),
    );
  }
}
