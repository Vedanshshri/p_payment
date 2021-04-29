import 'package:flutter/material.dart';
import 'package:p_paycsv/staticdata/data.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // List names;
  // List dates;
  // List phones;
  //// List amount;
//  List images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('asset/icon.png'),
        backgroundColor: Colors.amber.shade900,
        title: Text("Payments App"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.amberAccent.shade700,
            heroTag: "add-button",
            onPressed: () => Navigator.pushNamed(context, "add_form"),
            child: Text(
              "Add",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.04,
          ),
          FloatingActionButton(
            backgroundColor: Colors.amberAccent.shade700,
            heroTag: "export-button",
            onPressed: () => Navigator.pushNamed(context, "export"),
            child: Text(
              "Export",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: names.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shadowColor: Colors.amber.shade900,
            elevation: 10,
            child: Container(
              height: 100,
              color: Colors.amber.shade200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: images[index].toString().isNotEmpty
                        ? FileImage(images[index])
                        : Text("No Image"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Name:${names[index]}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Mobile No.${phones[index]}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Date:${dates[index]}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Amount.${amounts[index]}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
