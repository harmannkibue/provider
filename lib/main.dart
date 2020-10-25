import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './weatherinfo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "State Management",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        builder: (context) => WeatherInfo(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Proven States"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MyHeading(),
                MyContent(),
              ],
            ),
          ),
          floatingActionButton: MyFloatingActionButton(),
        ),
      ),
    );
  }
}

class MyHeading extends StatelessWidget {
   Color textColor(WeatherInfo info){
    return info.tempType == 'celcius'? Colors.green : Colors.deepOrange;
  }
  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(weatherInfo.tempType, style: TextStyle(color: textColor(weatherInfo), fontWeight: FontWeight.bold, fontSize: 30),),
    );
  }
}

class MyContent extends StatelessWidget {
  Color textColor(WeatherInfo info){
    return info.tempType == 'celcius'? Colors.green : Colors.deepOrange;
  }
  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);
    int val = weatherInfo.tempValue;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Text("$val", style: TextStyle(color: textColor(weatherInfo), fontWeight: FontWeight.bold, fontSize: 20),),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  Color decideColor(WeatherInfo info) {
    return info.tempType == 'celcius' ? Colors.green : Colors.deepOrange;
  }

  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);

    return FloatingActionButton(
      backgroundColor: decideColor(weatherInfo),
      elevation: 0,
      child: Icon(Icons.change_history),
      tooltip: ("Change Type"),
      onPressed: () {
        String newWeatherType =
            weatherInfo.tempType == 'celcius' ? 'fahrenheit' : 'celcius';
        weatherInfo.tempType = newWeatherType;
        weatherInfo.tempValue++;
      },
    );
  }
}
