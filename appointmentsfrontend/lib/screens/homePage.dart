import 'package:appointmentsfrontend/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<Map<String, dynamic>> medCat = [
    {
      'icon': FontAwesomeIcons.userDoctor,
      'category': 'General',
    },
    {
      'icon': FontAwesomeIcons.heartPulse,
      'category': 'Respirations',
    },
    {
      'icon': FontAwesomeIcons.lungs,
      'category': 'Cardiology',
    },
    {
      'icon': FontAwesomeIcons.hand,
      'category': 'Dermatology',
    },
    {
      'icon': FontAwesomeIcons.personPregnant,
      'category': 'Gynecology',
    },
    {
      'icon': FontAwesomeIcons.teeth,
      'category': 'Dental',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  'Asma',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/google.png'),
                  ),
                )
              ],
            ),
            Config.spaceMedium,
            const Text(
              'Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Config.spaceSmall,
          ],
        )),
      ),
    );
  }
}
