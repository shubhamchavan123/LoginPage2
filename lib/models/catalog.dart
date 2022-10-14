class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "iPhone12",
        desc: "ipone",
        price: 100,
        color: "#33505a",
        image: "https://pngimg.com/uploads/iphone/iphone_PNG5736.png")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
