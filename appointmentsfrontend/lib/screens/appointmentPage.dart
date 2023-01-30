import 'dart:ffi';

import 'package:appointmentsfrontend/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPage();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPage extends State<AppointmentPage> {
  FilterStatus filterStatus = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      'doctorName': 'Hessah Fahad',
      'doctorProfile': 'assets/google.png',
      'category': 'Dental',
      'status': FilterStatus.upcoming
    },
    {
      'doctorName': 'Sara Fahad',
      'doctorProfile': 'assets/google.png',
      'category': 'Dental',
      'status': FilterStatus.complete
    },
    {
      'doctorName': 'Nora Fahad',
      'doctorProfile': 'assets/google.png',
      'category': 'Dental',
      'status': FilterStatus.upcoming
    },
    {
      'doctorName': 'Asms Fahad',
      'doctorProfile': 'assets/google.png',
      'category': 'Dental',
      'status': FilterStatus.cancel
    },
  ];
  @override
  Widget build(BuildContext context) {
    // List<dynamic> filteredSchedules = schedules.where((var schedule) {
    //   switch (schedule['status']) {
    //     case 'upcoming':
    //       schedule['status'] = FilterStatus.upcoming;
    //       break;
    //     case 'complete':
    //       schedule['status'] = FilterStatus.complete;
    //       break;
    //     case 'cancel':
    //       schedule['status'] = FilterStatus.cancel;
    //       break;
    //   }
    //   return schedule['status'];
    // }).toList();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Appointment Page',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  if (filterStatus == FilterStatus.upcoming) {
                                    filterStatus = FilterStatus.upcoming;
                                    _alignment = Alignment.centerLeft;
                                  } else if (filterStatus ==
                                      FilterStatus.complete) {
                                    filterStatus = FilterStatus.complete;
                                    _alignment = Alignment.center;
                                  } else if (filterStatus ==
                                      FilterStatus.cancel) {
                                    filterStatus = FilterStatus.cancel;
                                    _alignment = Alignment.centerRight;
                                  }
                                },
                              );
                            },
                            child: Center(
                              child: Text(filterStatus.name),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text(filterStatus.name)),
                  ),
                ),
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: schedules.length,
                itemBuilder: (context, index) {
                  var _schedule = schedules[index];
                  bool isLastElement = schedules.length + 1 == index;
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.grey,
                      ), // BorderSide
                      borderRadius: BorderRadius.circular(20),
                    ), // Rounded RectangleBorder
                    margin: !isLastElement
                        ? const EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage(_schedule['doctorProfile']),
                            ),
                            Config.spaceSmall,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _schedule['doctorName'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            )
                          ])
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
