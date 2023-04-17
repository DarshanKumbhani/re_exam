import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model.dart';

List<Info> Studentlist = [

  Info(
    name: "sankhat",
    number: "2323",
  ),
  Info(
    name: "kaushik",
    number: "1111",
  ),
  Info(
    name: "vivek",
    number: "2343",
  ),
  Info(
    name: "bhargav",
    number: "2323",
  ),
  Info(
    name: "kaushik",
    number: "3232",
  ),
  Info(
    name: "Raju",
    number: "5676",
  ),
  Info(
    name: "khushi",
    number: "1232",
  ),
  Info(
    name: "yash",
    number: "0000",
  ),
  Info(
    name: "krunal",
    number: "3434",
  ),
  Info(
    name: "dixit",
    number: "9898",
  ),

];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtgrid = TextEditingController();
  var txtkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                color: Color(0xffFFFCDD),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Center(
                        child: Text(
                          "Student list",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3E98E4),
                              fontSize: 30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 280),
                      child: Text(
                        "Student list",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3E98E4)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Contacttile(
                      index,
                      Studentlist[index],
                    );
                  },
                  itemCount: Studentlist.length,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          bottomNavigationBar: Container(
            height: 60,
            width: double.infinity,
            color: Color(0xffD9D9D9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.star,
                  size: 30,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "add").then((value) {
                        setState(() {});
                      });
                    },
                    child: Icon(
                      Icons.person_add,
                      size: 30,
                    )),

              ],
            ),
          ),
          backgroundColor: Color(0xffFFFCDD),

        ));
  }

  Widget Contacttile(int index, Info c1) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text("${c1.name}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xff3E98E4))),
        subtitle: Text(
          "${c1.number}",
          style: TextStyle(color: Color(0xff3E98E4), fontSize: 15),
        ),
        leading: (c1.image == null)
            ? CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("assets/Images/1.jpeg"),
        )
            : CircleAvatar(
          backgroundImage: FileImage(File("${c1.image}")),
        ),
        trailing: Icon(
          Icons.person_add,
          color: Color(0xff3E98E4),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    Studentlist.removeAt(index);
                  });
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
              IconButton(
                onPressed: () {
                  txtname = TextEditingController(text: c1.name);
                  txtgrid = TextEditingController(text: c1.number);

                  upDialogue(index);
                },
                icon: Icon(Icons.edit),
                color: Colors.green.shade300,
              ),
           ],
          )
        ],
      ),
    );
  }

  void upDialogue(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter your name";
                  }
                },
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
                  label: Text("First name",
                      style: TextStyle(color: Color(0xff3E98E4))),
                  suffixIcon: Icon(
                    Icons.person_add_alt,
                    color: Color(0xff3E98E4),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value?.length != 10) {
                    return "Please Enter 10 Number";
                  }
                },
                controller: txtgrid,
                keyboardType: TextInputType.number,
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
                  label: Text("Number",
                      style: TextStyle(color: Color(0xff3E98E4))),
                  suffixIcon: Icon(
                    Icons.call,
                    color: Color(0xff3E98E4),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (txtkey.currentState!.validate()) {
                      String Nname = txtname.text;
                      String Nnumber = txtgrid.text;

                      setState(() {
                        Studentlist[index] =
                            Info(name: Nname, number: Nnumber);
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Update"))
            ],
          ),
        );
      },
    );
  }
}
