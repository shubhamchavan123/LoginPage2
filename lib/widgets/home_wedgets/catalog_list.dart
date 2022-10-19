import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/models/cart.dart';
import 'package:flutter2/models/catalog.dart';
import 'package:flutter2/pages/home_details_page.dart';
import 'package:flutter2/pages/home_page.dart';

// import 'package:flutter2/pages/home_wedgets/catalog_image.dart';
import 'package:flutter2/widgets/home_wedgets/catalog_image.dart';
import 'package:flutter2/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDatailPage(
                key: Key("value"),
                catalog: catalog,
              ),
            ),
          ),
          child: CatelogItem(
            catelog: catalog,
            key: Key("value"),
          ),
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
          Hero(
            tag: Key(catelog.id.toString()),
            child: CatalogImage(
              image: catelog.image,
              key: Key("value"),
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catelog.name.text.lg.color(context.accentColor).bold.make(),
              catelog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catelog.price}".text.bold.xl.make(),
                  _AddToCart(catelog:catelog)
                ],
              ).positioned(right: 8),
            ],
          ))
        ],
      ),
    ).black.roundedLg.square(150).make().py12();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catelog;

  const _AddToCart({
    Key? key, required this.catelog,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {

     bool isAdded=false;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {

        isAdded=isAdded.toggle();
         final _catalog=CatalogModel();
        final _cart =CartModel();
        _cart.catalog=_catalog;
        _cart.add(widget.catelog);
        setState(() {

        });
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child:isAdded?Icon(Icons.done): "Add To Cart".text.make(),
    );
  }
}
