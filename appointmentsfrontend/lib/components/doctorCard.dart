import 'package:appointmentsfrontend/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatefulWidget {
  const DoctorCard({super.key});

  @override
  State<DoctorCard> createState() => _DoctorCard();
}

class _DoctorCard extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: Config.widthSize * .33,
                child: Image.asset(
                  'assets/google.png',
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Dr hessah',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Dental',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Text('4.5'),
                          Spacer(
                            flex: 1,
                          ),
                          Text('Reviews'),
                          Spacer(
                            flex: 1,
                          ),
                          Text('(20)'),
                          Spacer(
                            flex: 7,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
