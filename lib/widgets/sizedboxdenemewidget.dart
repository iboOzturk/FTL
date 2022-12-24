import 'package:fantasysuperlig/Screens/kalecidegistir.dart';
import '../Screens/Takimim/sizedboxdeneme.dart';
import '../Screens/Takimim/sizedboxdeneme2.dart';
import '../Screens/Takimim/sizedboxdeneme3.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import 'package:fantasysuperlig/Services/api_service.dart';

import '../Variables/global.dart' as global;
import 'dart:async';


class MyTeamPlayer2 extends StatelessWidget {
  const MyTeamPlayer2({
    Key key,
    @required this.image,
    @required this.name,

    @required this.position,
    @required this.gideceksayfa,
    @required this.pozisyon,
    @required this.neresi,
    @required this.who,
    @required this.sorunne,
    @required this.sorun,
    @required this.band,
    @required this.playerid,
    @required this.gorunurluk,
    @required this.aciklamavis,
    @required this.aciklama,
    @required this.emp,
    @required this.puan,
    @required this.takimkisaltma,
  })  :
        super(key: key);
  final String image;
  final String name;
  final String position;
  final String gideceksayfa;
  final String pozisyon;
  final String neresi;
  final double band;
  final String who;
  final double sorun;
  final String sorunne;
  final bool aciklamavis;
  final String aciklama;
  final int playerid;
  final bool gorunurluk;
  final String emp;
  final int puan;
final String takimkisaltma;

  ///0.6773399
  @override
  Widget build(BuildContext context) {

    //double fontBoyut=13;
    final double _height = MediaQuery.of(context).size.height;
    double height = 0.16181818 * (0.5000299 * _height);
    // double height = 0.18181818 * (0.5894399 * _height);
    return GestureDetector(
      onTap: (){
        showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                 // backgroundColor: Colors.green.shade700,
                  backgroundColor: Colors.transparent,
                  title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {
                       // Navigator.pop(context);
                      }, icon: Icon(Icons.clear,color: Colors.transparent,)),
                      Text(
                        name,style: TextStyle(
                          color: Colors.white
                      ),
                        textAlign: TextAlign.center,
                      ),

                      IconButton(onPressed: () {
                          Navigator.pop(context);
                      }, icon: Icon(Icons.clear,color: Colors.red,))
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                     // BorderRadius.all(Radius.circular(8.0))),
                      BorderRadius.only(bottomRight: Radius.circular(56.0),bottomLeft: Radius.circular(16.0) ,
                      topLeft:  Radius.circular(56.0),topRight:  Radius.circular(16.0))),
                  content: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        //color: Colors.green.shade700,
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () async{
                         /*     if(global.spareCaptain==playerid){
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
                           //   else
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
                                //Navigator.pushNamed(context, '/deneme2');
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SizedBoxDeneme()));
                              }

                              //Navigator.pop(context);
                              //Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 5,right: 5,top: 3,bottom: 3),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Text(
                                "Kaptan Seç",
                                style: TextStyle(
                                   // color: Colors.white,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                    /*      SizedBox(height: 10,),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SizedBoxDeneme()));

                                //Navigator.pushNamed(context, '/deneme2');
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
                          SizedBox(height: 15,),
                          GestureDetector(
                            onTap: () {
                              var data=[];
                              data.add(playerid);
                              data.add(pozisyon);
                              data.add(emp);
                              //neresi
                              if(emp=='YedekKaleci'||emp=='Kaleci0'){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>KaleciDegistir(),settings: RouteSettings(arguments:data )));
                              }
                              else if(emp=='Yedek0'||emp=='Yedek1'||emp=='Yedek2'){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SizedBoxDeneme2(),settings: RouteSettings(arguments:data )));

                              }
                              else{
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SizedBoxDeneme3(),settings: RouteSettings(arguments:data )));
                                // Navigator.pushNamed(context, '/substitute');
                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>SizedBoxDeneme2(),settings: RouteSettings(arguments:data )));
                              //Navigator.pop(context);
                            }
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 5,right: 5,top: 3,bottom: 3),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Text(
                                "Oyuncu Değiştir",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Visibility(visible: aciklamavis,child: Text('\n'+aciklama,style: TextStyle(color: Colors.yellow,fontSize: 18),textAlign: TextAlign.center,))
                        ],
                      ))); }
        );
        //  Navigator.pushNamed(context, '/$gideceksayfa',arguments: data);
      },
      child: Offstage(
        offstage: gorunurluk,
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
                    style: TextStyle(fontSize: 11,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                  ),
                ),
                ///Sakat oyuncu için ayarlandı

                Opacity(
                  opacity: sorun,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 38),
                    child: CircleAvatar(backgroundColor: Colors.red,maxRadius: 9,minRadius: 1,child:
                    Text(sorunne,
                      style: TextStyle(fontSize: 14,color: Colors.white,
                          fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                    ),
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
                  Expanded(flex:1,
                    child: Padding(
                        child: Text(
                          name,
                          style: TextStyle(color: Colors.white,fontSize: name.length>8?12:13),
                          textAlign: TextAlign.center,maxLines: 1,
                        ),
                        padding: EdgeInsets.only(left: 2.0, right: 2.0)),
                  ),
                  Expanded(flex:1,
                    child: Padding(
                        child: Text(
                           takimkisaltma,
                          style: TextStyle(color: Colors.white,fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.only(left: 3.0, right: 3.0)),
                  ),
                ],
              ),
            ),
          ]),
          height: (height + 29.0),
        ),
      ),
    );
  }
}

