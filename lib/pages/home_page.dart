import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter2/models/catalog.dart';
import 'package:flutter2/widgets/drawer.dart';
import 'package:flutter2/widgets/item_widget.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;

  final String name = "chavan Hari Sony";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    var catelogjson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catelogjson);

    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        //1
        title: Text("CatalogApp"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: CatalogModel.items[index],
                    key: Key("value"),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),

      drawer: MyDrawer(), //2
    );
  }
}
