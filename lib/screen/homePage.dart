// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'package:weather_app/constant.dart';
import 'package:weather_app/services/geoLocation.dart';
import 'package:weather_app/services/weatherData.dart';
import 'package:weather_app/size_config.dart';
import '../widgets/bigCard.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var client = WeatherData();
  var data;

  info() async {
    var position = await getPosition();
    data = await client.getData(position.latitude, position.longitude);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double? height = SizeConfig.screenHeight!;
    double? width = SizeConfig.screenWidth!;
    double? kpadding = SizeConfig.defaultPadding!;

    return Scaffold(
      body: FutureBuilder(
        future: info(),
        builder: (context, snapshot) => snapshot.hasData
            ? SingleChildScrollView(
                child: Column(children: [
                  Center(
                      child: BigCard(
                    code: "${data!.code}",
                    icon: '${data?.icon}',
                    cityName: "${data?.cityName}",
                    description: "${data?.description}",
                    temp: "${data?.temp}",
                    cardHeight: height * 0.8,
                  )),
                  SizedBox(
                    height: kpadding,
                  ),
                  Container(
                    width: width * 0.9,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Details(
                              height: height,
                              title: "Wind",
                              data: '${data?.wind} Km/h',
                            ),
                            Details(
                              height: height,
                              title: "Pressure",
                              data: "${data?.pressure} hPa",
                            ),
                            Details(
                                height: height,
                                data: "${data?.humidity}%",
                                title: "Humidity"),
                          ],
                        ),
                        SizedBox(
                          height: kpadding / 2,
                        ),
                        Row(
                          children: [
                            Details(
                                height: height,
                                data: "${data?.visibility} km",
                                title: "Visibility"),
                            Details(
                                height: height,
                                data: '${data?.gust} Kp/h',
                                title: "Gust"),
                            Details(
                                height: height,
                                data: "${data?.uv}",
                                title: "UV")
                          ],
                        ),
                        SizedBox(
                          height: kpadding / 2,
                        ),
                      ],
                    ),
                  ),
                ]),
              )
            : Center(
                child: CircularProgressIndicator(color: color2),
              ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details(
      {Key? key, required this.height, required this.data, required this.title})
      : super(key: key);

  final String title;
  final String data;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.poppins().copyWith(
                fontSize: height * 0.02, color: Colors.white.withOpacity(0.8)),
          ),
          Text(
            data,
            style: GoogleFonts.poppins().copyWith(
                fontSize: height * 0.03,
                fontWeight: FontWeight.bold,
                color: color2),
          ),
          SizedBox(
            width: defaulPadding / 5,
          )
        ],
      ),
    );
  }
}
