import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class ResultPage extends StatefulWidget {
  final String cityName;
  final String main;
  final String description;
  final double temp;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final String icon;
  const ResultPage(
      {super.key,
      required this.main,
      required this.description,
      required this.temp,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity,
      required this.windSpeed,
      required this.icon,
      required this.cityName});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 18, 30, 1),
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  widget.cityName.toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: ImageNetwork(
                      fitAndroidIos: BoxFit.cover,
                      image:
                          'https://openweathermap.org/img/wn/${widget.icon}@2x.png',
                      height: 100,
                      width: 100),
                ),
                const SizedBox(height: 8),
                Text(
                  '${widget.temp}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Today\'s Weather',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                    textAlign: TextAlign.left,
                  ),
                ),
                createListtile('Main', widget.main),
                const SizedBox(height: 8),
                createListtile('Description', widget.description),
                const SizedBox(height: 8),
                createListtile('Minimum Temperature', widget.tempMin),
                const SizedBox(height: 8),
                createListtile('Max Temperature', widget.tempMax - 32),
                const SizedBox(height: 8),
                createListtile('Humidity', widget.humidity),
                const SizedBox(height: 8),
                createListtile('Pressure', widget.pressure),
                const SizedBox(height: 8),
                createListtile('Wind Speed', widget.windSpeed),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding createListtile(String category, var value) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.grey.shade300,
        title: Text(
          category,
          style: const TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          value.toString(),
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          )),
      backgroundColor: const Color.fromRGBO(11, 18, 30, 1),
      title: const Text(
        'Air Conditions',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
  }
}
