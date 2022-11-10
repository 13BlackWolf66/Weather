import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/additional_info.dart';
import 'package:weather/weather_model.dart';

class CurrentWeather extends StatelessWidget {
  Weather data;
  CurrentWeather({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15.0,
          ),
          Image.network(
            "https://openweathermap.org/img/w/${data.icon}.png",
            scale: 0.4,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            '${data.temp}°',
            style: GoogleFonts.sourceSerifPro(
              fontSize: 46.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            '${data.cityName}',
            style: GoogleFonts.sourceSerifPro(
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 60.0,
          ),
          Text(
            'Additional information',
            style: GoogleFonts.sourceSerifPro(
              fontSize: 26.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          AdditionalInfo(
            wind: '${data.wind}',
            feels_like: '${data.feels_like}',
            humidity: '${data.humidity}',
            pressure: '${data.pressure}',
          ),
        ],
      ),
    );
  }
}
