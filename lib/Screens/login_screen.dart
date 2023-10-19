import 'package:flutter/material.dart';

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
                        // Navigate to the signup screen
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => SignupScreen()),
                        // );
                      },
                      child: Text('Login'),
                    ),
                    Container(
                      color: Color.fromRGBO(255, 255, 255, 0.09),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Sign-up"),
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
