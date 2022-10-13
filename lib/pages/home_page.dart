import 'package:flutter/material.dart';
import 'package:flutter2/widgets/drawer.dart';

class Homepage extends StatelessWidget {
  final int days = 30;

  final String name = "chavan Hari Sony";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                                                           //1
        title: Text("CatalogApp"),
      ),

      body: Center(
        child: Text("Hi $days shubham  $name  "),
      ),

      drawer: MyDrawer(),                                           //2
    );
  }
}
