import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter2/models/catalog.dart';
import 'package:flutter2/widgets/drawer.dart';
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
                  CatelogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
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

class Catelogheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catelog App".text.xl3.bold.color(MyTheme.creameColor1).make(),
        "TrandingProducts".text.make(),
      ],
    );
  }
}

class CatelogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatelogItem(
          catelog: catalog,
          key: Key("value"),
        );
      },
    );
  }
}

class CatelogItem extends StatelessWidget {
  final Item catelog;

  const CatelogItem({required Key key, required this.catelog})
      : assert(catelog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: catelog.image,
            key: Key("value"),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catelog.name.text.lg.color(MyTheme.creameColor1).bold.make(),
              catelog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catelog.price}".text.bold.xl.make(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyTheme.creameColor1),
                          shape: MaterialStateProperty.all(StadiumBorder(),)),
                      child: "Buy".text.make())
                ],
              ).positioned(right: 8),
            ],
          ))
        ],
      ),
    ).white.roundedLg.square(150).make().py12();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({required Key key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.roundedLg.p8.color(MyTheme.creameColor).make().p16().w40(context);
  }
}
