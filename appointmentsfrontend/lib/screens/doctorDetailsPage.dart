import 'package:appointmentsfrontend/components/aboutDoctor.dart';
import 'package:appointmentsfrontend/components/customAppbar.dart';
import 'package:appointmentsfrontend/components/detailBody.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/button.dart';

class DoctorDetailsPage extends StatefulWidget {
  const DoctorDetailsPage({super.key});
  @override
  State<DoctorDetailsPage> createState() => _DoctorDetailsPage();
}

class _DoctorDetailsPage extends State<DoctorDetailsPage> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Doctor Details',
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },
            icon:
                FaIcon(isFav ? Icons.favorite_rounded : Icons.favorite_outline),
            color: Colors.red,
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          AboutDoctor(),
          DetailBody(),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(20),
            child: Button(
              width: double.infinity,
              title: 'Book Appointment',
              disable: false,
              onPressed: () {
                Navigator.of(context).pushNamed('bookingPage');
              },
            ),
          )
        ],
      )),
    );
  }
}
