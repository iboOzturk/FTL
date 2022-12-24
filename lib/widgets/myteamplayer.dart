import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import 'package:fantasysuperlig/Services/api_service.dart';

import '../Variables/global.dart' as global;
import 'dart:async';


class MyTeamPlayer extends StatelessWidget {
  const MyTeamPlayer({
    Key key,
    @required this.image,
    @required this.name,
    @required this.top,
    @required this.right,
    @required this.left,
    @required this.position,
    @required this.gideceksayfa,
    @required this.pozisyon,
    @required this.neresi,
    @required this.who,
    @required this.band,
    @required this.playerid,
  })  : assert(top > 0.0),
        super(key: key);
  final String image;
  final String name;
  final String position;
  final double top;
  final double right;
  final double left;
  final String gideceksayfa;
  final String pozisyon;
  final String neresi;
  final double band;
  final String who;
  final int playerid;


  ///0.6773399
  @override
  Widget build(BuildContext context) {

    //double fontBoyut=13;
    final double _height = MediaQuery.of(context).size.height;
    double height = 0.18181818 * (0.5000299 * _height);
    // double height = 0.18181818 * (0.5894399 * _height);
    return new Positioned(
      child: GestureDetector(
        onTap: (){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(backgroundColor: Colors.green.shade700,
                    title: Text(
                      name,style: TextStyle(
                        color: Colors.white
                    ),
                      textAlign: TextAlign.center,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(8.0))),
                    content: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.green.shade700,
                        ),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async{
                             /*   if(global.spareCaptain==playerid){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context){
                                        return AlertDialog(backgroundColor: Colors.red.shade700,
                                            title: Text(
                                              'Yedek Kaptan olan oyuncuyu Kaptan seçemezsin!',style: TextStyle(
                                                color: Colors.white
                                            ),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(8.0))),
                                            content: Container(
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade700,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () async{

                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Tamam",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),

                                                  ],
                                                ))); }
                                  );
                                } */
                               // else
                                  if(global.captain==playerid){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context){
                                        return AlertDialog(backgroundColor: Colors.orange.shade700,
                                            title: Text(
                                              'Bu oyuncu zaten Kaptan!',style: TextStyle(
                                                color: Colors.white
                                            ),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(8.0))),
                                            content: Container(
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.orange.shade700,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () async{

                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Tamam",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),

                                                  ],
                                                ))); }
                                  );
                                }
                                else {
                                  await selectCaptains(0, playerid);
                                  //getCaptains(global.userid);
                                  getCaptains();
                                  Navigator.pushNamed(context, '/deneme2');
                                }

                                //Navigator.pop(context);
                                //Navigator.pop(context);
                              },
                              child: Text(
                                "Kaptan Seç",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                           /* SizedBox(height: 10,),
                            GestureDetector(
                              onTap: () async{
                                if(global.captain==playerid){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context){
                                        return AlertDialog(backgroundColor: Colors.red.shade700,
                                            title: Text(
                                              'Kaptan olan oyuncuyu Yedek Kaptan seçemezsin!',style: TextStyle(
                                                color: Colors.white
                                            ),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(8.0))),
                                            content: Container(
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade700,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () async{

                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Tamam",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),

                                                  ],
                                                ))); }
                                  );
                                }
                                else if(global.spareCaptain==playerid){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context){
                                        return AlertDialog(backgroundColor: Colors.orange.shade700,
                                            title: Text(
                                              'Bu oyuncu zaten Yardımcı Kaptan!',style: TextStyle(
                                                color: Colors.white
                                            ),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(8.0))),
                                            content: Container(
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.orange.shade700,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () async{

                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Tamam",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),

                                                  ],
                                                ))); }
                                  );
                                }
                                else {
                                  await selectCaptains(1 , playerid);
                                  //getCaptains(global.userid);
                                  getCaptains();
                                  Navigator.pushNamed(context, '/deneme2');
                                }


                                //Navigator.pop(context);
                              },
                              child: Text(
                                "Yedek Kaptan seç",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ), */
                            SizedBox(height: 10,),
                            GestureDetector(
                              onTap: () {
                               // Navigator.pushNamed(context, '/substitute');

                                //Navigator.pop(context);
                              },
                              child: Text(
                                "Oyuncu Değiştir",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ))); }
          );
        //  Navigator.pushNamed(context, '/$gideceksayfa',arguments: data);
          },
        child: Container(
          child: Column(children: [
            // Image.asset(image, height: position == 'GK' ? height - 10.0 : height),
            Stack(
              children: [
                //SizedBox(width: 10,),
                Image.network(image,height: height,),
                Opacity(
                  opacity: band,
                  child: CircleAvatar(backgroundColor: Colors.white,maxRadius: 8,minRadius: 2,child: Text(who,
                    style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                  ),
                ),

        ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade900, borderRadius: BorderRadius.circular(6.0)),
              height: 29.0,width: 75,
              child: Column(
                children: [
                  Padding(
                      child: Text(
                        name,
                        style: TextStyle(color: Colors.white,fontSize: name.length>8?12:13),
                        textAlign: TextAlign.center,maxLines: 1,
                      ),
                      padding: EdgeInsets.only(left: 2.0, right: 2.0)),
                  Padding(
                      child: Text(
                        'Puan',
                        style: TextStyle(color: Colors.white,fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.only(left: 3.0, right: 3.0)),
                ],
              ),
            ),
          ]),
          height: (height + 29.0),
        ),
      ),
      top: top,
      right: right,
      left: left,
    );
  }
}

