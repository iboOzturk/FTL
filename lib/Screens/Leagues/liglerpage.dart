
import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fantasysuperlig/Screens/News/haberayrintipage.dart';
import 'package:fantasysuperlig/Screens/Puanim/targetpointpage.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Variables/global.dart' as global;


class LeaguePage extends StatefulWidget {
  @override
  _LeaguePageState createState() => _LeaguePageState();
}
Timer clocktimer;

class _LeaguePageState extends State<LeaguePage> {
 // haberlerigetir haber=haberlerigetir();
  liglerigetir lig=liglerigetir();
  olaylarigetir olay=olaylarigetir();
  Future<Null> _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    lig.getLeague(0);
    setState(() {
    });
  }
  Future<Null> _refreshOlays() async {
    await Future.delayed(Duration(seconds: 30));
    olay.getOlaylar();
    setState(() {
    });
  }
  @override
  void initState() {
    clocktimer= Timer.periodic(Duration(seconds: 30), (timer) {
     // olay.getOlaylar();
      setState(() {
      });
    });
   // _refreshOlays();
    super.initState();
  }

  @override
  void dispose() {
    clocktimer.cancel();
    setState(() {

    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        clocktimer.cancel();
        global.selectIndex=2;
        Navigator.pushNamed(context, '/menu');
      },
      child: RefreshIndicator(
        onRefresh:_refreshData ,
        child: Scaffold(
          appBar: AppBar(
            leading:
            IconButton(
              onPressed: () {
                clocktimer.cancel();

                global.selectIndex=2;
              Navigator.pushNamed(context, '/menu');
            },icon: Icon(Icons.arrow_back),),
            centerTitle: true,title: Text('Haftalık Ligler'),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/FTLBackground.png'),fit: BoxFit.fill),

              /*  gradient: new LinearGradient(
                    colors: [
                      const Color(0xFF3366FF),
                      const Color(0xFF00CCFF),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),*/
              ),
            ),
            //backgroundColor:Color.fromARGB(255, 55, 0, 60 ) ,
            bottom: PreferredSize(preferredSize: Size.fromHeight(50) ,
              child: Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,bottom: 10),
                          child: Text('Sıralama',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0,bottom: 10),
                          child: Text('Takım Adı',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0,bottom: 10),
                      child: Text('Puan',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
          body: FutureBuilder(
              future: lig.getLeague(0),
              builder: (BuildContext context,AsyncSnapshot snapshot){
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/FTLBackground.png'),fit: BoxFit.fill),

                   /* gradient: new LinearGradient(
                        colors: [
                          const Color(0xFF3366FF),
                          const Color(0xFF00CCFF),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),*/
                  ),
                  child: Column(
                    children: [
                      Expanded(flex: 5,
                        child: ListView.builder(
                            itemCount: lig.ligler.length,
                            itemBuilder: (context,index){
                              var ligs=lig.ligler[index];
                              return Column(
                                children: [
                                  SizedBox(height: 5,),
                                  InkWell(
                                    onTap: () async{
                                      await setState((){
                                        global.otheruserid=ligs.userID;
                                      });
                                      var data=[];
                                      data.add(ligs.FantasyName);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TargetPointPage(),settings: RouteSettings(arguments: data)));
                                    },
                                    child: Stack(
                                      children: [
                                        Container(height: 75,alignment: Alignment.center,
                                          child: Container(height: 50,alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: index==0?Color.fromARGB(255, 255, 215, 0):
                                              index==1?Color.fromARGB(255, 192, 192, 192):
                                              index==2?Color.fromARGB(255, 205, 127 , 20):
                                              global.fantasyteamname==ligs.FantasyName?Colors.white.withOpacity(0.7):
                                              Colors.white.withOpacity(0.4)  ,
                                             // Colors.blue.shade300,
                                              borderRadius: BorderRadius.circular(25),

                                            ),

                                            margin: EdgeInsets.only(left: 30,right: 15),
                                            child: ListTile(
                                            /*  leading: Text((index+1).toString(),
                                                style: TextStyle(fontSize: 28,color:index==0||global.fantasyteamname==ligs.FantasyName?Colors.black: Colors.white,fontWeight: FontWeight.w900),
                                              ),*/
                                              title: Row(
                                                children: [
                                                  Container(width: 1.25,height:70,color: Color(0xFF3366FF),),
                                                 // SizedBox(width: 50,),
                                                  Expanded(flex: 16,child: CircleAvatar(backgroundColor: Colors.transparent,child: Icon(Icons.person,color: Colors.white,),)),
                                                 // SizedBox(width: 10,),
                                                  Expanded(flex: 46,
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(flex: 7,
                                                          child: AutoSizeText(ligs.FantasyName,maxLines: 1,minFontSize: 15,
                                                            style: TextStyle(color: index==0||global.fantasyteamname==ligs.FantasyName?Colors.black:Colors.white,fontWeight: global.fantasyteamname==ligs.FantasyName?FontWeight.w900:FontWeight.w700,fontSize: 20),
                                                          ),
                                                        ),
                                                        Expanded(flex: 1,child: Icon(Icons.remove_red_eye,size: 32,color: Colors.purple,))
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              trailing:Container(alignment: Alignment.center,
                                                width: 50,height: 80,
                                                margin: EdgeInsets.symmetric(vertical: 10),
                                                decoration: BoxDecoration(
                                                  color: Colors.black.withOpacity(0.15),borderRadius: BorderRadius.circular(100)
                                                ),
                                                child: Text(ligs.Points.toString(),
                                                  style: TextStyle(color:index==0||global.fantasyteamname==ligs.FantasyName?Colors.black: Colors.white,fontWeight: FontWeight.w900,fontSize: 22), ),
                                              ),
                                              //isThreeLine: true,
                                              //subtitle: Text(trend.subtitle,style: TextStyle(color: Colors.black)),
                                            ),
                                          ),
                                        ),
                                        Positioned(top: 0,bottom: 0,left: 30,
                                            child: CircleAvatar(child: Text((index+1).toString(),
                                              style: TextStyle(fontSize: 28,
                                                  color:index==0||index==1||index==2?Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.w900),
                                            ),radius: 35,backgroundColor:
                                            index==0||index==1||index==2? Colors.green:
                                            Colors.white,)
                                        )
                                      ],
                                    ),
                                  ),

                                ],
                              );
                            }
                        ),
                      ),
                      Expanded(flex: 3,child: FutureBuilder(
                        future: olay.getOlaylar(),
                        builder: (BuildContext context,AsyncSnapshot snapshot){

                        return Container(
                          height: 170,
                          decoration: BoxDecoration(

                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))
                          ),
                          child: ListView.builder(
                              itemCount: olay.olaylar.length,
                              itemBuilder: (context,index){
                                var olays=olay.olaylar[index];
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8,bottom: 4),
                                      child: Row(
                                        children: [
                                          RichText(
                                              text: TextSpan(
                                                  text: ''
                                                  ,style: TextStyle(color: Colors.white)
                                                  ,children: [
                                                TextSpan(
                                                  text: olays.Tag+'\n ',
                                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                                ),
                                                TextSpan(
                                                  text:  '('+olays.score+') ',
                                                  style: TextStyle(),
                                                ),

                                              ]
                                              )),
                                          RichText(
                                              text: TextSpan(
                                                  text: '  '
                                                  ,style: TextStyle(color: Colors.white,)
                                                  ,children: [
                                                TextSpan(
                                                  text:  '  '+olays.desc1+' ',
                                                  style: TextStyle(
                                                      color:olays.type==1?Color.fromARGB(227, 0, 255, 0 ):
                                                            olays.type==2?Color.fromARGB(227, 0, 255, 0 ):
                                                            olays.type==3?Color.fromARGB(227, 0, 255, 0 ):
                                                            olays.type==13?Color.fromARGB(227, 0, 255, 0 ):
                                                            olays.type==9?Colors.yellowAccent:
                                                            olays.type==10?Colors.red:
                                                            olays.type==11?Colors.red:
                                                            olays.type==12?Colors.red:
                                                            olays.type==14?Colors.red:
                                                            olays.type==19?Colors.red:
                                                            olays.type==24?Color(0xff00ccff):
                                                            olays.type==23?Colors.orange:
                                                            olays.type==25?Colors.pinkAccent:
                                                            Colors.white),
                                                ),
                                                TextSpan(
                                                  text:  ' '+olays.PlayerShortName+' ',
                                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                                ),
                                                TextSpan(
                                                  text:  olays.desc2,
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: ' '+olays.desc3,
                                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                                ),

                                              ]
                                              )),
                                       //   Text('  '+olays.desc1+' '+olays.PlayerShortName+' '+olays.desc2+' '+olays.desc3)
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              }
                          ),

                        ); }
                      ))
                    ],
                  ),
                ); }
          ),
        ),
      ),
    );
  }
}
