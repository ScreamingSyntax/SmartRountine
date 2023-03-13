// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../styles/routine_container.dart';
import '../themes/my_themes.dart';

class RoutinePage extends StatefulWidget {
  final String days;
  final String section;
  final dynamic routineList;

  const RoutinePage({
    Key? key,
    required this.days,
    required this.section,
    required this.routineList,
  }) : super(key: key);

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoutineHeader(days: widget.days, section: widget.section),
              SizedBox(
                height: 30,
              ),
              RoutineListLogic(
                  day: widget.days,
                  section: widget.section,
                  routineList: widget.routineList)
            ],
          ),
        ),
      ),
    );
  }
}

class RoutineHeader extends StatelessWidget {
  final String days;
  final String section;
  const RoutineHeader({
    Key? key,
    required this.days,
    required this.section,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${section}",
            style: TextStyle(
                color: MyThemes.bluishColor,
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "${days}'s Routine ",
            style: TextStyle(
              color: MyThemes.bluishColor,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class RoutineListLogic extends StatelessWidget {
  final String day;
  final String section;
  final dynamic routineList;

  void stateChange() {}

  const RoutineListLogic(
      {super.key,
      required this.day,
      required this.section,
      required this.routineList});

  @override
  Widget build(BuildContext context) {
    String routine1TName = routineList[day]["Routine1"]["Teacher Name"];
    String routine1ClassType = routineList[day]["Routine1"]["Class-Type"];
    String routine1Class = routineList[day]["Routine1"]["Class"];
    String routine1Subject = routineList[day]["Routine1"]["Subject"];
    String routine1Time = routineList[day]["Routine1"]["Timing"];

    String routine2TName = routineList[day]["Routine2"]["Teacher Name"];
    String routine2ClassType = routineList[day]["Routine2"]["Class-Type"];
    String routine2Class = routineList[day]["Routine2"]["Class"];
    String routine2Subject = routineList[day]["Routine2"]["Subject"];
    String routine2Time = routineList[day]["Routine2"]["Timing"];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        children: [
          SizedBox(
              child: Column(children: [
            InkWell(
              child: MyContainerRoutine(
                ongoingClass: routine1Class,
                subject: routine1Subject,
                teacherName: routine1TName,
                classType: routine1ClassType,
                className: routine1Class,
                time: routine1Time,
                ratingNumber: "Test",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MyContainerRoutine(
                ongoingClass: routine2Class,
                subject: routine2Subject,
                teacherName: routine2TName,
                classType: routine2ClassType,
                className: routine2Class,
                time: routine2Time,
                ratingNumber: "test"),
          ])),
        ],
      ),
    );
  }
}
