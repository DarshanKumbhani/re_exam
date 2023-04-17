import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'homescreen.dart';
import 'model.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtnumber = TextEditingController();
  var txtkey = GlobalKey<FormState>();
  String? path;
  @override
  Widget build(BuildContext context) {
    return Form(
      onWillPop: back,
      key: txtkey,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Add student",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xff3E98E4)),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black12),
                    child: path == null
                        ? CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      backgroundImage:
                      AssetImage("aseets/Images/1.jpeg"),
                    )
                        : CircleAvatar(
                      backgroundImage: FileImage(File("$path")),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        ImagePicker picker = ImagePicker();
                        XFile? photo =
                        await picker.pickImage(source: ImageSource.camera);
                        setState(() {
                          path = photo!.path;
                        });
                      },
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    InkWell(
                      onTap: () async {
                        ImagePicker picker = ImagePicker();
                        XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          path = image!.path;
                        });
                      },
                      child: Icon(
                        Icons.photo_album,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter your name";
                      }
                    },
                    style: TextStyle(color: Colors.black),
                    controller: txtname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff3E98E4), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff3E98E4), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Color(0xff3E98E4)),
                      ),
                      label: Text("name",
                          style: TextStyle(color: Color(0xff3E98E4))),
                      suffixIcon: Icon(
                        Icons.person_add_alt,
                        color: Color(0xff3E98E4),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(

                    style: TextStyle(color: Colors.black),
                    controller: txtnumber,
                    keyboardType:TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff3E98E4), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Color(0xff3E98E4)),
                      ),
                      label:
                      Text("gr id", style: TextStyle(color: Color(0xff3E98E4))),
                      suffixIcon: Icon(
                        Icons.call,
                        color: Color(0xff3E98E4),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (txtkey.currentState!.validate()) {
                        String name = txtname.text;
                        String number = txtnumber.text;

                        Info c1 = Info(name: name, number: number,image: path);
                        Studentlist.add(c1);

                        Navigator.pop(context);
                      }
                    },
                    child: Text("Add Student")),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 60,
            color: Colors.indigo.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/');
                    },
                    child: Icon(Icons.star,size: 30,)),
                Icon(Icons.person_add,size: 30,), InkWell(


            ),
          ],
          ),

        ),
          backgroundColor: Color(0xffFFFCDD),
      ),
    ),
    );
  }

  void ExitDilog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Exit!"),
              content: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: Text(
                      "Yes",
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "No",
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  )
                ],
              ));
        });
  }

  Future<bool> back() async {
    ExitDilog();
    return await false;
  }
}
