import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:responsive_mediaquery/responsive_mediaquery.dart';
import '../../main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedValue = 1;
  int newValue = 0;

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
            Text(
              "Please Select Your Profile",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenSize.width * 0.06),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Column(
              children: [
                buildRadioItem(
                  1,
                  'assets/Group.png',
                  "Shipper",
                  screenSize,
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                buildRadioItem(
                  2,
                  'assets/Group (1).png',
                  "Transporter",
                  screenSize,
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(screenSize.width * 0.85, screenSize.height * 0.07),
                ),
                backgroundColor: MaterialStateProperty.all(const Color(0xff2e3b62)),
              ),
              onPressed: () {},
              child: Text(
                "CONTINUE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenSize.width * 0.05,
                ),
              ),
            ),
            const Expanded(
              flex: 5,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRadioItem(
      int value,
      String image,
      String title,
      Size screenSize,
      ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedValue = value;
        });
      },
      child: AnimatedContainer(
        width: screenSize.width * 0.85,
        height: screenSize.height * 0.13,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.04,
          vertical: screenSize.height * 0.02,
        ),
        child: Row(
          children: [
            Radio(
              fillColor: MaterialStateProperty.all(const Color(0xff2e3b62)),
              value: value,
              groupValue: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
            ),
            SizedBox(width: screenSize.width * 0.03),
            Image.asset(image,width: screenSize.width * 0.08,height: screenSize.height * 0.5,),
            SizedBox(width: screenSize.width * 0.03),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width * 0.5,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: screenSize.width * 0.06,
                      fontWeight: selectedValue == value
                          ? FontWeight.w500
                          : FontWeight.normal,
                    ),
                  ),
                ),
                Text(
                  "lorem is not just a normal snippet",
                  style: TextStyle(fontSize: screenSize.width * 0.03),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
