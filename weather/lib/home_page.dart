import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/current_weather.dart';
import 'package:weather/weather_model.dart';

import 'find_city_page.dart';

class HomePage extends StatefulWidget {
  String? location = "Vinnytsya";
  HomePage({super.key, required this.location});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather? data;
  WeatherAPI client = WeatherAPI();
  

  Future<void> getData() async {
    data = await client.getCurrentWeather("${(widget.location==null||widget.location=='unknown')? "Vinnytsya":widget.location}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:(IconButton(onPressed: (){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FindCityPage()),
            );}, icon:const Icon(Icons.search))),        
        title: Text(
          'Weather',
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
          child: Center(
            child: Container(
              child: FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      
                      return CurrentWeather(
                        data: data!,
                      );
                    } else {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    }
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
