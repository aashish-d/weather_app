// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/modals/weather.dart';
import '../constant.dart';
import 'package:intl/intl.dart';

class BigCard extends StatelessWidget {
  final cardHeight;
  final temp;
  final cityName;
  final description;
  final icon;
  final String code;

  BigCard(
      {required this.cardHeight,
      required this.cityName,
      required this.code,
      required this.temp,
      required this.icon,
      required this.description});
  @override
  Widget build(BuildContext context) {
    String cdate = DateFormat("EEEEE, dd MMM").format(DateTime.now());

    return Container(
        height: cardHeight,
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color2, color1],
            stops: [0.2, 0.85],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: LayoutBuilder(builder: (ctx, constraint) {
          var height = constraint.maxHeight;
          return Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                height: height * 0.15,
                child: FittedBox(
                  child: Text(cityName,
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: height / 11.92,
                        color: color2,
                      )),
                ),
              ),
              Container(
                // color: Colors.red,
                height: height * 0.05,
                child: Text(
                  cdate,
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: height / 43.73,
                    color: color2.withOpacity(0.9),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                // color: Colors.red,
                height: height * 0.28,
                child: Icon(
                  Icons.sunny,
                  size: height * 0.28,
                ),
                // child: Image.asset(
                //   "sun/7.png",
                //   fit: BoxFit.cover,
                //   height: height * 0.28,
                // ),
              ),
              Container(
                //color: Colors.red,
                height: height * 0.15,
                child: Text(
                  description,
                  style: GoogleFonts.poppins().copyWith(
                      fontSize: height * 0.1,
                      fontWeight: FontWeight.bold,
                      color: color1),
                ),
              ),
              Container(
                // color: Colors.red,
                height: height * 0.11,
                child: Text(
                  "$temp°",
                  style: GoogleFonts.poppins().copyWith(
                      fontSize: height / (height / 50),
                      fontWeight: FontWeight.w800,
                      color: color1),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                //color: Colors.red,
                height: height * 0.2,
                child: Row(
                  children: [
                    RowIcons(
                      height: height * 0.13,
                    ),
                    RowIcons(
                      height: height * 0.13,
                    ),
                    RowIcons(
                      height: height * 0.13,
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
  }
}

class RowIcons extends StatelessWidget {
  const RowIcons({Key? key, required this.height}) : super(key: key);

  final height;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Icon(
          Icons.sunny_snowing,
          size: height,
        ),
        Text(
          "Demo text",
          style: GoogleFonts.poppins().copyWith(
              fontSize: height / (height / 18),
              color: color1,
              fontWeight: FontWeight.bold),
        )
      ],
    ));
  }
}
