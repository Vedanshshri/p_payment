import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:p_paycsv/csv/allcsv.dart';
import 'package:p_paycsv/csv/loadcsv.dart';
import 'package:p_paycsv/staticdata/data.dart';
import 'package:path_provider/path_provider.dart';

class Export extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    loadCsvFromStorage() async {
      FilePickerResult result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['csv'],
        type: FileType.custom,
      );
      String path = result.files.first.path;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return LoadCsvDataScreen(path: path);
          },
        ),
      );
    }

    generateCsv() async {
      List<List<String>> data = [
        [
          "Name.",
          "Mob-No.",
          "Date",
          "Prod-Type",
          "Amount",
          "Amo-Type",
        ],
      ];
      for (int i = 0; i < names.length; i++) {
        data.add([
          names[i],
          phones[i],
          dates[i],
          product_types[i],
          amounts[i],
          amount_types[i],
        ]);
      }
      String csvData = ListToCsvConverter().convert(data);
      final String directory = (await getApplicationSupportDirectory()).path;
      final path = "$directory/csv-${DateTime.now()}.csv";
      print(path);
      final File file = File(path);
      await file.writeAsString(csvData);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return LoadCsvDataScreen(path: path);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade900,
        title: Text("Export "),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "Export Data As CSV",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            RaisedButton(
              color: Colors.amber.shade500,
              elevation: 10,
              onPressed: () => loadCsvFromStorage(),
              child: Text("Load CSV From Storage"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            RaisedButton(
              color: Colors.amber.shade500,
              elevation: 10,
              onPressed: () => Navigator.pushNamed(context, "allcsv"),
              child: Text("Load All CSV Form Phone Storage"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            RaisedButton(
              color: Colors.amber.shade500,
              elevation: 10,
              onPressed: () {
                generateCsv();
                print("Export");
              },
              child: Text("Export"),
            )
          ],
        ),
      ),
    );
  }
}
