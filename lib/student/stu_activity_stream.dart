import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:virtulab/functions/Student/class_stu_activity_stream.dart';
import 'studentNavBar.dart';

class MainStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // StudentNavBar();
    return MaterialApp(title: 'Student', home: StudentNavBar());
  }
}

class ActivityStream extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ActivityStream();
  }
}

class _ActivityStream extends State<ActivityStream> {
  Query courseTitle;
  Query insName;
  @override
  void initState() {
    super.initState();
    courseTitle =
        FirebaseDatabase.instance.reference().child('course').child('name');
    insName = FirebaseDatabase.instance
        .reference()
        .child('instructor')
        .child('fname' + ' ' + 'lname');
  }

//CONNECTED TO FIREBASE
  Widget _asListFirebase({Map list}) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(children: <Widget>[
              ListTile(
                title: Text(
                  list['name'],
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 2,
                      color: Colors.deepPurple),
                ),
                subtitle: Text(
                  list['name'] + '\n' + list['name'],
                  style: TextStyle(height: 1.5, fontStyle: FontStyle.italic),
                ),
                trailing: Text('Date'),
                leading: Icon(
                  Icons.campaign_sharp,
                  size: 30,
                ),
                isThreeLine: true,
              ),
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Activity Stream'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: courseTitle,
          defaultChild: Center(child:CircularProgressIndicator()),
          itemBuilder: (BuildContext context, snapshot,
              Animation<double> animation, int index) {
            Map _courses = snapshot.value;
            _courses['key'] = snapshot.key;
            return _asListFirebase(list: _courses);
          },
        ),
      ),
    );
  }
}
