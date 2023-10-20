import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:get/get.dart';
import 'package:solana/solana.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  String _mne = "";
  TextEditingController key = TextEditingController();
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _generateMnemonic(context);
  }

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
              height: height * 0.8,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Security Phrase",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        IconButton(
                            onPressed: () {
                              _generateMnemonic(context);
                            },
                            icon: Icon(
                              Icons.refresh,
                              color: Color.fromRGBO(255, 255, 255, 0.4),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.2,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.09),
                       ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            IconButton(
                                onPressed: () async {
                                  await Clipboard.setData(
                                      ClipboardData(text: _mne));
                                },
                                icon: Icon(
                                  Icons.copy,
                                  color: Color.fromRGBO(255, 255, 255, 0.4),
                                ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _mne,
                            style:
                                TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Password",
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
                      hintText: "Enter Password",
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        checkColor: Colors.white,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                      ),
                      Text(
                        "I have noted the security phrase",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Sign-Up'),
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

  void _generateMnemonic(context) async {
    String mn = bip39.generateMnemonic();
    setState(() {
      _mne = mn;
    });
  }

  void _submit() async {
    final keypair = await Ed25519HDKeyPair.fromMnemonic(_mne);
    final pair = keypair.address;
    await storage.write(key: 'password', value: key.text.trim());
    await storage.write(key: 'private_key', value: pair);
  }
}
