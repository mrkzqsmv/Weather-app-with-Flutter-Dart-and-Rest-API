import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:slider_button/slider_button.dart';
import 'package:weather_app_with_api/screens/city_search_page.dart';

class WeatherAppPage extends StatefulWidget {
  const WeatherAppPage({super.key});

  @override
  State<WeatherAppPage> createState() => _WeatherAppPageState();
}

class _WeatherAppPageState extends State<WeatherAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(11, 18, 30, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/umbrella-svgrepo-com.svg',
              width: 210,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'WeatherApp',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 45,
            ),
            SliderButton(
              action: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CitySearchPage()));
              },
              label: const Text(
                'Turn to the right',
                style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              icon: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
