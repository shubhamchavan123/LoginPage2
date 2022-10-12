import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            "assets/images/login_img.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
            child: Text("shubham"),
          ),
          Text(
            "Welcome",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [


                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter  UserName", labelText: "UserName"),
                ),



                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter  Password", labelText: "Password"),
                ),



                SizedBox(
                  height: 20,
                ),


                ElevatedButton(
                  child: Text("Login"),
                  style: TextButton.styleFrom(),
                  onPressed: () {
                    print("hello Hari");
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
