import 'package:flutter/material.dart';
import 'package:flutter2/widgets/drawer.dart';

class Homepage2 extends StatelessWidget {
  int get days => 30;

  final String name = "chavan Hari Sony";

  @override
  Widget build(BuildContext context) {
    // final imgeUrl =
    //     "https://www.pandasecurity.com/en/mediacenter/src/uploads/2019/07/pandasecurity-How-do-hackers-pick-their-targets.jpg";
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.amber,
            child: IconButton(
                color: Colors.black,
                padding: const EdgeInsets.all(12),
                iconSize: 50,
                icon: Image.asset(
                  "",
                ),
                onPressed: () {
                  // do something
                }),
          ),

          // IconButton(
          //
          //
          //   icon: Image.asset(
          //     "assets/images/login_img.png",
          //   ),
          //   onPressed: () {},
          // ),
        ],
        backgroundColor: Colors.deepOrange,

        // leading: Row(
        //   children: [
        //     Padding(
        //       padding:  EdgeInsets.only(left: 280),
        //       child: Image.asset("assets/images/login_img.png",
        //       ),
        //     ),
        //   ],
        // ),
        title: Text("Notification"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            Container(
              color: Colors.orange,
              child: ListTile(
                  title: Text("Shubham Chavan"),
                  subtitle: Text("Started following you.."),
                  trailing: Icon(Icons.more_vert),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.pandasecurity.com/en/mediacenter/src/uploads/2019/07/pandasecurity-How-do-hackers-pick-their-targets.jpg'),
                    backgroundColor: Colors.white,
                    radius: 80,
                  )),

              //
              // leading: Image(
              //   image: AssetImage('assets/images/login_img.png'),
              //   width: 80.0,
              //   height: 80.0,
              //
              // ),
              //
              //  ===============================================================================================

              //  ===============================================================================================
              // leading: new CircleAvatar(
              //   radius: 50,
              //
              //   backgroundImage:AssetImage('assets/images/login_img.png',),
              // ),
              //  ===============================================================================================

              // leading: new CircleAvatar(
              //
              //    backgroundColor: Colors.white,
              //   // child: Image.network("https://www.pandasecurity.com/en/mediacenter/src/uploads/2019/07/pandasecurity-How-do-hackers-pick-their-targets.jpg")
              //   child: new Image.asset('assets/images/login_img.png',width: 32.0,
              //     height: 35.0,),
              // ),
              //  ===============================================================================================
              // currentAccountPicture: CircleAvatar(
              //   backgroundImage: NetworkImage(imgeUrl),
            ),

            // SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Container(
                color: Colors.orange,
                child: ListTile(
                    title: Text("Shubham Chavan"),
                    subtitle: Text("Started following you.."),
                    trailing: Icon(Icons.more_vert),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://tse2.mm.bing.net/th?id=OIP.ej7D31qHOyaEBAdlBpaxFwHaFj&pid=Api&P=0'),
                      backgroundColor: Colors.white,
                      radius: 80,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
