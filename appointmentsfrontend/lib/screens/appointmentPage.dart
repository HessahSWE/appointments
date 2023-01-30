import 'dart:ffi';

import 'package:appointmentsfrontend/components/scheduleCard.dart';
import 'package:appointmentsfrontend/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPage();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPage extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      'doctorName': 'Hessah Fahad',
      'doctorProfile': 'assets/google.png',
      'category': 'Dental',
      'status': FilterStatus.upcoming,
    },
    {
      'doctorName': 'Sara Fahad',
      'doctorProfile': 'assets/google.png',
      'category': 'Dental',
      'status': FilterStatus.complete,
    },
    {
      'doctorName': 'Nora Fahad',
      'doctorProfile': 'assets/google.png',
      'category': 'Dental',
      'status': FilterStatus.upcoming,
    },
    {
      'doctorName': 'Asms Fahad',
      'doctorProfile': 'assets/google.png',
      'category': 'Dental',
      'status': FilterStatus.cancel,
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedules) {
      // switch (schedules['status']) {
      //   case 'upcoming':
      //     schedules['status'] = FilterStatus.upcoming;
      //     break;
      //   case 'complete':
      //     schedules['status'] = FilterStatus.complete;
      //     break;
      //   case 'cancel':
      //     schedules['status'] = FilterStatus.cancel;
      //     break;
      // }
      return schedules['status'] == status;
    }).toList();
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
                                  print('dddddddd');
                                  print(filterStatus);

                                  if (filterStatus == FilterStatus.upcoming) {
                                    status = FilterStatus.upcoming;
                                    _alignment = Alignment.centerLeft;
                                    print('eee');
                                    print(status);
                                    print(filterStatus);
                                  } else if (filterStatus ==
                                      FilterStatus.complete) {
                                    status = FilterStatus.complete;
                                    _alignment = Alignment.center;
                                    print('www');
                                    print(status);
                                    print(filterStatus);
                                  } else if (filterStatus ==
                                      FilterStatus.cancel) {
                                    status = FilterStatus.cancel;
                                    _alignment = Alignment.centerRight;
                                    print('ooo');
                                    print(status);
                                    print(filterStatus);
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
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text(status.name)),
                  ),
                ),
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: (context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
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
                          Row(
                            children: [
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
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _schedule['category'],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Config.space,
                          const ScheduleCard(),
                          Config.space,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                  onPressed: () {},
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Config.primaryColor),
                                  onPressed: () {},
                                  child: const Text(
                                    'Reschedule',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
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
