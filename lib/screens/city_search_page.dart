import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app_with_api/screens/result_page.dart';
import 'package:http/http.dart' as http;

class CitySearchPage extends StatefulWidget {
  const CitySearchPage({super.key});

  @override
  State<CitySearchPage> createState() => _CitySearchPageState();
}

final formKey = GlobalKey<FormState>();
final formFieldController = TextEditingController();
String selectedCity = '';
String esas = '';
String desc = '';
String icon = '';
double feelsLike = 0;
double temp = 0;
double tempMin = 0;
double tempMax = 0;
int pressure = 0;
int humidity = 0;
double speedWind = 0;

Future<void> fetchData() async {
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=+$selectedCity+&appid=d25bd364bfd8bb8ebe7b940692ddbc09'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    esas = jsonData['weather'][0]['main'];
    desc = jsonData['weather'][0]['description'];
    icon = jsonData['weather'][0]['icon'];
    temp = jsonData['main']['temp'];
    feelsLike = jsonData['main']['feels_like'];
    tempMin = jsonData['main']['temp_min'];
    tempMax = jsonData['main']['temp_max'];
    pressure = jsonData['main']['pressure'];
    humidity = jsonData['main']['humidity'];
    speedWind = jsonData['wind']['speed'];
  } else {
    debugPrint(response.reasonPhrase);
  }
}

class _CitySearchPageState extends State<CitySearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 18, 30, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Type the name of the city whose weather you want to know and click the button.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: formKey,
                child: textFormField(formFieldController),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField textFormField(TextEditingController controller) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some city name';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Type the city name',
        hintStyle: const TextStyle(color: Colors.black),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      cityName: selectedCity,
                      main: esas,
                      description: desc,
                      feelsLike: feelsLike,
                      humidity: humidity,
                      icon: icon,
                      pressure: pressure,
                      temp: temp,
                      tempMin: tempMin,
                      windSpeed: speedWind,
                      tempMax: tempMax,
                    ),
                  ),
                );
                selectedCity = controller.text;
                fetchData();
                controller.text = '';
                debugPrint(selectedCity);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(20),
                    content: Text(
                        'The city name you entered has been saved: $selectedCity')));
              }
            },
            icon: const Icon(Icons.search)),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
