import 'package:flutter/material.dart';
import 'package:routine_app/pages/days.dart';

import '../models/sections.dart';
import '../widgets/AppBar.dart';

class SectionSelection extends StatefulWidget {
  const SectionSelection({super.key});
  @override
  State<SectionSelection> createState() => _SectionSelectionState();
}

class _SectionSelectionState extends State<SectionSelection> {
  Section s1 = Section(sectionId: 1, sectionName: "L1C1", sectionStudents: 30);
  Section s2 = Section(sectionId: 2, sectionName: "L1C2", sectionStudents: 40);
  Section s3 = Section(sectionId: 3, sectionName: "L1C3", sectionStudents: 50);
  Section s4 = Section(sectionId: 4, sectionName: "L1C4", sectionStudents: 50);
  Section s5 = Section(sectionId: 5, sectionName: "L1C5", sectionStudents: 50);
  Section s6 = Section(sectionId: 6, sectionName: "L1C6", sectionStudents: 50);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Card(
                    child: ListTile(
                  leading: Text(s1.sectionName),
                  title: Text(s1.sectionName),
                  subtitle: Text("Total Students = ${s1.sectionStudents}"),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DaysPage(section: s1.sectionName),
                    ),
                  ),
                )),
                Card(
                  child: ListTile(
                    leading: Text(s2.sectionName),
                    title: Text(s2.sectionName),
                    subtitle: Text("Total Students = ${s2.sectionStudents}"),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DaysPage(section: s2.sectionName),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Text(s3.sectionName),
                    title: Text(s3.sectionName),
                    subtitle: Text("Total Students = ${s3.sectionStudents}"),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DaysPage(section: s3.sectionName),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Text(s4.sectionName),
                    title: Text(s4.sectionName),
                    subtitle: Text("Total Students = ${s4.sectionStudents}"),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DaysPage(section: s4.sectionName),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Text(s5.sectionName),
                    title: Text(s5.sectionName),
                    subtitle: Text("Total Students = ${s5.sectionStudents}"),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DaysPage(section: s5.sectionName),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
