import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:opt_verify/mobile.dart';
import 'package:opt_verify/profile.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_mediaquery/responsive_mediaquery.dart';
import '../../main.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = "";

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
              "Verify Phone",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            const Text(
              "Code is sent to Your Number",
              style: TextStyle(color: Colors.blueGrey, fontSize: 17),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Pinput(
              length: 6,
              showCursor: true,
              onChanged: (value) {
                code = value;
              },
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't receive the code?",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Request Again",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(screenSize.width * 0.85, screenSize.height * 0.1),
                ),
                backgroundColor: MaterialStateProperty.all(const Color(0xff2e3b62)),
              ),
              onPressed: () async {
                try {
                  PhoneAuthCredential credential =
                  PhoneAuthProvider.credential(
                    verificationId: MobilePage.verify,
                    smsCode: code,
                  );

                  await auth.signInWithCredential(credential);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                        (route) => false,
                  );
                } catch (e) {
                  print("wrong otp");
                }
              },
              child: Text(
                "VERIFY AND CONTINUE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenSize.width * 0.05,
                ),
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
            ),
          ],
        ),
      ),
    );
  }
}
