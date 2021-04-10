import 'package:flutter/material.dart';
import 'package:virtulab/functions/Student/class_course_contents.dart';
import 'package:virtulab/student/stu_caseStudies_list.dart';
import 'package:virtulab/student/stu_course_contents.dart';
import 'package:virtulab/widgets/back_button.dart';

// import './studentNavBar.dart';

class CaseStudyView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CaseStudyView();
  }
}

_showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
      child: Text('Cancel'),
      onPressed: () => Navigator.of(context, rootNavigator: true).pop());
  Widget submitButton = FlatButton(
    child: Text('Submit'),
    onPressed: () {
      // Navigator.of(context, rootNavigator: true)
      //     .push(MaterialPageRoute(builder: (context) => CaseStudiesList()));
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text('Alert'),
    content: Text('Are you sure you want to submit?'),
    actions: [
      cancelButton,
      submitButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    // barrierDismissible: false,
    builder: (BuildContext cxt) {
      return alert;
    },
  );
}

class _CaseStudyView extends State<CaseStudyView> {
  final _formKey = GlobalKey<FormState>(); //for validation
  final questionAnsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
        //WillPopScope(
        // onWillPop: () async => submitCaseStudy(context),
        // child:
        Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Case Study 1'), //Temp data
              backgroundColor: Colors.deepPurple,
            ),
            body: Container(
                // height: double.infinity,
                //  width: double.infinity,
                padding: EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: ListView(children: <Widget>[
                    Text(
                      'Case Study Title', //Temp data
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 2,
                          color: Colors.deepPurple),
                    ),
                    Divider(),
                    Text(
                      'Description:',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        //Temp data
                        textAlign: TextAlign.left,
                        maxLines: null,
                      ),
                    ),
                    Text(
                      'Case Study:',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        //Temp data
                        textAlign: TextAlign.left,
                        maxLines: null,
                      ),
                    ),
                    Divider(),
                    Text(
                      'Questions:',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '- ' + 'Question',
                              //Temp data
                              textAlign: TextAlign.left,
                              maxLines: null,
                            ),
                          ],
                        )),
                    Container(
                      height: 100,
                      child: TextFormField(
                        controller: questionAnsController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Write Your Answer Here',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Answer All Questions';
                          }
                          return null;
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: <Widget>[
                                  FloatingActionButton.extended(
                                    onPressed: () {
                                      _showAlertDialog(context);
                                    },
                                    label: Text(
                                      "Submit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    backgroundColor: Colors.amber,
                                  ),
                                ],
                              ))),
                    ),
                  ]

                      // Add TextFormFields and ElevatedButton here.

                      ),
                ))
            //)
            );
  }
}
