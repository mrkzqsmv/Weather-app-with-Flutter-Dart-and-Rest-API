import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:weather_app_with_api/screens/city_search_page.dart';
import 'package:page_transition/page_transition.dart';

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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 55,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const CitySearchPage(),
                            type: PageTransitionType.bottomToTop));
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
