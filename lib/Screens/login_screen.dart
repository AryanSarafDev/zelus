import 'package:flutter/material.dart';
import 'package:zelus/Screens/login_form.dart';
import 'package:zelus/Screens/signup_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Container(
            height: height * 0.5,
            width: width * 0.8,
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.09),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'images/Zelus.png',
                  height: 200,
                  width: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login_Form()),
                        );
                      },
                      child: Text('Login'),
                    ),
                    GestureDetector(onTap: (){ Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupForm()),
                    );},
                      child: Container(
                        color: Color.fromRGBO(255, 255, 255, 0.09),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Sign-up"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
