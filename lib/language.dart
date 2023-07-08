import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opt_verify/mobile.dart';
import 'package:responsive_mediaquery/responsive_mediaquery.dart';
import '../../main.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String selectedValue = "English";
  late String newValue;

  List<String> dropdownItems = [
    'English',
    'Hindi',
    'Nepali',
    'Gujarati',
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.wifi),
          Icon(Icons.network_cell),
          Icon(Icons.battery_5_bar_sharp),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: SizedBox(height: screenSize.height * 0.1),
            ),
            Image.asset('assets/image.png'),
            SizedBox(height: screenSize.height * 0.03),
            Text(
              "Please Select Your Language",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Text(
              "You can change the language\nat any time",
              style: TextStyle(color: Colors.blueGrey, fontSize: 17),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Container(
              width: screenSize.width * 0.4,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: DropdownButton<String>(
                value: selectedValue,
                icon: Icon(Icons.arrow_drop_down,
                    size: screenSize.width * 0.06, color: Colors.blueGrey),
                iconSize: screenSize.width * 0.048,
                isExpanded: true,
                elevation: 16,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenSize.width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
                underline: SizedBox(),
                onChanged: (newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: dropdownItems.map<DropdownMenuItem<String>>(
                      (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(screenSize.width * 0.4, 48),
                ),
                backgroundColor: MaterialStateProperty.all(Color(0xff2e3b62)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MobilePage(),
                  ),
                );
              },
              child: Text(
                "NEXT",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenSize.width * 0.05,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(height: screenSize.height * 0.01),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: screenSize.width,
                  child: Image.asset('assets/Vector (4).png'),
                ),
                Positioned(
                  top: screenSize.height * 0.01,
                  child: SizedBox(
                    width: screenSize.width,
                    child: Image.asset('assets/Vector (5).png'),
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
