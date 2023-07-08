import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:opt_verify/verification.dart';
import 'package:responsive_mediaquery/responsive_mediaquery.dart';
import '../../main.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({Key? key});

  static String verify = "";

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  TextEditingController countrycode = TextEditingController();
  var phone = "";

  @override
  void initState() {
    countrycode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.wifi),
          Icon(Icons.network_cell),
          Icon(Icons.battery_5_bar_sharp),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(
                height: 10,
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.04,
            ),
            const Text(
              "Please Enter Your Mobile Number",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            const Text(
              "You'll receive a 6-digit code\n              to verify next",
              style: TextStyle(color: Colors.blueGrey, fontSize: 17),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            SizedBox(
              width: screenSize.width * 0.85,
              child: Container(
                height: screenSize.height * 0.08,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.1,
                      child: TextField(
                        controller: countrycode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone Number",
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          phone = value;
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(screenSize.width * 0.85, screenSize.height * 0.1),
                ),
                backgroundColor: MaterialStateProperty.all(const Color(0xff2e3b62)),
              ),
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: countrycode.text + phone,
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) {
                    MobilePage.verify = verificationId;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerifyPage(),
                      ),
                    );
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
              },
              child: const Text(
                "CONTINUE",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                height: screenSize.height * 0.02,
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: screenSize.width,
                  child: Image.asset('assets/Vector (2).png'),
                ),
                Positioned(
                  top: screenSize.height * 0.01,
                  child: SizedBox(
                    width: screenSize.width,
                    child: Image.asset('assets/Vector (3).png'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
