import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController key = TextEditingController();
    String _mne = "";
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
              height: height * 0.5,
              width: width * 0.9,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.09),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: height * 0.001,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Wallet",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.logout,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Center(child: Text(
                              "Wallet Address",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ) ,),

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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _mne,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.12,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.09),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [ Text(
                              "Balance",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                              Spacer(),
                              IconButton(
                                  onPressed: () async {
                                    await Clipboard.setData(
                                        ClipboardData(text: _mne));
                                  },
                                  icon: Icon(
                                    Icons.refresh,
                                    color: Color.fromRGBO(255, 255, 255, 0.4),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            _mne,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
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
