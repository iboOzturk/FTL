import 'package:fantasysuperlig/Screens/kalecidegistir.dart';
import '../Screens/Takimim/sizedboxdeneme.dart';
import '../Screens/Takimim/sizedboxdeneme2.dart';
import '../Screens/Takimim/sizedboxdeneme3.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import 'package:fantasysuperlig/Services/api_service.dart';

import '../Variables/global.dart' as global;
import 'dart:async';


class MyPuanWidget extends StatelessWidget {
  const MyPuanWidget({
    Key key,
    @required this.image,
    @required this.name,

    @required this.position,
    @required this.gideceksayfa,
    @required this.pozisyon,
    @required this.neresi,
    @required this.who,
    @required this.band,
    @required this.sorun,
    @required this.desp,
    @required this.sorunne,
    @required this.playerid,
    @required this.gorunurluk,
    @required this.emp,
    @required this.puan,
    @required this.oynamadurum,
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
  final String desp;
  final String sorunne;
  final int playerid;
  final bool gorunurluk;
  final String emp;
  final int puan;
  final int oynamadurum;


  ///0.6773399
  @override
  Widget build(BuildContext context) {

    //double fontBoyut=13;
    final double _height = MediaQuery.of(context).size.height;
    double height = 0.16181818 * (0.5000299 * _height);
    // double height = 0.18181818 * (0.5894399 * _height);
    return Offstage(
      offstage: gorunurluk,
      child: Container(
        child: Column(children: [
          // Image.asset(image, height: position == 'GK' ? height - 10.0 : height),
          InkWell(
            onTap: () {
              if(sorun==1){
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(backgroundColor: Colors.red,title: Text(name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),content: Text(desp,style: TextStyle(color: Colors.white),),);
                });
              }
            },
            child: Stack(
              children: [
                //SizedBox(width: 10,),
                Image.network(image,height: height,),
                Opacity(
                  opacity: band,
                  child: CircleAvatar(backgroundColor: Colors.white,maxRadius: 8,minRadius: 2,child: Text(who,
                    style: TextStyle(fontSize: 11,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                  ),
                ),
                Opacity(
                  opacity: sorun,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 38),
                    child: InkWell(
                      onTap: () {
                        if(sorun==1){
                          showDialog(context: context, builder: (BuildContext context){
                            return AlertDialog(backgroundColor: Colors.red,content: Text(desp,style: TextStyle(color: Colors.white),),);
                          });
                        }
                      },
                      child: CircleAvatar(backgroundColor: Colors.red,maxRadius: 8,minRadius: 2,child:
                      Text(sorunne,
                        style: TextStyle(fontSize: 11,color: Colors.white,
                            fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade900, borderRadius: BorderRadius.circular(6.0)),
              //  color: oynamadurum==1?Color.fromARGB(170, 0, 255, 0):Colors.red.shade800.withOpacity(0.85), borderRadius: BorderRadius.circular(6.0)),
            height: 29.0,width: 75,
            child: Column(
              children: [
                Expanded(flex:1,
                  child: Padding(
                      child: Text(
                        name,
                        style: TextStyle(
                              color:oynamadurum==0? Colors.amber : Colors.white,
                           // color:oynamadurum==1? Colors.black  : Colors.white,
                            fontSize: name.length>8?12:13
                        ),
                        textAlign: TextAlign.center,maxLines: 1,
                      ),
                      padding: EdgeInsets.only(left: 2.0, right: 2.0)),
                ),
                Expanded(flex:1,
                  child: Padding(
                      child: Text(
                        oynamadurum==0?'-':puan.toString(),
                        style: TextStyle(
                             color:oynamadurum==0? Colors.amber: Colors.white,
                          //  color:oynamadurum==1? Colors.black: Colors.white,
                            fontSize: 12
                        ),
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
    );
  }
}

