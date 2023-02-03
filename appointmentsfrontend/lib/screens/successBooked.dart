import 'package:appointmentsfrontend/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../components/button.dart';

class SuccessBooked extends StatelessWidget {
  const SuccessBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Lottie.asset('assets/check-circle.json',
                  width: 200, fit: BoxFit.contain),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Successfully Booked',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
              child: Button(
                width: double.infinity,
                title: 'Back to Home Page',
                onPressed: () => Navigator.of(context).pushNamed('main'),
                disable: false,
              ),
            ),
            Config.spaceMedium,
          ],
        ),
      ),
    );
  }
}
