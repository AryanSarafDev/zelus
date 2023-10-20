import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login_Form extends StatefulWidget {
  const Login_Form({super.key});

  @override
  State<Login_Form> createState() => _Login_FormState();
}

class _Login_FormState extends State<Login_Form> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController key = TextEditingController();
    final storage = const FlutterSecureStorage();

    return Scaffold(

      body: SafeArea(
        child: Stack(children: [
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
              height: height * 0.34,
              width: width * 0.8,
              decoration: const BoxDecoration(
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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Enter Password",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  TextField(controller: key,
                    cursorColor: Colors.blue,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(255, 255, 255, 0.09),
                      filled: true,
                      border: InputBorder.none,
                      hintText: 'Enter Security Phrase',
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_rounded))

        ]),
      ),
    );
  }
}
