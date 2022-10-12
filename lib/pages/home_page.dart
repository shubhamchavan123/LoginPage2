import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final int days = 30;
  final String name = "chavan Hari Sony";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                                                                  //1
        title: Text("Shubham"),
      ),

      body: Center(
        child: Text("Hi $days shubham  $name  "),
      ),

      drawer: Drawer(),                                           //2
    );
  }
}
