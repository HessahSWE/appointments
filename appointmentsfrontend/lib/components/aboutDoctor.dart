import 'package:appointmentsfrontend/components/detailBody.dart';
import 'package:appointmentsfrontend/components/doctorInfo.dart';
import 'package:appointmentsfrontend/utils/config.dart';
import 'package:flutter/material.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          const CircleAvatar(
            radius: 65,
            backgroundImage: AssetImage('assets/google.png'),
            backgroundColor: Colors.white,
          ),
          Config.spaceMedium,
          const Text(
            'Dr Richerd Tan',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * .75,
            child: const Text(
              'What is Dart doc?The dart doc command (previously called dartdoc ) ',
              style: TextStyle(color: Config.greyColor, fontSize: 15),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.space,
          SizedBox(
            width: Config.widthSize * .75,
            child: Text(
              'Serreskd dmmmmmmmm kslwkkkkkkkkkk',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
