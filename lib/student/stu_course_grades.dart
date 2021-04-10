import 'package:flutter/material.dart';
import 'package:virtulab/functions/Student/class_stu_case_study_grade.dart';
import 'package:virtulab/functions/Student/class_stu_course.dart';

// import './studentNavBar.dart';

class CourseGrades extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CourseGrades();
  }
}

Widget _gradesList() {
  return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      child: Column(children: <Widget>[
        Align(
          //Listview
          alignment: Alignment.topCenter,
          child: Container(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: Text(
              'Total',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          )),
        ),
        Align(
          child: Container(
            height: 60,
            width: 160,
            margin: EdgeInsets.only(top: 0, left: 40, right: 40),
            decoration: new BoxDecoration(
              color: Colors.blue[50],
              borderRadius: new BorderRadius.all(Radius.elliptical(50, 50)),
            ),
            child: Center(
                child: Text(
              '20/20',
              style: TextStyle(
                fontSize: 23,
              ),
            )), //Temp data
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              Divider(thickness: 2),
              ListTile(
                title: Text(
                  'Case Study 1',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 2,
                      color: Colors.deepPurple),
                ),
                trailing: Text('20/20'),
              ),
              Divider(thickness: 2),
            ]))
      ]));
}

class _CourseGrades extends State<CourseGrades> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Course 1'), //Temp data
          backgroundColor: Colors.deepPurple,
        ),
        body: _gradesList());
  }
}
