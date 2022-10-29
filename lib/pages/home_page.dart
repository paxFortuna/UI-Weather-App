import 'dart:async';

import 'package:flutter/material.dart';

import '../colors.dart';
import '../icons.dart';
import '../loading.dart';
import '../models/weather.dart';
import '../services/wheather_api.dart';
import '../widgets/fore_cast_card.dart';
import '../widgets/header.dart';
import '../widgets/info_card.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  // WeatherService weatherService = WeatherService();
  // Weather weather = Weather();
  //
  // String image = '';
  // Color defaultColor = Colors.black;
  // int hour = 0;
  // bool isday = false;
  // bool isNight = false;
  // String icon = '';
  // bool _isLoadinf = true;

  // Future getWeather() async {
  //   weather = await weatherService.getWeatherData();
  //   setState(() {
  //     getWeather();
  //     _isLoadinf = false;
  //   });
  // }
  //
  // void setday() async {
  //   List datetime = weather.date.split(' ');
  //   var hours = datetime[1].split(':');
  //   var turnInt = int.parse(hours[0]);
  //   if (turnInt >= 19 || turnInt <= 5) {
  //     print(turnInt);
  //     setState(() {
  //       isday = false;
  //       isNight = true;
  //       defaultColor = nightappbarcolor;
  //     });
  //   }
  //   if (turnInt > 5 && turnInt < 19) {
  //     setState(() {
  //       isNight = false;
  //       isday = true;
  //       defaultColor = dayappbarcolor;
  //     });
  //   }
  // }
  //
  // void day() async {
  //   setState(() {
  //     defaultColor = dayappbarcolor;
  //   });
  //   if (weather.text == 'Sunny') {
  //     setState(() {
  //       loadingIcon = sunnyIcon;
  //     });
  //   }
  //   if (weather.text == 'Overcast') {
  //     setState(() {
  //       loadingIcon = overcastDayIcon;
  //     });
  //   }
  //   if (weather.text == 'Partly cloud') {
  //     setState(() {
  //       loadingIcon = partlyCloudDayIcon;
  //     });
  //   }
  // }
  //
  // void night() async {
  //   setState(() {
  //     defaultColor = nightappbarcolor;
  //   });
  //
  //   if (weather.text == 'Partly Cloud') {
  //     setState(() {
  //       loadingIcon = partlyCloudyIconNight;
  //     });
  //   }
  //   if (weather.text == 'Clear') {
  //     setState(() {
  //       loadingIcon = clearNightIcon;
  //     });
  //   }
  // }
  //
  // void gethour() {
  //   List datetime = weather.date.split(' ');
  //   var hours = datetime[1].split(':');
  //   var turnInt = int.parse(hours[0]);
  //   setState(() {
  //     hour = turnInt;
  //   });
  // }
  List forecast = [
    // String hour, String description, String imgPath, double averageTemp
    ['12:12', '대체로 맑음', 'assets/tarot.png', 12.2],
    ['22:32', '소나기 후 맑은 하늘', 'assets/tarot.png', 11.2],
    ['22:32', '소나기 후 맑은 하늘', 'assets/tarot.png', 11.2],
    ['22:32', '소나기 후 맑은 하늘', 'assets/tarot.png', 11.2],
    ['22:32', '소나기 후 맑은 하늘', 'assets/tarot.png', 11.2],
    ['22:32', '소나기 후 맑은 하늘', 'assets/tarot.png', 11.2],
    ['22:32', '소나기 후 맑은 하늘', 'assets/tarot.png', 11.2],
  ];

  // @override
  // void initState() {
    // getWeather();
    // Timer.periodic(Duration(seconds: 2), (timer) {
    //   setday();
    // });
    // Timer.periodic(Duration(seconds: 3), (timer) {
    //   isday ? day() : night();
    // });
    // Timer.periodic(Duration(seconds: 3), (timer) {
    //   gethour();
    // });
  //   Future.delayed(Duration(seconds: 2), () async {
  //     await weatherService.getWeatherData;
  //     setState(() {
  //       _isLoadinf = false;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) =>
      // _isLoadinf ? LoadingPage():
      Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(300),
            child: Header(
              backgroundColor: defaultColor,
              // city_name: weather.city,
              city_name: '서울',
              // description: weather.text,
              description: '흐림',
              descriptionIMG: loadingIcon,
              // state_name: weather.state,
              state_name: '구름 많음',
              //temp: weather.temp,
              temp: 12.0,
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
                gradient:
                // isday
                //     ? LinearGradient(
                //         begin: const Alignment(-1.5, 8),
                //         end: const Alignment(-1.5, -0.5),
                //         colors: [Colors.white, defaultColor]) :
                      LinearGradient(
                        begin: const Alignment(-1.5, 8),
                        end: const Alignment(-1.5, -0.5),
                        colors: [Colors.white, defaultColor])),
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromARGB(0, 255, 255, 255),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        // itemCount: weather.forecast.length - hour - 1,
                        // itemCount: weather.forecast.length,
                        itemCount: forecast.length,
                        itemBuilder: (context, index) => SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 5,
                              ),
                              child: Center(
                                  child: ForecastCard(
                                // hour: weather.forecast[hour + index]['time']
                                //     .toString()
                                //     .split(' ')[1],
                                hour: forecast[index][0],
                                // averageTemp: weather.forecast[hour + index]
                                //     ['temp_c'],
                                averageTemp: forecast[index][3],
                                // description: weather.forecast[hour + index]
                                //     ['condition']['text'],
                                description: forecast[index][1],
                                // descriptionIMG: weather.forecast[hour + index]
                                //         ['condition']['icon']
                                //     .toString()
                                //     .replaceAll('//', 'http://'))),
                                descriptionIMG: forecast[index][2],
                              )),
                            )),
                  ),
                ),
                SliverToBoxAdapter(
                  child: InformartionsCard(
                    // humidity: weather.humidity,
                      humidity: 43,
                    // uvIndex: weather.uvIndex,
                      uvIndex: 23.0,
                    // wind: weather.wind,
                    wind: 11.1,
                  ),
                )
              ],
            ),
          ),
        );
}
