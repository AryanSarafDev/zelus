import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solana/solana.dart';
import 'package:zelus/Screens/Profile.dart';

class Login_Form extends StatefulWidget {
  const Login_Form({super.key});

  @override
  State<Login_Form> createState() => _Login_FormState();
}

class _Login_FormState extends State<Login_Form> {
  int index = 0;
  List L = [];

  TextEditingController key = TextEditingController();
  TextEditingController key1 = TextEditingController();
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              width: width * 0.8,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.09),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                      "Enter Security Phrase",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  index>0?Wrap(
                    children: [
                      for (int i = 0; i < 12; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 0.09),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${L[i]}"),
                            ),
                          ),
                        )
                    ],
                  ):Container(),
                  TextField(
                    controller: key,
                    cursorColor: Colors.blue,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(255, 255, 255, 0.09),
                      filled: true,
                      border: InputBorder.none,
                      hintText: 'Enter Security Phrase',
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                    onChanged: (value) {
                      setState(() {
                        L = value.split(" ");
                        index = L.length;
                        print(L);
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Enter Password",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  TextField(
                    controller: key1,
                    cursorColor: Colors.blue,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(255, 255, 255, 0.09),
                      filled: true,
                      border: InputBorder.none,
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
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

  void _submit() async {
    String _mne = L.join(" ");

    final check = bip39.validateMnemonic(_mne);
    if (check) {
      await storage.write(key: 'password', value: key1.text);
      await storage.write(key: 'mnemonic', value: _mne);
      final keypair = await Ed25519HDKeyPair.fromMnemonic(_mne);
      final pair = keypair.address;
      await storage.write(key: 'private_key', value: pair);
      Get.to(ProfileScreen());
    }
  }
}
