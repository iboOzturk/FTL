import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double genislik=MediaQuery.of(context).size.width;
    double uzunluk=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Profil'),),
      body: Container(
        width: genislik,height: uzunluk,
        color: Colors.lightBlueAccent,
        child: Column(
          children: [
            Expanded(flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,

                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
                ),
              ),
            ),
            Expanded(flex: 5,child: Container(
             color: Colors.yellow,
            )
            ),
          ],
        ),
      ),
    );
  }
}
