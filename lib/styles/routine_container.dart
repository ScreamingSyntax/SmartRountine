import 'package:flutter/material.dart';

import '../themes/my_themes.dart';

class MyContainerRoutine extends Container {
  late String ratingNumber;

  final List<String> ratingDesc = [
    "Very Dissatisfied",
    "Dissatisfied",
    "Neutral",
    "Satisfied",
    "Very Satisfied"
  ];

  MyContainerRoutine(
      {super.key,
      required String ongoingClass,
      required String subject,
      required String teacherName,
      required String classType,
      required String className,
      required String time,
      required ratingNumber})
      : super(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Colors.black, blurRadius: 0.1)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(13),
                leading: Image.asset("assets/images/splash5.png"),
                title: Text(ongoingClass,
                    style: TextStyle(
                        color: MyThemes.bluishColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                subtitle: Text(subject),
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.assignment,
                    color: MyThemes.bluishColor,
                  ),
                  label: Text(
                    teacherName,
                    style: TextStyle(color: MyThemes.bluishColor, fontSize: 15),
                  )),
              TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.class_,
                    color: MyThemes.bluishColor,
                  ),
                  label: Text(
                    classType,
                    style: TextStyle(color: MyThemes.bluishColor, fontSize: 15),
                  )),
              TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.timelapse,
                    color: MyThemes.bluishColor,
                  ),
                  label: Text(
                    time,
                    style: TextStyle(color: MyThemes.bluishColor, fontSize: 15),
                  )),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                width: 10,
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        );
}
