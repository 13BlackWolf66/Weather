import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/home_page.dart';

class FindCityPage extends StatefulWidget {
  const FindCityPage({super.key});

  @override
  State<FindCityPage> createState() => _FindCityPageState();
}

class _FindCityPageState extends State<FindCityPage> {
  String? countryValue;
  String? stateValue;
  String? cityValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage(location: cityValue)),
                  (Route<dynamic> route) => false);
            },
            icon: const Icon(Icons.arrow_back))),
        title: Text(
          'Choose city',
          style: GoogleFonts.sourceSerifPro(fontSize: 28, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple.shade900,
                Colors.blue,
                Colors.green.shade400,
              ],
            ),
          ),
          child: Column(
            children: [
              CSCPicker(
                onCountryChanged: (value) {
                  setState(() {
                    countryValue = value;
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    stateValue = value;
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    cityValue = value;
                  });
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Text('Your city ${(cityValue == null) ? 'unknown' : cityValue}',
                  style: GoogleFonts.sourceSerifPro(
                    fontSize: 30.0,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
