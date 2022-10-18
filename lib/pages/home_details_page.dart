import 'package:flutter/material.dart';
import 'package:flutter2/models/catalog.dart';
import 'package:flutter2/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDatailPage extends StatelessWidget {
  final Item catalog;

  const HomeDatailPage({required Key key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color.fromARGB(110, 100, 150, 220),
      bottomNavigationBar: Container(

        color: Colors.blue,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red400.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyTheme.creameColor1),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  )),
              child: "Add to Cart".text.make(),
            ).wh(130, 40),
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.grey,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(MyTheme.creameColor1)
                        .bold
                        .make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                    "kgjgffgdjksgfkdjhgfhdgfjagfjs lor hdhhdh hhfhfhhfhfhfhhhhhh"
                        .text
                        .textStyle(context.captionStyle)
                        .make().p1()

                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
