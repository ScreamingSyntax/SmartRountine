import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:routine_app/pages/routine_page.dart';

import '../widgets/AppBar.dart';

class DaysPage extends StatefulWidget {
  final String section;
  const DaysPage({super.key, required this.section});

  @override
  State<DaysPage> createState() => _DaysPageState();
}

class _DaysPageState extends State<DaysPage> {
  dynamic decodedData;
  void initState() {
    super.initState();
    _loadJsonRoutine();
  }

  Future<void> _loadJsonRoutine() async {
    String routineJson =
        await rootBundle.loadString("assets/files/routine.json");
    decodedData = jsonDecode(routineJson);
    // String jsonString =
    //     await File("assets/files/L2C4Year2.json").readAsString();
    // dynamic jsonData = jsonDecode(jsonString);
  }

  List days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday"
  ];
  @override
  Widget build(BuildContext context) {
    String section = widget.section;
    // print(section);
    return Scaffold(
      appBar: MyAppbar(),
      body: Center(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            ListTile(
              leading: const Icon(
                Icons.sunny,
                color: Colors.yellow,
              ),
              title: Text(days[0]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RoutinePage(
                              days: days[0],
                              section: section,
                              routineList: decodedData,
                            )));
              },
            ),
            ListTile(
                leading: const Icon(
                  Icons.cloud,
                  color: Colors.lightBlue,
                ),
                title: Text(days[1]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RoutinePage(
                          days: days[1],
                          section: section,
                          routineList: decodedData,
                        ),
                      ));
                }),
            ListTile(
              leading: const Icon(
                Icons.alarm,
                color: Colors.red,
              ),
              title: Text(days[2]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RoutinePage(
                        days: days[2],
                        section: section,
                        routineList: decodedData,
                      ),
                    ));
              },
            ),
            ListTile(
                leading: const Icon(
                  Icons.computer,
                  color: Colors.black,
                ),
                title: Text(days[3]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RoutinePage(
                          days: days[3],
                          section: section,
                          routineList: decodedData,
                        ),
                      ));
                }),
            ListTile(
              leading: const Icon(
                Icons.language,
                color: Colors.deepOrangeAccent,
              ),
              title: Text(days[4]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RoutinePage(
                        days: days[4],
                        section: section,
                        routineList: decodedData,
                      ),
                    ));
              },
            ),
            ListTile(
                leading: const Icon(
                  Icons.sticky_note_2,
                  color: Colors.green,
                ),
                title: Text(days[5]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RoutinePage(
                          days: days[5],
                          section: section,
                          routineList: decodedData,
                        ),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
