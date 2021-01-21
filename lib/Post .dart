import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectpu2021/Rounded_Button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  dynamic _image;

  String title;
  String detail;
  TextEditingController headline = TextEditingController();
  TextEditingController information = TextEditingController();

  Future<void> dialogbox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Make a Choice'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      openCamera(context);
                    },
                    child: Text('Camera'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      openGallery(context);
                    },
                    child: Text('Gallery'),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future openCamera(BuildContext context) async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    print(image.path);
    setState(() {
      _image = image;
    });
    Navigator.of(context).pop();
  }

  Future openGallery(BuildContext context) async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Padding(
          padding: EdgeInsets.fromLTRB(20, 35, 20, 10),
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.post_add_rounded,
                          size: 50.0,
                        ),
                        Text(
                          'POST',
                          style: GoogleFonts.doHyeon(
                              color: Color(0xff0E47A1),
                              fontSize: 50.0,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: GoogleFonts.montserrat(fontSize: 25.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: headline,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff0E47A1), width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff0E47A1), width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: 'Enter Title'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Detail',
                          style: GoogleFonts.montserrat(fontSize: 25.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      controller: information,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff0E47A1), width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff0E47A1), width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: 'Enter Detail'),
                      maxLines: 10,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Choose Image :   ',
                          style: GoogleFonts.montserrat(fontSize: 25.0),
                        ),
                        GestureDetector(
                            onTap: () {
                              dialogbox(context);
                            },
                            child: Icon(
                              Icons.add_a_photo,
                              size: 40.0,
                              color: Colors.blue[800],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButton(
                          str: 'SUBMIT',
                          onpress: () {
                            FirebaseStorage storage = FirebaseStorage.instance;
                            Reference ref = storage
                                .ref()
                                .child("file" + DateTime.now().toString());
                            UploadTask uploadTask = ref.putFile(_image);

                            FirebaseFirestore.instance
                                .collection('Details')
                                .doc()
                                .set({
                              'title': headline.text,
                              'subtitle': information.text,
                              'link': _image.path,
                            });
                          },
                          Colour: Color(0xff0E47A1),
                        ),
                      ],
                    )
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     RaisedButton(
                    //       elevation: 5.0,
                    //       splashColor: Colors.blueAccent,
                    //       color: Color(0xff0E47A1),
                    //       child: Text(
                    //         'SUBMIT',
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //       onPressed: () {},
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
