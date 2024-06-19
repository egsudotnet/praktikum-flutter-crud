import 'package:flutter/material.dart';
import 'package:flutter_crud/main.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerStock = TextEditingController();
  
  TextEditingController controllerDiskon = TextEditingController();

  void addData() {
    var url =
        "http://localhost:8030/php-rest-api-praktikum-flutter/adddata.php";

    http.post(Uri.parse(url), body: {
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text,
      "diskon": controllerDiskon.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: controllerCode,
                  decoration: const InputDecoration(
                      hintText: "Item Code", labelText: "Item Code"),
                ),
                TextField(
                  controller: controllerName,
                  decoration: InputDecoration(
                      hintText: "Item Name", labelText: "Item Name"),
                ),
                TextField(
                  controller: controllerPrice,
                  decoration:
                      InputDecoration(hintText: "Price", labelText: "Price"),
                ),
                TextField(
                  controller: controllerStock,
                  decoration:
                      InputDecoration(hintText: "Stock", labelText: "Stock"),
                ),
                TextField(
                  controller: controllerDiskon,
                  decoration:
                      InputDecoration(hintText: "Diskon", labelText: "Diskon"),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                ElevatedButton(
                  child: Text(
                    "ADD DATA",
                    style: const TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
                    
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context)=>const Home()
                      )
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
