import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter2/models/catalog.dart';
import 'package:flutter2/utils/routes.dart';

// import 'package:flutter2/pages/home_wedgets/catalog_header.dart';
// import 'package:flutter2/pages/home_wedgets/catalog_list.dart';
import 'package:flutter2/widgets/drawer.dart';
import 'package:flutter2/widgets/home_wedgets/catalog_header.dart';
import 'package:flutter2/widgets/home_wedgets/catalog_list.dart';
import 'package:flutter2/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter2/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
        backgroundColor: MyTheme.creameColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () =>Navigator.pushNamed(context,MyRoutes.cartRoute),
          backgroundColor: Colors.orange,
          child: Icon(CupertinoIcons.cart),
        ),

        // appBar: AppBar(
        //   //1
        //   title: Text("CatalogApp"),
        // ),

        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Catelogheader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatelogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        )

        //Padding(
        //   padding: const EdgeInsets.all(1.0),
        //   child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        //       ? GridView.builder(
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2,
        //             mainAxisSpacing: 20,
        //             crossAxisSpacing: 20,
        //           ),
        //           itemBuilder: (context, index) {
        //             final item = CatalogModel.items[index];
        //             return Card(
        //                 clipBehavior: Clip.antiAlias,
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(15)),
        //                 child: GridTile(
        //                   header: Container(
        //                     child: Text(
        //                       item.name,
        //                       style: TextStyle(color: Colors.white),
        //                     ),
        //                     padding: const EdgeInsets.all(12),
        //                     decoration: BoxDecoration(
        //                       color: Colors.deepPurpleAccent,
        //                     ),
        //                   ),
        //                   child: Image.network(
        //                     item.image,
        //                     fit: BoxFit.cover,
        //                   ),
        //
        //                   footer: Container(
        //                     child: Text(
        //                       item.price.toString(),
        //                       style: TextStyle(color: Colors.white),
        //                     ),
        //                     padding: const EdgeInsets.all(12),
        //                     decoration: BoxDecoration(
        //                       color: Colors.pinkAccent,
        //                     ),
        //                   ),
        //                 ));
        //           },
        //           itemCount: CatalogModel.items.length,
        //         )
        //
        //       // ListView.builder(
        //       //     itemBuilder: (context, index) {
        //       //       return ItemWidget(
        //       //         item: CatalogModel.items[index],
        //       //         key: Key("value"),
        //       //       );
        //       //     },
        //       //   )
        //       : Center(
        //           child: CircularProgressIndicator(),
        //         ),
        //
        // ),

        );
  }
}
