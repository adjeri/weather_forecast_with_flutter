import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon({String weatherDescription, Color color, double size}){
  switch(weatherDescription){
    case "Clear":
      {
        return FaIcon(FontAwesomeIcons.sun, color: color, size: size);
      }
      break;
    case "Clouds":
      {
        return FaIcon(FontAwesomeIcons.cloud, color: color, size: size);
      }
      break;
    case "Rain":
      {
        return FaIcon(FontAwesomeIcons.cloudRain, color: color, size: size);
      }
      break;
    case "Snow":
      {
        return FaIcon(FontAwesomeIcons.snowman, color: color, size: size);
      }
      break;
    default:
      {
        return FaIcon(FontAwesomeIcons.sun, color: color, size: size);
      }
      break;

  }
}