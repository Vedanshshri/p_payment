import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:p_paycsv/staticdata/data.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  String amount_type = 'Online';
  String product_type = 'Product';
  File _image;
  final picker = ImagePicker();
  String name;
  String phone;
  String date = " ";
  String amount;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    //   Directory appDocDir = await getApplicationDocumentsDirectory();
    //   String appDocPath = appDocDir.path;
//    final savedImage = await imageFile.copy('${appDocDir.path}/$fileName');
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    // final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        date = "${picked.day}-${picked.month}-${picked.year}";
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade900,
        title: Text("Add Data Form"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Card(
              elevation: 5,
              shadowColor: Colors.amber.shade200,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    " Name ",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    onChanged: (e) {
                      name = e;
                    },
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Card(
              elevation: 5,
              shadowColor: Colors.amber.shade200,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    " Mobile Number ",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    onChanged: (e) {
                      phone = e;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                  elevation: 5,
                  shadowColor: Colors.amber.shade200,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          " Product Type ",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: product_type,
                            icon: Icon(
                              Icons.arrow_downward_outlined,
                              color: Colors.deepPurple,
                            ),
                            iconSize: 30,
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                product_type = newValue;
                              });
                            },
                            items: <String>['Product', 'Service']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )
                      ])),
            ),
            Card(
              elevation: 5,
              shadowColor: Colors.amber.shade200,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    " Amount ",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (e) {
                      amount = e;
                    },
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                  elevation: 5,
                  shadowColor: Colors.amber.shade200,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          " Amount Type ",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: amount_type,
                            icon: const Icon(
                              Icons.arrow_downward_outlined,
                              color: Colors.deepPurple,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                amount_type = newValue;
                              });
                            },
                            items: <String>['Online', 'Cash', 'Gpay', 'Paytm']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )
                      ])),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 5,
                shadowColor: Colors.amber.shade200,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      " Date ",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      date.isNotEmpty ? date : "No date Selected ",
                      style: TextStyle(fontSize: 30),
                    ),
                    RaisedButton(
                      onPressed: () => _selectDate(context),
                      child: Text("Select A Different Date"),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 5,
                shadowColor: Colors.amber.shade200,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      " Photo ",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    RaisedButton(
                      onPressed: () => getImage(),
                      child: Text('Upload Image'),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            RaisedButton(
              color: Colors.amber.shade500,
              onPressed: () {
                if (name.isNotEmpty &&
                    phone.isNotEmpty &&
                    product_type.isNotEmpty &&
                    amount.isNotEmpty &&
                    amount_type.isNotEmpty &&
                    _image != null &&
                    date.isNotEmpty) {
                  names.add(name);
                  phones.add(phone);
                  product_types.add(product_type);
                  amounts.add(amount);
                  amount_types.add(amount_type);
                  dates.add(date);
                  images.add(_image);
                  //entries.add(e);
                  print("Done");
                  print(date);
                  Navigator.pushNamed(context, "home");
                } else {
                  print("Error");
                }
                // print(entries);
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
