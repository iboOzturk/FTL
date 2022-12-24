import 'package:fantasysuperlig/Services/api_service.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:fantasysuperlig/Utils/utils.dart';
import 'package:fantasysuperlig/widgets/captainarmband.dart';
import 'package:fantasysuperlig/widgets/mypuanwidget.dart';
import 'package:fantasysuperlig/widgets/oyuncu.dart';
import 'package:fantasysuperlig/widgets/sizedboxdenemewidget.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/refresh/hdt_refresh_controller.dart';
import 'package:line_icons/line_icons.dart';
import '/widgets/player.dart';
import '/widgets/myteamplayer.dart';
import '../Variables/global.dart' as global;
import '../Variables/konum.dart' as konum;
import 'dart:async';

class MyPuanPage extends StatefulWidget {
  @override
  _MyPuanPageState createState() => _MyPuanPageState();
}
List<String> playerInfo(String boxname){
  for(var f in global.takimim){

  }
}
class _MyPuanPageState extends State<MyPuanPage> {
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  int kaptanid=0;

  Future<void> loginnes() async{
    await getTakimim(global.userid);
  }
  Future<void> puanGetir() async{
    await getPoints(global.userid);
  }
  @override
  void initState() {
    defanssayac();
    ortasahasayac();
    forvetsayac();
    setState(() {
      global.defans4vis;
      global.ortasaha3vis;
    });
    //loginnes();
    puanGetir();
    _refreshData2();
    //getCaptains(global.userid);
    getCaptains();
    super.initState();
  }
  Future<Null> _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    getTakimim(global.userid);
    // getCaptains(global.userid);
    getPoints(global.userid);
    getCaptains();
    setState(() {
    });
  }
  Future<Null> _refreshData2() async {
    await Future.delayed(Duration(milliseconds: 350));
    getTakimim(global.userid);
    //getCaptains(global.userid);
    getPoints(global.userid);

    getCaptains();
    setState(() {
    });
  }
  void defanssayac(){
    global.defanssayisi=0;
    if(global.defans0PlayerID>0){
      setState(() {
        global.defanssayisi=global.defanssayisi+1;
      });
    }
    if(global.defans1PlayerID>0){
      setState(() {
        global.defanssayisi=global.defanssayisi+1;
      });
    }
    if(global.defans2PlayerID>0){
      setState(() {
        global.defanssayisi=global.defanssayisi+1;
      });
    }
    if(global.defans3PlayerID>0){
      setState(() {
        global.defanssayisi=global.defanssayisi+1;
      });
    }
    if(global.defans4PlayerID>0){
      setState(() {
        global.defanssayisi=global.defanssayisi+1;
      });
    }
    debugPrint('defans sayac: '+global.defanssayisi.toString());
  }
  void ortasahasayac(){
    global.ortasahasayisi=0;
    if(global.ortasaha0PlayerID>0){
      setState(() {
        global.ortasahasayisi=global.ortasahasayisi+1;
      });
    }
    if(global.ortasaha1PlayerID>0){
      setState(() {
        global.ortasahasayisi=global.ortasahasayisi+1;
      });
    }
    if(global.ortasaha2PlayerID>0){
      setState(() {
        global.ortasahasayisi=global.ortasahasayisi+1;
      });
    }
    if(global.ortasaha3PlayerID>0){
      setState(() {
        global.ortasahasayisi=global.ortasahasayisi+1;
      });
    }
    if(global.ortasaha4PlayerID>0){
      setState(() {
        global.ortasahasayisi=global.ortasahasayisi+1;
      });
    }
    debugPrint('ortasaha sayac: '+global.ortasahasayisi.toString());
  }
  void forvetsayac(){
    global.forvetsayisi=0;
    if(global.forvet0PlayerID>0){
      setState(() {
        global.forvetsayisi=global.forvetsayisi+1;
      });
    }
    if(global.forvet1PlayerID>0){
      setState(() {
        global.forvetsayisi=global.forvetsayisi+1;
      });
    }
    if(global.forvet2PlayerID>0){
      setState(() {
        global.forvetsayisi=global.forvetsayisi+1;
      });
    }
    debugPrint('forvet sayac: '+global.forvetsayisi.toString());
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    final double _fieldH = 0.8143399 * _height;

    return FutureBuilder(
        future: getTakimim(global.userid),
        builder: (BuildContext context,AsyncSnapshot snapshot){

          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(backgroundColor:Color.fromARGB(255, 55, 0, 60 ) ,color: Colors.white,));
          }
          return RefreshIndicator(
            onRefresh: _refreshData,
            child: new Container(
                child: WillPopScope(
                  onWillPop: () {
                     Navigator.pushNamed(context, '/menu');
                  },
                  child: new Scaffold(

                      backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
                      appBar: new AppBar(actions: [IconButton(icon: Icon(Icons.refresh),onPressed: _refreshData2,)],
                        backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
                        elevation: 0.0,
                        centerTitle: true,
                        title: new Text('Puanım'),
                        leading: new IconButton(
                          icon: new Icon(Icons.arrow_back_ios),
                          onPressed: () {Navigator.pushNamed(context,'/menu');},),
                      ),
                      body: Container(
                        width:MediaQuery.of(context).size.width ,height: MediaQuery.of(context).size.height,
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,height:40 ,color: Colors.white,
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_back_ios),
                                  SizedBox(width: 10,),
                                  Text('Maç Haftası-1',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                                  SizedBox(width: 10,),
                                  Icon(Icons.arrow_forward_ios),

                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 105,height: 36,decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey,width: 1)
                                ),
                                  child: Column(
                                    children: [
                                      Container(alignment: Alignment.center,
                                          width: 105,height: 16,decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 55, 0, 60 ),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Text('Ortalama Puan',
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),
                                            textAlign: TextAlign.center,)
                                      ),
                                      SizedBox(height: 1,),
                                      Container(alignment: Alignment.center,
                                          width: 105,height: 16,
                                          decoration: BoxDecoration(
                                            color: Colors.purple.shade700,
                                            borderRadius: BorderRadius.circular(15),),
                                          //Color.fromARGB(99, 79, 35, 84 ),

                                          child: Text(global.point==null?'0':global.point,
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),)
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Container(
                                  width: 105,height: 36,decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey,width: 1)
                                ),
                                  child: Column(
                                    children: [
                                      Container(alignment: Alignment.center,
                                          width: 105,height: 16,decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 55, 0, 60 ),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Text('Puan',
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),
                                            textAlign: TextAlign.center,)
                                      ),
                                      SizedBox(height: 1,),
                                      Container(alignment: Alignment.center,
                                          width: 105,height: 16,
                                          decoration: BoxDecoration(
                                            color: Colors.purple.shade700,
                                            borderRadius: BorderRadius.circular(15),),
                                          //Color.fromARGB(99, 79, 35, 84 ),

                                          child: Text(global.point==null?'0':global.point,
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),)
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.0),

                                Container(
                                  width: 105,height: 36,decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey,width: 1)
                                ),
                                  child: Column(
                                    children: [
                                      Container(alignment: Alignment.center,
                                          width: 105,height: 16,decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 55, 0, 60 ),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Text('En Yüksek',
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),
                                            textAlign: TextAlign.center,)
                                      ),
                                      SizedBox(height: 1,),
                                      Container(alignment: Alignment.center,
                                          width: 105,height: 16,
                                          decoration: BoxDecoration(
                                            color: Colors.purple.shade700,
                                            borderRadius: BorderRadius.circular(15),),
                                          //Color.fromARGB(99, 79, 35, 84 ),

                                          child: Text(global.point==null?'0':global.point,
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),)
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            //height: MediaQuery.of(context).size.height-158
                         /*   Container(
                              width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height-165,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/saha5.png'),fit: BoxFit.fill)),
                              child: Column(
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                                  //SizedBox(height: 120,),
                                  ///Kaleci
                                  MyPuanWidget(image: global.kaleci0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.kaleci0Kits,
                                      name:global.kaleci0PlayerShortName==null?'Boş':global.kaleci0PlayerShortName,
                                      position: "GK",gideceksayfa: 'kaleci',
                                      pozisyon: global.kaleci0Pos,neresi: 'Kaleci0',
                                      band:global.kaleci0PlayerID==global.captain||global.kaleci0PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,
                                      who:global.kaleci0PlayerID==global.captain? 'K':global.kaleci0PlayerID==global.spareCaptain?'YK':'',
                                      playerid: global.kaleci0PlayerID,
                                      gorunurluk: global.kaleci0vis,
                                      puan:global.kaleci0Puan==null?0: global.kaleci0Puan,
                                      emp: global.kaleci0emp
                                  ),
                                  // SizedBox(height: 20,),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                                  ///Defanslar
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MyPuanWidget(image: global.defans0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans0Kits,
                                        name:global.defans0PlayerShortName==null?'Boş':global.defans0PlayerShortName,
                                        position: "GK",gideceksayfa: 'kaleci',
                                        pozisyon: global.defans0Pos,neresi: 'Defans0',
                                        band:global.defans0PlayerID==global.captain||global.defans0PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.defans0PlayerID==global.captain? 'K':global.defans0PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.defans0PlayerID,
                                        gorunurluk:global.defans0PlayerShortName==null?true: global.defans0vis,
                                        emp: global.defans0emp,puan:global.defans0Puan==null?0:  global.defans0Puan,
                                      ),
                                      SizedBox(width: 5,),
                                      MyPuanWidget(image: global.defans1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans1Kits,
                                        name: global.defans1PlayerShortName==null?'Boş':global.defans1PlayerShortName,
                                        position: "CB",gideceksayfa: 'kaleci',pozisyon: global.defans1Pos,neresi: 'Defans1',
                                        band:global.defans1PlayerID==global.captain||global.defans1PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.defans1PlayerID==global.captain? 'K':global.defans1PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.defans1PlayerID,
                                        gorunurluk:global.defans1PlayerShortName==null?true: global.defans1vis,
                                        emp: global.defans1emp,puan:global.defans1Puan==null?0:  global.defans1Puan,
                                      ),
                                      SizedBox(width: 5,),
                                      MyPuanWidget(image: global.defans2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans2Kits,
                                        name: global.defans2PlayerShortName==null?'Boş':global.defans2PlayerShortName,
                                        position: "CB",gideceksayfa: 'kaleci',pozisyon:global.defans2Pos,neresi: 'Defans2',
                                        band: global.defans2PlayerID==global.captain||global.defans2PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.defans2PlayerID==global.captain? 'K':global.defans2PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.defans2PlayerID,
                                        gorunurluk:global.defans2PlayerShortName==null?true: global.defans2vis,
                                        emp: global.defans2emp,puan:global.defans2Puan==null?0:  global.defans2Puan,
                                      ),
                                      SizedBox(width: 5,),
                                      MyPuanWidget(image: global.defans3Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans3Kits,
                                        name: global.defans3PlayerShortName==null?'Boş':global.defans3PlayerShortName,
                                        position: "CB",gideceksayfa: 'kaleci',pozisyon: global.defans3Pos,neresi: 'Defans3',
                                        band: global.defans3PlayerID==global.captain||global.defans3PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.defans3PlayerID==global.captain? 'K':global.defans3PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.defans3PlayerID,
                                        gorunurluk:global.defans3PlayerShortName==null?true:  global.defans3vis,
                                        emp: global.defans3emp,puan:global.defans3Puan==null?0:  global.defans3Puan,
                                      ),
                                      SizedBox(width: 5,),
                                      MyPuanWidget(image: global.defans4Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans4Kits,
                                        name: global.defans4PlayerShortName==null?'Boş':global.defans4PlayerShortName,
                                        position: "LB",gideceksayfa: 'kaleci',pozisyon: global.defans4Pos,neresi: 'Defans4',
                                        band: global.defans4PlayerID==global.captain||global.defans4PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.defans4PlayerID==global.captain? 'K':global.defans4PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.defans4PlayerID,
                                        gorunurluk:global.defans4PlayerShortName==null?true: global.defans4vis,
                                        emp: global.defans4emp,puan:global.defans4Puan==null?0:  global.defans4Puan,
                                      ),
                                    ],
                                  ),
                                  // SizedBox(height: 20,),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                                  ///Ortasaha
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MyPuanWidget(image: global.ortasaha0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha0Kits,
                                        name: global.ortasaha0PlayerShortName==null?'Boş':global.ortasaha0PlayerShortName,
                                        position: "LMF",gideceksayfa: 'kaleci',pozisyon: global.ortasaha0Pos,neresi: 'OrtaSaha0',
                                        band: global.ortasaha0PlayerID==global.captain||global.ortasaha0PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.ortasaha0PlayerID==global.captain? 'K': global.ortasaha0PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.ortasaha0PlayerID,
                                        gorunurluk:global.ortasaha0PlayerShortName==null?true:   global.ortasaha0vis,
                                        emp: global.ortasaha0emp,puan:global.ortasaha0Puan==null?0:  global.ortasaha0Puan,
                                      ),
                                      SizedBox(width: 5,),
                                      MyPuanWidget(image: global.ortasaha1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha1Kits,
                                        name: global.ortasaha1PlayerShortName==null?'Boş':global.ortasaha1PlayerShortName,
                                        position: "AMF",gideceksayfa: 'kaleci',pozisyon: global.ortasaha1Pos,neresi: 'OrtaSaha1',
                                        band: global.ortasaha1PlayerID==global.captain||global.ortasaha1PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.ortasaha1PlayerID==global.captain? 'K':global.ortasaha1PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.ortasaha1PlayerID,
                                        gorunurluk: global.ortasaha1PlayerShortName==null?true: global.ortasaha1vis,
                                        emp: global.ortasaha1emp,puan:global.ortasaha1Puan==null?0:  global.ortasaha1Puan,
                                      ),
                                      SizedBox(width: 5,),
                                      MyPuanWidget(image: global.ortasaha2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha2Kits,
                                        name: global.ortasaha2PlayerShortName==null?'Boş':global.ortasaha2PlayerShortName,
                                        position: "AMF",gideceksayfa: 'kaleci',pozisyon: global.ortasaha2Pos,neresi: 'OrtaSaha2',
                                        band: global.ortasaha2PlayerID==global.captain||global.ortasaha2PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.ortasaha2PlayerID==global.captain? 'K': global.ortasaha2PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.ortasaha2PlayerID,
                                        gorunurluk:global.ortasaha2PlayerShortName==null?true:  global.ortasaha2vis,
                                        emp: global.ortasaha2emp,puan:global.ortasaha2Puan==null?0:  global.ortasaha2Puan,
                                      ),
                                      SizedBox(width: 5,),
                                      MyPuanWidget(image: global.ortasaha3Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha3Kits,
                                        name: global.ortasaha3PlayerShortName==null?'Boş':global.ortasaha3PlayerShortName,
                                        position: "AMF",gideceksayfa: 'kaleci',pozisyon: global.ortasaha3Pos,neresi: 'OrtaSaha3',
                                        band: global.ortasaha3PlayerID==global.captain||global.ortasaha3PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.ortasaha3PlayerID==global.captain? 'K': global.ortasaha3PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.ortasaha3PlayerID,
                                        gorunurluk:global.ortasaha3PlayerShortName==null?true:  global.ortasaha3vis,
                                        emp: global.ortasaha3emp,puan: global.ortasaha3Puan==null?0: global.ortasaha3Puan,
                                      ),
                                      SizedBox(width: 5,),
                                      MyPuanWidget(image: global.ortasaha4Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha4Kits,
                                        name: global.ortasaha4PlayerShortName==null?'Boş':global.ortasaha4PlayerShortName,
                                        position: "RMF",gideceksayfa: 'kaleci',pozisyon: global.ortasaha4Pos,neresi: 'OrtaSaha4',
                                        band: global.ortasaha4PlayerID==global.captain||global.ortasaha4PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.ortasaha4PlayerID==global.captain? 'K': global.ortasaha4PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.ortasaha4PlayerID,
                                        gorunurluk: global.ortasaha4PlayerShortName==null?true: global.ortasaha4vis,
                                        emp: global.ortasaha4emp,puan: global.ortasaha4Puan==null?0: global.ortasaha4Puan,
                                      ),
                                    ],
                                  ),
                                  //SizedBox(height: 20,),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                                  ///Forvet
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 5,),
                                      MyPuanWidget(
                                        image: global.forvet0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.forvet0Kits,
                                        name: global.forvet0PlayerShortName==null?'Boş':global.forvet0PlayerShortName,
                                        position: "LWF",gideceksayfa: 'kaleci',pozisyon: global.forvet0Pos,neresi: 'Forvet0',
                                        band: global.forvet0PlayerID==global.captain||
                                            global.forvet0PlayerID==global.spareCaptain&&
                                                global.captain!=null&&global.spareCaptain!=null? 1:0,
                                        who:global.forvet0PlayerID==global.captain? 'K':   global.forvet0PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.forvet0PlayerID,
                                        gorunurluk:global.forvet0PlayerShortName==null?true: global.forvet0vis,
                                        emp: global.forvet0emp,puan:global.forvet0Puan==null?0:  global.forvet0Puan,
                                      ),
                                      Offstage(offstage:global.forvet0PlayerShortName==null?true: global.forvet0vis ,child: SizedBox(width: 5,)),
                                      MyPuanWidget(image: global.forvet1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.forvet1Kits,
                                        name: global.forvet1PlayerShortName==null?'Boş':global.forvet1PlayerShortName,

                                        position: "LWF",gideceksayfa: 'kaleci',pozisyon:global.forvet1Pos,neresi: 'Forvet1',
                                        band: global.forvet1PlayerID==global.captain||
                                            global.forvet1PlayerID==global.spareCaptain&&global.captain!=null&&
                                                global.spareCaptain!=null? 1:0,
                                        who:global.forvet1PlayerID==global.captain? 'K':global.forvet1PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.forvet1PlayerID,
                                        gorunurluk:global.forvet1PlayerShortName==null?true:  global.forvet1vis,
                                        emp: global.forvet1emp,puan: global.forvet1Puan==null?0: global.forvet1Puan,

                                      ),
                                      Offstage(offstage:global.forvet1PlayerShortName==null?true:  global.forvet1vis ,child: SizedBox(width: 5,)),
                                      MyPuanWidget(image: global.forvet2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.forvet2Kits,
                                        name: global.forvet2PlayerShortName==null?'Boş':global.forvet2PlayerShortName,

                                        position: "LWF",gideceksayfa: 'kaleci',pozisyon: global.forvet2Pos,neresi: 'Forvet2',
                                        band: global.forvet2PlayerID==global.captain||
                                            global.forvet2PlayerID==global.spareCaptain&&global.captain!=null&&
                                                global.spareCaptain!=null? 1:0,
                                        who:global.forvet2PlayerID==global.captain? 'K':global.forvet2PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.forvet2PlayerID,
                                        gorunurluk:global.forvet2PlayerShortName==null?true:  global.forvet2vis,
                                        emp: global.forvet2emp,puan:global.forvet2Puan==null?0: global.forvet2Puan,
                                      ),
                                    ],
                                  ),
                                  //SizedBox(height: 45,),
                                  SizedBox(height: MediaQuery.of(context).size.height*0.057,),
                                  ///Yedekler
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ///kaleciler
                                      MyPuanWidget(image: global.kaleci1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.kaleci1Kits,
                                        name: global.kaleci1PlayerShortName==null?'Boş':global.kaleci1PlayerShortName,
                                        position: "GK",gideceksayfa: 'kaleci',
                                        pozisyon: global.kaleci1Pos,neresi: 'YedekKaleci',
                                        band: global.kaleci1PlayerID==global.captain||global.kaleci1PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.kaleci1PlayerID==global.captain? 'K':global.kaleci1PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.kaleci1PlayerID,
                                        gorunurluk:  global.kaleci1vis,
                                        emp: global.kaleci1emp,puan:global.kaleci1Puan==null?0: global.kaleci1Puan,
                                      ),
                                      Offstage(offstage:  global.kaleci1vis,child: SizedBox(width: 20,)),
                                      ///forvetler
                                      MyPuanWidget(image: global.yedek2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.yedek2Kits,
                                        name: global.yedek2PlayerShortName==null?'Boş':global.yedek2PlayerShortName,
                                        position: "GK",gideceksayfa: 'kaleci',
                                        pozisyon: global.yedek2Pos,neresi: 'Yedek2',
                                        band: global.yedek2PlayerID==global.captain||
                                            global.yedek2PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,
                                        who:global.yedek2PlayerID==global.captain? 'K':global.yedek2PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.yedek2PlayerID,
                                        gorunurluk: global.yedek2vis,emp: global.yedek2emp,
                                        puan:global.yedek2Puan==null?0: global.yedek2Puan,
                                      ),
                                      Offstage(offstage:  global.yedek2vis,child: SizedBox(width: 20,)),


                                      ///defanslar
                                      MyPuanWidget(image: global.yedek0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.yedek0Kits,
                                        name: global.yedek0PlayerShortName==null?'Boş':global.yedek0PlayerShortName,
                                        position: "GK",gideceksayfa: 'kaleci',
                                        pozisyon: global.yedek0Pos,neresi: 'Yedek0',
                                        band: global.yedek0PlayerID==global.captain||
                                            global.yedek0PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,
                                        who:global.yedek0PlayerID==global.captain? 'K':global.yedek0PlayerID==global.spareCaptain?'YK':'',
                                        playerid: global.yedek0PlayerID,
                                        gorunurluk: global.yedek0vis,emp: global.yedek0emp,
                                        puan: global.yedek0Puan==null?0:global.yedek0Puan,
                                      ),
                                      Offstage(offstage:  global.yedek0vis,child: SizedBox(width: 20,)),

                                      ///ortasahalar
                                      MyPuanWidget(image: global.yedek1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.yedek1Kits,
                                          name: global.yedek1PlayerShortName==null?'Boş':global.yedek1PlayerShortName,
                                          position: "GK",gideceksayfa: 'kaleci',
                                          pozisyon: global.yedek1Pos,neresi: 'Yedek1',
                                          band: global.yedek1PlayerID==global.captain||
                                              global.yedek1PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,
                                          who:global.yedek1PlayerID==global.captain? 'K':global.yedek1PlayerID==global.spareCaptain?'YK':'',
                                          playerid: global.yedek1PlayerID,
                                          gorunurluk: global.yedek1vis,emp: global.yedek0emp,
                                          puan:global.yedek1Puan==null?0:  global.yedek1Puan
                                      ),
                                      Offstage(offstage:  global.yedek1vis,child: SizedBox(width: 20,)),

                                    ],
                                  )
                                ],
                              ),
                            ), */
                          ],
                        ),
                      )
                  ),
                )
            ),
          ); }
    );
  }

}


