import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zelus/Screens/signup_form.dart';

import '../Services/authService.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email, required this.name, required this.isorg});
  final String name;
  final String email;
  final bool isorg;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  AuthService _service = AuthService();

  TextEditingController _pinController = TextEditingController();

  String? _pin;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Container( height: height * 0.20,
        width: width * 0.9,
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.09),
            borderRadius: BorderRadius.all(Radius.circular(20))),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: _pinController,
                onChanged: (value) {
                  setState(() {
                    _pin = value; // Update the pin value when it changes
                  });
                },
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.grey[300],
                  selectedFillColor: Colors.blue[100],
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                  selectedColor: Colors.blue,
                ),
                cursorColor: Colors.blue,
                enableActiveFill: true,
                autoDisposeControllers: false,
                autoFocus: true,
              ),    Text("* check email",textAlign: TextAlign.start,),
              SizedBox(
                height: 20,
              ),
              // The submit button
              ElevatedButton(
                onPressed: () {
                  // Do something with the pin value
                  try{_service.otp(widget.email, _pin!);}
                  catch(e)
                  {
                    _pinController.text="";
                  }finally{
                    Get.back();
                    Get.to(SignupForm(name: widget.name, email: widget.email, isorg: widget.isorg));

                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
