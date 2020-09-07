import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/util/convert_icon.dart';
import 'package:weather_forecast/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index){
  var forecastList = snapshot.data.list;
  var dayOfWeek = "";
  var date = new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDescription: forecastList[index].weather[0].main, color: Colors.pinkAccent, size: 45),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("${forecastList[index].temp.min.toStringAsFixed(0)}°C"),
                  ),
                  FaIcon(FontAwesomeIcons.solidArrowAltCircleDown, color: Colors.white,)
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("${forecastList[index].temp.max.toStringAsFixed(0)}°C"),
                  ),
                  FaIcon(FontAwesomeIcons.solidArrowAltCircleUp, color: Colors.white,)
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("Hum:${forecastList[index].humidity.toStringAsFixed(0)}%"),
                  ),
                  // FaIcon(FontAwesomeIcons.grinBeamSweat, color: Colors.white,)
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("Win:${forecastList[index].speed.toStringAsFixed(1)} mi/h"),
                  ),
                  // FaIcon(FontAwesomeIcons.wind, color: Colors.white,)
                ],
              ),
            ],
          )
        ],
      )
    ],
  );
}