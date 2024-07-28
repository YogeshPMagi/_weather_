import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myapp/additional_info_item.dart';
import 'package:myapp/hourly_forecast_item.dart';
import 'package:myapp/secrets.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  
  Future getCurrentWeather() async {
   
    try{
      String cityName = 'London';
    final res = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/3/forecast?q=$cityName&APPID=$openWeatherAPIKey',
      ),
    );


final data = jsonDecode(res.body);

if( data['cod'] != '200')
{
throw 'An unexpected error occurred';
}

return data;
///data['list'] [0] ['main']['temp'];



    } catch (e){
       throw e.toString();

    }
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              getCurrentWeather();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(

        future: getCurrentWeather(),
        builder: (context,snapshot)   {

                        print(snapshot);
                        print(snapshot.runtimeType);
                    return Padding(
                          padding: const EdgeInsets.all(16.0),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                    // main card
                    SizedBox(
                   width: double.infinity,
                   child: Card(
                    color:  Color.fromARGB(255, 175, 203, 63),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child:  Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                '200 K',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                             const  Icon(
                                Icons.cloud,
                                size: 64,
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Rain',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ),

                ),
                      const SizedBox(height: 20),
                     const Text(
                  'Weather Forecast',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      HourlyForecastItem(
                        time: '00:00',
                        icon: Icons.cloud,
                        temperature: '301.22',
                      ),
                      HourlyForecastItem(
                        time: '03:00',
                        icon: Icons.sunny,
                        temperature: '300.52',
                      ),
                      HourlyForecastItem(
                        time: '06:00',
                        icon: Icons.cloud,
                        temperature: '302.22',
                      ),
                      HourlyForecastItem(
                        time: '09:00',
                        icon: Icons.sunny,
                        temperature: '300.12',
                      ),
                      HourlyForecastItem(
                        time: '12:00',
                        icon: Icons.cloud,
                        temperature: '301.22',
                      ),
                      HourlyForecastItem(
                        time: '00:00',
                        icon: Icons.sunny,
                        temperature: '304.12',
                      ),
                    ],
                  ),
                ), // weather forecast
                const SizedBox(height: 20),
                const Text(
                  'Additional Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 14),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalInfoItem(
                      icon: Icons.water_drop,
                      label: 'Humidity',
                      value: '91',
                    ),
                    AdditionalInfoItem(
                      icon: Icons.air,
                      label: 'wind speed',
                      value: '7.1',
                    ),
                    AdditionalInfoItem(
                      icon: Icons.beach_access,
                      label: 'pressure',
                      value: '1000',
                    )
                  ],
                ),
              ],

            ),

          );
        },

        ),




      );
    
  }
}
