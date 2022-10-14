import 'package:flutter/material.dart';
import 'package:flutter2/models/catalog.dart';
import 'package:flutter2/widgets/drawer.dart';
import 'package:flutter2/widgets/item_widget.dart';

class Homepage extends StatelessWidget {
  final int days = 30;

  final String name = "chavan Hari Sony";

  @override
  Widget build(BuildContext context) {
    final dummyList=List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        //1
        title: Text("CatalogApp"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
              key:Key("value"),
            );
          },
        ),
      ),

      drawer: MyDrawer(), //2
    );
  }
}
