import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdditionalInfo extends StatelessWidget {
  String wind;
  String humidity;
  String pressure;
  String feels_like;
  AdditionalInfo({
    super.key,
    required this.feels_like,
    required this.wind,
    required this.humidity,
    required this.pressure,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wind $wind km/h',
                style: GoogleFonts.sourceSerifPro(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Text(
                'Pressure $pressure mb',
                style: GoogleFonts.sourceSerifPro(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Humidity $humidity %',
                style: GoogleFonts.sourceSerifPro(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Text(
                'Feels like $feels_like°',
                style: GoogleFonts.sourceSerifPro(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
