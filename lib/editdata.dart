import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({required this.list, required this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  late TextEditingController controllerCode;
  late TextEditingController controllerName;
  late TextEditingController controllerPrice;
  late TextEditingController controllerStock;
  
  late TextEditingController controllerDiskon;


  void editData() {
    var url="http://localhost:8030/php-rest-api-praktikum-flutter/editdata.php";
    http.post(Uri.parse(url),body: {
      "id": widget.list[widget.index]['id'],
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text,
      "diskon": controllerDiskon.text
    });
  }


  @override
    void initState() {
      controllerCode= TextEditingController(text: widget.list[widget.index]['item_code'] );
      controllerName= TextEditingController(text: widget.list[widget.index]['item_name'] );
      controllerPrice= TextEditingController(text: widget.list[widget.index]['price'] );
      controllerStock= TextEditingController(text: widget.list[widget.index]['stock'] );
      controllerDiskon= TextEditingController(text: widget.list[widget.index]['diskon'] );
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EDIT DATA"),
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
                  decoration: const InputDecoration(
                      hintText: "Item Name", labelText: "Item Name"),
                ),
                TextField(
                  controller: controllerPrice,
                  decoration: const InputDecoration(
                      hintText: "Price", labelText: "Price"),
                ),
                TextField(
                  controller: controllerStock,
                  decoration: const InputDecoration(
                      hintText: "Stock", labelText: "Stock"),
                ),
                TextField(
                  controller: controllerDiskon,
                  decoration: const InputDecoration(
                      hintText: "Diskon", labelText: "Diskon"),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ElevatedButton(
                  child: Text("EDIT DATA"),
                  style:ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                  onPressed: () {
                    editData();
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
