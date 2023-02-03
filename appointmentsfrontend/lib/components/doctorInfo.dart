import 'package:appointmentsfrontend/components/infoCard.dart';
import 'package:appointmentsfrontend/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Row(
      children: const <Widget>[
        InfoCard(label: 'hessah', value: '104'),
        SizedBox(
          width: 15,
        ),
        InfoCard(label: 'hessah', value: '104'),
        SizedBox(
          width: 15,
        ),
        InfoCard(label: 'hessah', value: '104'),
      ],
    );
  }
}
