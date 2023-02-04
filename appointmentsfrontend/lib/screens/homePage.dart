import 'dart:convert';
import 'package:appointmentsfrontend/components/appointmentCard.dart';
import 'package:appointmentsfrontend/components/doctorCard.dart';
import 'package:appointmentsfrontend/provider/dioProvider.dart';
import 'package:appointmentsfrontend/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Map<String, dynamic> user = {};
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

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    if (token.isNotEmpty && token != '') {
      final response = await DioProvider().getUser(token);
      if (response != null) {
        setState(() {
          print('ttttttttttttttttttttttttt');
          print(json.decode(response));
          user = json.decode(response);
        });
      }
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SingleChildScrollView(
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/google.png'),
                      ),
                    )
                  ],
                ),
                Config.spaceSmall,
                const Text(
                  'Category',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Config.spaceSmall,
                SizedBox(
                  height: Config.hightSize * 0.05,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(
                      medCat.length,
                      (index) {
                        return Card(
                          margin: const EdgeInsets.only(right: 20),
                          color: Config.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                FaIcon(
                                  medCat[index]['icon'],
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  medCat[index]['category'],
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Config.spaceSmall,
                const Text(
                  'Appointment Today',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Config.spaceSmall,
                const AppointmentCard(),
                Config.spaceSmall,
                const Text(
                  'Top Doctors',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Config.spaceSmall,
                Column(
                  children: List.generate(10, (index) {
                    return const DoctorCard(
                      route: 'docDetails',
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
