import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:virtulab/change_password.dart';
import 'package:virtulab/instructor/inst_settings.dart';
import '../functions/auth.dart';
import '../main.dart';
import 'adminNavBar.dart';

dynamic callNavBar() {
  return AdminNavBar();
}

class AdminSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AdminSettings();
  }
}

class _AdminSettings extends State<AdminSettings> {
  Query _adminInfo;
  initState() {
    super.initState();

      getUserName();
    // _adminInfo =
    //     firebaseref.child('admin').child(_studID).orderByChild(_studID);
  }

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Admin Settings'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          color: Colors.grey.shade100,
          width: double.infinity,
          // height: MediaQuery.of(context).size.height * .38,
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      // margin: EdgeInsets.all(value),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      height: 140,
                      width: 130,
                      child: Icon(
                        Icons.account_circle_sharp,
                        size: 100,
                      )
                      // Image.asset(
                      //   "assets/images/profile_pic.png",
                      //   fit: BoxFit.fill,
                      // ),
                      ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          name1 +" "+ name2,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        getCurrentUserEmail(), //"maitha@gmail.com",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.contact_mail_outlined,
                        size: 25,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        getCurrentID(), //"101010",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                // elevation: 5,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ChangePassword()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(Icons.edit),
                        ),
                        Text(
                          'Change Password',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                // elevation: 5,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Icon(Icons.notifications_off),
                            ),
                            Text(
                              'Silence Notifications',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   width: 40,
                        // ),
                        
                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: Colors.grey.shade300,
                        //       borderRadius: BorderRadius.circular(50)),
                        //   child:
                        Switch(
                            value: isSwitched,
                            // activeColor: Colors.amber,
                            // activeTrackColor: Colors.amber,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            }),
                        // ),
                        
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                // elevation: 5,
                child: InkWell(
                  onTap: () {
                    signOut(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.exit_to_app,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          'Log Out',
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
