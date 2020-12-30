import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectpu2021/Feed.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//void main() => runApp(MaterialApp(home: SignUp()));
enum Gender { male, female }
const Activecolor = Color.fromARGB(255, 255, 33, 33);
const Inactivecolor = Color(0xffffffff);
var oncolor = Colors.red;
const Offcolor = Colors.white;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool selected = true;
  Color oncolor = Colors.white;
  Color offcolor = Offcolor;
  Gender selectedGender;
  Color malecardcolor = Inactivecolor;
  Color femalecardcolor = Inactivecolor;
  void updatecolour(int gender) {
    if (gender == 1) {
      if (malecardcolor == Inactivecolor) {
        malecardcolor = Activecolor;
        femalecardcolor = Inactivecolor;
      } else {
        malecardcolor = Inactivecolor;
      }
    }
    if (gender == 2) {
      if (femalecardcolor == Inactivecolor) {
        femalecardcolor = Activecolor;
        malecardcolor = Inactivecolor;
      } else {
        femalecardcolor = Inactivecolor;
      }
    }
  }

  TextEditingController emailcon = TextEditingController();
  TextEditingController namecon = TextEditingController();
  TextEditingController enroll = TextEditingController();
  TextEditingController aadharcon = TextEditingController();
  TextEditingController addrcon = TextEditingController();
  TextEditingController districtcon = TextEditingController();
  TextEditingController statecon = TextEditingController();
  TextEditingController countrycon = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: FlatButton(
            onPressed: () {},
            child: Icon(Icons.arrow_back),
          ),
          title: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
//                  crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              width: 500,

                              //width: MediaQuery.of(context).size.width*0.1679,
                              child: TextField(
                                controller: namecon,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(16),
                                ),
                              ),
                            )),
                        SizedBox(height: 20.0),
                        Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              width: 500,

                              //width: MediaQuery.of(context).size.width*0.1679,
                              child: TextField(
                                controller: emailcon,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'E-Mail',
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(16),
                                ),
                              ),
                            )),
                        SizedBox(height: 20.0),
                        Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              width: 500,

                              //width: MediaQuery.of(context).size.width*0.1679,
                              child: TextField(
                                controller: enroll,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Enrollment number',
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(16),
                                ),
                              ),
                            )),
                        SizedBox(height: 30.0),
                        Padding(
                          padding: const EdgeInsets.only(right: 230.0),
                          child: Text(
                            'Gender',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 20.0),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      updatecolour(1);
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(50.0),
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                    child: Card(
                                      elevation: 0.0,
                                      color: malecardcolor,
                                      //shape: RoundedRectangleBorder(
                                      //borderRadius:
                                      //  BorderRadius.circular(100.0)),
                                      child: Image(
                                          image:
                                              AssetImage('images/male_2.png')),
                                    ),
                                  ),
                                )),
                            Container(
                              height: 100.0,
                              width: 1.0,
                              color: Colors.grey,
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    updatecolour(2);
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(50.0),
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: Card(
                                    elevation: 0.0,
                                    color: femalecardcolor,
                                    child: Image(
                                        image:
                                            AssetImage('images/female_2.png')),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              width: 500,

                              //width: MediaQuery.of(context).size.width*0.1679,
                              child: TextField(
                                controller: aadharcon,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'DEPARTMENT',
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(16),
                                ),
                              ),
                            )),
                        SizedBox(height: 20.0),
                        Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              width: 500,

                              //width: MediaQuery.of(context).size.width*0.1679,
                              child: TextField(
                                controller: addrcon,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Batch',
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(16),
                                ),
                              ),
                            )),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Container(
                                    //width: MediaQuery.of(context).size.width*0.1679,
                                    child: TextField(
                                      controller: districtcon,
                                      textAlign: TextAlign.left,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: 'DIV',
                                        hintStyle: TextStyle(fontSize: 16),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        filled: true,
                                        contentPadding: EdgeInsets.all(16),
                                      ),
                                    ),
                                  )),
                            ),
                            // VerticalDivider(
                            //   color: Colors.black,
                            // ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Container(
                                    //width: MediaQuery.of(context).size.width*0.1679,
                                    child: TextField(
                                      controller: statecon,
                                      textAlign: TextAlign.left,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: 'Year',
                                        hintStyle: TextStyle(fontSize: 16),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        filled: true,
                                        contentPadding: EdgeInsets.all(16),
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Container(
                                    width: 500,

                                    //width: MediaQuery.of(context).size.width*0.1679,
                                    child: TextField(
                                      controller: countrycon,
                                      textAlign: TextAlign.left,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: 'College',
                                        hintStyle: TextStyle(fontSize: 16),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        filled: true,
                                        contentPadding: EdgeInsets.all(16),
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            // Padding(
                            //   padding: const EdgeInsets.only(right: 190.0),
                            //   child: Text(
                            //     'Commodity Type',
                            //     textAlign: TextAlign.left,
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.w800,
                            //         fontSize: 20.0),
                            //   ),
                            // ),
                            // SizedBox(height: 10),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Container(
                                    width: 500,

                                    //width: MediaQuery.of(context).size.width*0.1679,
                                    child: TextField(
                                      controller: passwordcontroller,
                                      textAlign: TextAlign.left,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: 'password',
                                        hintStyle: TextStyle(fontSize: 16),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        filled: true,
                                        contentPadding: EdgeInsets.all(16),
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        CheckboxListTile(
                          value: timeDilation != 1.0,
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          onChanged: (bool value) {
                            setState(() {
                              timeDilation = value ? 3.0 : 1.0;
                            });
                          },
                          title: const Text(
                            "Do you allow to use all of the above information to be used for this App",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 15.0),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                            height: 50.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(30.0),
                              shadowColor: Colors.redAccent,
                              color: Color.fromARGB(255, 255, 33, 33),
                              elevation: 7.0,
                              child: FlatButton(
                                onPressed: () {
                                  print(emailcon.text);
                                  FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: emailcon.text,
                                          password: passwordcontroller.text);

                                  FirebaseFirestore.instance
                                      .collection('chandan').doc(enroll.text).set({
                                        'name': namecon.text,
                                      'email':emailcon.text,
                                      'enroll' : enroll.text
                                      });

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Feed()));
                                },
                                child: Center(
                                  child: Text(
                                    'DONE',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    )),
              ]),
        ));
  }
}
