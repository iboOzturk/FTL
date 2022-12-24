import 'package:fantasysuperlig/Screens/Leagues/aylikligpage.dart';
import 'package:fantasysuperlig/Screens/Leagues/liglerpage.dart';
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
import '../../Variables/global.dart' as global;
import '../../Variables/konum.dart' as konum;
import 'dart:async';

class TargetAylikPointPage extends StatefulWidget {
  @override
  _TargetAylikPointPageState createState() => _TargetAylikPointPageState();
}
List<String> playerInfo(String boxname){
  for(var f in global.takimim){

  }
}
class _TargetAylikPointPageState extends State<TargetAylikPointPage> {
  int haftaid=global.CurrentWeek;
  String teamname;
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  int kaptanid=0;

  Future<void> loginnes() async{
    await getPointTeams(global.otheruserid,haftaid);
  }
  Future<void> puanGetir() async{
    await getPoints(global.otheruserid);
  }
  @override
  void initState() {
    haftaid=global.CurrentWeek;
    global.point='0';


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
    getOldPoint(global.otheruserid,haftaid);

    //getCaptains(global.userid);
    getCaptains2(global.otheruserid,haftaid);
    super.initState();
  }
  Future<Null> _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    // getTakimim(global.userid);
    getPointTeams(global.otheruserid,haftaid);
    // getCaptains(global.userid);
    getPoints(global.otheruserid);
    getOldPoint(global.otheruserid,haftaid);
    getCaptains2(global.otheruserid,haftaid);
    setState(() {
    });
  }
  Future<Null> _refreshData2() async {
    await Future.delayed(Duration(milliseconds: 350));
    // getTakimim(global.userid);
    getPointTeams(global.otheruserid,haftaid);

    //getCaptains(global.userid);
    getPoints(global.otheruserid);
    getOldPoint(global.otheruserid,haftaid);

    getCaptains2(global.otheruserid,haftaid);
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
    var data1=[];
    data1=ModalRoute.of(context).settings.arguments;
    teamname=data1[0];
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    final double _fieldH = 0.8143399 * _height;
    double uzunluk=MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: getPoints(global.otheruserid),
        builder:  (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(backgroundColor:Color.fromARGB(255, 55, 0, 60 ) ,color: Colors.white,));
          }
          return FutureBuilder(
              future: getPointTeams(global.otheruserid,haftaid),
              builder: (BuildContext context,AsyncSnapshot snapshot){

                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(backgroundColor:Color.fromARGB(255, 55, 0, 60 ) ,color: Colors.white,));
                }
                return WillPopScope(
                  onWillPop: () {
                    // Navigator.pushNamed(context, '/menu');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AylikLeaguePage()));
                  },
                  child: RefreshIndicator(
                    onRefresh: _refreshData,
                    child: new Scaffold(

                      //  backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
                        appBar: new AppBar(actions: [IconButton(icon: Icon(Icons.refresh),onPressed: _refreshData2,)],
                          // backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
                          flexibleSpace: Container(
                            decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  colors: [
                                    const Color(0xFF3366FF),
                                    const Color(0xFF00CCFF),
                                  ],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(1.0, 0.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                            ),
                          ),bottom: PreferredSize(preferredSize: Size.fromHeight(20),
                            child: Container(alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,height:40 ,color: Colors.white,
                              child: Text('Maç Haftası $haftaid',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                            ),
                          ),
                          elevation: 0.0,
                          centerTitle: true,
                          title: new Text('$teamname takımı'),
                          leading: new IconButton(
                            icon: new Icon(Icons.arrow_back_ios),
                            onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>AylikLeaguePage()));},),
                        ),
                        body:global.gelenOyuncuSayisi==0?
                        Container(alignment: Alignment.center,decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [
                                const Color(0xFF3366FF),
                                const Color(0xFF00CCFF),
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('$teamname $haftaid . HAFTAYA AİT TAKIMI YOK',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 29),textAlign: TextAlign.center,),
                        ),):
                        Container(
                          width:MediaQuery.of(context).size.width ,height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [
                                  const Color(0xFF3366FF),
                                  const Color(0xFF00CCFF),
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /* Expanded(
                            flex: 1,
                            child: Container(alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,height:40 ,color: Colors.white,
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(icon:Icon(Icons.arrow_back_ios),onPressed: () {
                                    setState(() {

                                      haftaid>1?haftaid=haftaid-1:haftaid=1;
                                    });
                                    _refreshData2();
                                  },),
                                  SizedBox(width: 10,),
                                  Text('Maç Haftası $haftaid',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                                  SizedBox(width: 10,),
                                  IconButton(icon: Icon(Icons.arrow_forward_ios),onPressed: () {
                                    setState(() {

                                      global.captain==null||global.captain=='null'||global.captain==[]? haftaid=haftaid+1:haftaid=global.CurrentWeek+1;
                                    });
                                    _refreshData2();
                                  },),

                                ],
                              ),
                            ),
                          ), */
                              // global.gelenOyuncuSayisi==0? Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height-110,alignment: Alignment.center,color: Colors.yellowAccent,):
                              Expanded(flex: 1,child: SizedBox(height: 5,)),
                              Expanded(
                                flex: 1,
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 105,height: 36,decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey,width: 1)
                                    ),
                                      child: Column(
                                        children: [
                                          Expanded(flex:1,
                                            child: Container(alignment: Alignment.center,
                                                width: 105,height: 16,decoration: BoxDecoration(
                                                  color: Color.fromARGB(255, 55, 0, 60 ),
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                child: Text('Ortalama Puan',
                                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),
                                                  textAlign: TextAlign.center,)
                                            ),
                                          ),
                                          // SizedBox(height: 1,),
                                          Expanded(flex:1,
                                            child: Container(alignment: Alignment.center,
                                                width: 105,height: 16,
                                                decoration: BoxDecoration(
                                                  color: Colors.purple.shade700,
                                                  borderRadius: BorderRadius.circular(15),),
                                                //Color.fromARGB(99, 79, 35, 84 ),

                                                child: Text(global.OldAvgPoint==null?'0':global.OldAvgPoint.toString(),
                                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),)
                                            ),
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
                                          Expanded(flex:1,
                                            child: Container(alignment: Alignment.center,
                                                width: 105,height: 16,decoration: BoxDecoration(
                                                  color: Color.fromARGB(255, 55, 0, 60 ),
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                child: Text('Puan',
                                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),
                                                  textAlign: TextAlign.center,)
                                            ),
                                          ),
                                          //  SizedBox(height: 1,),
                                          Expanded(flex:1,
                                            child: Container(alignment: Alignment.center,
                                                width: 105,height: 16,
                                                decoration: BoxDecoration(
                                                  color: Colors.purple.shade700,
                                                  borderRadius: BorderRadius.circular(15),),
                                                //Color.fromARGB(99, 79, 35, 84 ),

                                                // child: Text(global.point==null?'0':global.point,
                                                child: Text(global.OldPoint==null?'0':global.OldPoint.toString(),
                                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),)
                                            ),
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
                                          Expanded(flex:1,
                                            child: Container(alignment: Alignment.center,
                                                width: 105,height: 16,decoration: BoxDecoration(
                                                  color: Color.fromARGB(255, 55, 0, 60 ),
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                child: Text('En Yüksek',
                                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),
                                                  textAlign: TextAlign.center,)
                                            ),
                                          ),
                                          //SizedBox(height: 1,),
                                          Expanded(flex:1,
                                            child: Container(alignment: Alignment.center,
                                                width: 105,height: 16,
                                                decoration: BoxDecoration(
                                                  color: Colors.purple.shade700,
                                                  borderRadius: BorderRadius.circular(15),),
                                                //Color.fromARGB(99, 79, 35, 84 ),

                                                child: Text(global.OldMaxPoint==null?'0':global.OldMaxPoint.toString(),
                                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //height: MediaQuery.of(context).size.height-158
                              Expanded(
                                flex: 19,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  //height: uzunluk*0.77,
                                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/saha7.png'),fit: BoxFit.fill)),
                                  child: Column(
                                    children: [
                                      // Expanded(flex: 1,child: SizedBox(height: (uzunluk*0.85)*0.06,)),
                                      //SizedBox(height: 120,),
                                      ///Kaleci
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            Expanded(flex: 1,child: SizedBox(height: 60,)),
                                            Expanded(
                                              flex:4,
                                              child: MyPuanWidget(image: global.kaleci0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.kaleci0Kits,
                                                name:global.kaleci0PlayerShortName==null?'Boş':global.kaleci0PlayerShortName,
                                                position: "GK",gideceksayfa: 'kaleci',
                                                pozisyon: global.kaleci0Pos,neresi: 'Kaleci0',
                                                band:global.kaleci0PlayerID==global.captain
                                                    // ||global.kaleci0PlayerID==global.spareCaptain
                                                    &&global.captain!=null
                                                //  &&global.spareCaptain!=null
                                                    ? 1:0,
                                                who:global.kaleci0PlayerID==global.captain? 'K':
                                                //  global.kaleci0PlayerID==global.spareCaptain?'YK':
                                                '',
                                                playerid: global.kaleci0PlayerID,
                                                gorunurluk: global.kaleci0vis,
                                                puan:global.kaleci0Puan==null?0: global.kaleci0Puan,
                                                emp: global.kaleci0emp,
                                                sorunne: global.K0injury==1?'!':global.K0leave==1?'X':'',
                                                sorun: global.K0injury==1?1:global.K0leave==1?1:0,
                                                desp: global.K0Desp==null?'':global.K0Desp,
                                                oynamadurum: global.K0isplay==null?0:global.K0isplay,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // SizedBox(height: 20,),
                                      //  Expanded(flex: 1,child: SizedBox(height: (uzunluk*0.85)*0.025,)),
                                      ///Defanslar
                                      Expanded(
                                        flex: 2,
                                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            MyPuanWidget(image: global.defans0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans0Kits,
                                              name:global.defans0PlayerShortName==null?'Boş':global.defans0PlayerShortName,
                                              position: "GK",gideceksayfa: 'kaleci',
                                              pozisyon: global.defans0Pos,neresi: 'Defans0',
                                              band:global.defans0PlayerID==global.captain
                                                  //   ||global.defans0PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //     &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.defans0PlayerID==global.captain? 'K':
                                              //global.defans0PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.defans0PlayerID,
                                              gorunurluk:global.defans0PlayerShortName==null?true: global.defans0vis,
                                              emp: global.defans0emp,puan:global.defans0Puan==null?0:  global.defans0Puan,
                                              sorunne: global.D0injury==1?'!':global.D0leave==1?'X':'',
                                              sorun: global.D0injury==1?1:global.D0leave==1?1:0,
                                              desp: global.D0Desp==null?'':global.D0Desp,
                                              oynamadurum: global.D0isplay==null?0:global.D0isplay,

                                            ),
                                            SizedBox(width: 5,),
                                            MyPuanWidget(image: global.defans1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans1Kits,
                                              name: global.defans1PlayerShortName==null?'Boş':global.defans1PlayerShortName,
                                              position: "CB",gideceksayfa: 'kaleci',pozisyon: global.defans1Pos,neresi: 'Defans1',
                                              band:global.defans1PlayerID==global.captain
                                                  // ||global.defans1PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //  &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.defans1PlayerID==global.captain? 'K':
                                              // global.defans1PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.defans1PlayerID,
                                              gorunurluk:global.defans1PlayerShortName==null?true: global.defans1vis,
                                              emp: global.defans1emp,puan:global.defans1Puan==null?0:  global.defans1Puan,
                                              sorunne: global.D1injury==1?'!':global.D1leave==1?'X':'',
                                              sorun: global.D1injury==1?1:global.D1leave==1?1:0,
                                              desp: global.D1Desp==null?'':global.D1Desp,
                                              oynamadurum: global.D1isplay==null?0:global.D1isplay,

                                            ),
                                            SizedBox(width: 5,),
                                            MyPuanWidget(image: global.defans2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans2Kits,
                                              name: global.defans2PlayerShortName==null?'Boş':global.defans2PlayerShortName,
                                              position: "CB",gideceksayfa: 'kaleci',pozisyon:global.defans2Pos,neresi: 'Defans2',
                                              band: global.defans2PlayerID==global.captain
                                                  //    ||global.defans2PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //      &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.defans2PlayerID==global.captain? 'K':
                                              // global.defans2PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.defans2PlayerID,
                                              gorunurluk:global.defans2PlayerShortName==null?true: global.defans2vis,
                                              emp: global.defans2emp,puan:global.defans2Puan==null?0:  global.defans2Puan,
                                              sorunne: global.D2injury==1?'!':global.D2leave==1?'X':'',
                                              sorun: global.D2injury==1?1:global.D2leave==1?1:0,
                                              desp: global.D2Desp==null?'':global.D2Desp,
                                              oynamadurum: global.D2isplay==null?0:global.D2isplay,

                                            ),
                                            SizedBox(width: 5,),
                                            MyPuanWidget(image: global.defans3Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans3Kits,
                                              name: global.defans3PlayerShortName==null?'Boş':global.defans3PlayerShortName,
                                              position: "CB",gideceksayfa: 'kaleci',pozisyon: global.defans3Pos,neresi: 'Defans3',
                                              band: global.defans3PlayerID==global.captain
                                                  // ||global.defans3PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //   &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.defans3PlayerID==global.captain? 'K':
                                              //global.defans3PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.defans3PlayerID,
                                              gorunurluk:global.defans3PlayerShortName==null?true:  global.defans3vis,
                                              emp: global.defans3emp,puan:global.defans3Puan==null?0:  global.defans3Puan,
                                              sorunne: global.D3injury==1?'!':global.D3leave==1?'X':'',
                                              sorun: global.D3injury==1?1:global.D3leave==1?1:0,
                                              desp: global.D3Desp==null?'':global.D3Desp,
                                              oynamadurum: global.D3isplay==null?0:global.D3isplay,


                                            ),
                                            SizedBox(width: 5,),
                                            MyPuanWidget(image: global.defans4Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans4Kits,
                                              name: global.defans4PlayerShortName==null?'Boş':global.defans4PlayerShortName,
                                              position: "LB",gideceksayfa: 'kaleci',pozisyon: global.defans4Pos,neresi: 'Defans4',
                                              band: global.defans4PlayerID==global.captain
                                                  //||global.defans4PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //  &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.defans4PlayerID==global.captain? 'K':
                                              //global.defans4PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.defans4PlayerID,
                                              gorunurluk:global.defans4PlayerShortName==null?true: global.defans4vis,
                                              emp: global.defans4emp,puan:global.defans4Puan==null?0:  global.defans4Puan,
                                              sorunne: global.D4injury==1?'!':global.D4leave==1?'X':'',
                                              sorun: global.D4injury==1?1:global.D4leave==1?1:0,
                                              desp: global.D4Desp==null?'':global.D4Desp,
                                              oynamadurum: global.D4isplay==null?0:global.D4isplay,

                                            ),
                                          ],
                                        ),
                                      ),
                                      // SizedBox(height: 20,),
                                      //   Expanded(flex: 1,child: SizedBox(height: (uzunluk*0.85)*0.025,)),
                                      ///Ortasaha
                                      Expanded(
                                        flex: 2,
                                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            MyPuanWidget(image: global.ortasaha0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha0Kits,
                                              name: global.ortasaha0PlayerShortName==null?'Boş':global.ortasaha0PlayerShortName,
                                              position: "LMF",gideceksayfa: 'kaleci',pozisyon: global.ortasaha0Pos,neresi: 'OrtaSaha0',
                                              band: global.ortasaha0PlayerID==global.captain
                                                  // ||global.ortasaha0PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //      &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.ortasaha0PlayerID==global.captain? 'K':
                                              //global.ortasaha0PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.ortasaha0PlayerID,
                                              gorunurluk:global.ortasaha0PlayerShortName==null?true:   global.ortasaha0vis,
                                              emp: global.ortasaha0emp,puan:global.ortasaha0Puan==null?0:  global.ortasaha0Puan,
                                              sorunne: global.OS0injury==1?'!':global.OS0leave==1?'X':'',
                                              sorun: global.OS0injury==1?1:global.OS0leave==1?1:0,
                                              desp: global.OS0Desp==null?'':global.OS0Desp,
                                              oynamadurum: global.OS0isplay==null?0:global.OS0isplay,

                                            ),
                                            SizedBox(width: 5,),
                                            MyPuanWidget(image: global.ortasaha1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha1Kits,
                                              name: global.ortasaha1PlayerShortName==null?'Boş':global.ortasaha1PlayerShortName,
                                              position: "AMF",gideceksayfa: 'kaleci',pozisyon: global.ortasaha1Pos,neresi: 'OrtaSaha1',
                                              band: global.ortasaha1PlayerID==global.captain
                                                  //||global.ortasaha1PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //      &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.ortasaha1PlayerID==global.captain? 'K':
                                              //global.ortasaha1PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.ortasaha1PlayerID,
                                              gorunurluk: global.ortasaha1PlayerShortName==null?true: global.ortasaha1vis,
                                              emp: global.ortasaha1emp,puan:global.ortasaha1Puan==null?0:  global.ortasaha1Puan,
                                              sorunne: global.OS1injury==1?'!':global.OS1leave==1?'X':'',
                                              sorun: global.OS1injury==1?1:global.OS1leave==1?1:0,
                                              desp: global.OS1Desp==null?'':global.OS1Desp,
                                              oynamadurum: global.OS1isplay==null?0:global.OS1isplay,

                                            ),
                                            SizedBox(width: 5,),
                                            MyPuanWidget(image: global.ortasaha2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha2Kits,
                                              name: global.ortasaha2PlayerShortName==null?'Boş':global.ortasaha2PlayerShortName,
                                              position: "AMF",gideceksayfa: 'kaleci',pozisyon: global.ortasaha2Pos,neresi: 'OrtaSaha2',
                                              band: global.ortasaha2PlayerID==global.captain
                                                  //    ||global.ortasaha2PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //          &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.ortasaha2PlayerID==global.captain? 'K':
                                              //    global.ortasaha2PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.ortasaha2PlayerID,
                                              gorunurluk:global.ortasaha2PlayerShortName==null?true:  global.ortasaha2vis,
                                              emp: global.ortasaha2emp,puan:global.ortasaha2Puan==null?0:  global.ortasaha2Puan,
                                              sorunne: global.OS2injury==1?'!':global.OS2leave==1?'X':'',
                                              sorun: global.OS2injury==1?1:global.OS2leave==1?1:0,
                                              desp: global.OS2Desp==null?'':global.OS2Desp,
                                              oynamadurum: global.OS2isplay==null?0:global.OS2isplay,

                                            ),
                                            SizedBox(width: 5,),
                                            MyPuanWidget(image: global.ortasaha3Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha3Kits,
                                              name: global.ortasaha3PlayerShortName==null?'Boş':global.ortasaha3PlayerShortName,
                                              position: "AMF",gideceksayfa: 'kaleci',pozisyon: global.ortasaha3Pos,neresi: 'OrtaSaha3',
                                              band: global.ortasaha3PlayerID==global.captain
                                                  //   ||global.ortasaha3PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //      &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.ortasaha3PlayerID==global.captain? 'K':
                                              // global.ortasaha3PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.ortasaha3PlayerID,
                                              gorunurluk:global.ortasaha3PlayerShortName==null?true:  global.ortasaha3vis,
                                              emp: global.ortasaha3emp,puan: global.ortasaha3Puan==null?0: global.ortasaha3Puan,
                                              sorunne: global.OS3injury==1?'!':global.OS3leave==1?'X':'',
                                              sorun: global.OS3injury==1?1:global.OS3leave==1?1:0,
                                              desp: global.OS3Desp==null?'':global.OS3Desp,
                                              oynamadurum: global.OS3isplay==null?0:global.OS3isplay,

                                            ),
                                            SizedBox(width: 5,),
                                            MyPuanWidget(image: global.ortasaha4Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha4Kits,
                                              name: global.ortasaha4PlayerShortName==null?'Boş':global.ortasaha4PlayerShortName,
                                              position: "RMF",gideceksayfa: 'kaleci',pozisyon: global.ortasaha4Pos,neresi: 'OrtaSaha4',
                                              band: global.ortasaha4PlayerID==global.captain
                                                  //     ||global.ortasaha4PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //       &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.ortasaha4PlayerID==global.captain? 'K':
                                              //  global.ortasaha4PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.ortasaha4PlayerID,
                                              gorunurluk: global.ortasaha4PlayerShortName==null?true: global.ortasaha4vis,
                                              emp: global.ortasaha4emp,puan: global.ortasaha4Puan==null?0: global.ortasaha4Puan,
                                              sorunne: global.OS4injury==1?'!':global.OS4leave==1?'X':'',
                                              sorun: global.OS4injury==1?1:global.OS4leave==1?1:0,
                                              desp: global.OS4Desp==null?'':global.OS4Desp,
                                              oynamadurum: global.OS4isplay==null?0:global.OS4isplay,

                                            ),
                                          ],
                                        ),
                                      ),
                                      //SizedBox(height: 20,),
                                      //   Expanded(flex: 1,child: SizedBox(height: (uzunluk*0.85)*0.03,)),
                                      ///Forvet
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(width: 5,),
                                            MyPuanWidget(
                                              image: global.forvet0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.forvet0Kits,
                                              name: global.forvet0PlayerShortName==null?'Boş':global.forvet0PlayerShortName,
                                              position: "LWF",gideceksayfa: 'kaleci',pozisyon: global.forvet0Pos,neresi: 'Forvet0',
                                              band: global.forvet0PlayerID==global.captain
                                                  //   || global.forvet0PlayerID==global.spareCaptain
                                                  && global.captain!=null
                                              //         &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.forvet0PlayerID==global.captain? 'K':
                                              //   global.forvet0PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.forvet0PlayerID,
                                              gorunurluk:global.forvet0PlayerShortName==null?true: global.forvet0vis,
                                              emp: global.forvet0emp,puan:global.forvet0Puan==null?0:  global.forvet0Puan,
                                              sorunne: global.F0injury==1?'!':global.F0leave==1?'X':'',
                                              sorun: global.F0injury==1?1:global.F0leave==1?1:0,
                                              desp: global.F0Desp==null?'':global.F0Desp,
                                              oynamadurum: global.F0isplay==null?0:global.F0isplay,

                                            ),
                                            Offstage(offstage:global.forvet0PlayerShortName==null?true: global.forvet0vis ,child: SizedBox(width: 5,)),
                                            MyPuanWidget(image: global.forvet1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.forvet1Kits,
                                              name: global.forvet1PlayerShortName==null?'Boş':global.forvet1PlayerShortName,

                                              position: "LWF",gideceksayfa: 'kaleci',pozisyon:global.forvet1Pos,neresi: 'Forvet1',
                                              band: global.forvet1PlayerID==global.captain
                                                  // || global.forvet1PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //       && global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.forvet1PlayerID==global.captain? 'K':
                                              // global.forvet1PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.forvet1PlayerID,
                                              gorunurluk:global.forvet1PlayerShortName==null?true:  global.forvet1vis,
                                              emp: global.forvet1emp,puan: global.forvet1Puan==null?0: global.forvet1Puan,
                                              sorunne: global.F1injury==1?'!':global.F1leave==1?'X':'',
                                              sorun: global.F1injury==1?1:global.F1leave==1?1:0,
                                              desp: global.F1Desp==null?'':global.F1Desp,
                                              oynamadurum: global.F1isplay==null?0:global.F1isplay,

                                            ),
                                            Offstage(offstage:global.forvet1PlayerShortName==null?true:  global.forvet1vis ,child: SizedBox(width: 5,)),
                                            MyPuanWidget(image: global.forvet2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.forvet2Kits,
                                              name: global.forvet2PlayerShortName==null?'Boş':global.forvet2PlayerShortName,

                                              position: "LWF",gideceksayfa: 'kaleci',pozisyon: global.forvet2Pos,neresi: 'Forvet2',
                                              band: global.forvet2PlayerID==global.captain
                                                  // || global.forvet2PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //       && global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.forvet2PlayerID==global.captain? 'K':
                                              // global.forvet2PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.forvet2PlayerID,
                                              gorunurluk:global.forvet2PlayerShortName==null?true:  global.forvet2vis,
                                              emp: global.forvet2emp,puan:global.forvet2Puan==null?0: global.forvet2Puan,
                                              sorunne: global.F2injury==1?'!':global.F2leave==1?'X':'',
                                              sorun: global.F2injury==1?1:global.F2leave==1?1:0,
                                              desp: global.F2Desp==null?'':global.F2Desp,
                                              oynamadurum: global.F2isplay==null?0:global.F2isplay,

                                            ),
                                          ],
                                        ),
                                      ),
                                      //SizedBox(height: 45,),
                                      //      Expanded(flex: 1,child: SizedBox(height: (uzunluk*0.85)*0.07,)),
                                      ///Yedekler
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            ///kaleciler
                                            MyPuanWidget(image: global.kaleci1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.kaleci1Kits,
                                              name: global.kaleci1PlayerShortName==null?'Boş':global.kaleci1PlayerShortName,
                                              position: "GK",gideceksayfa: 'kaleci',
                                              pozisyon: global.kaleci1Pos,neresi: 'YedekKaleci',
                                              band: global.kaleci1PlayerID==global.captain
                                                  //  ||global.kaleci1PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //        &&global.spareCaptain!=null
                                                  ? 1:0,who:global.kaleci1PlayerID==global.captain? 'K':
                                              //  global.kaleci1PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.kaleci1PlayerID,
                                              gorunurluk:  global.kaleci1vis,
                                              emp: global.kaleci1emp,puan:global.kaleci1Puan==null?0: global.kaleci1Puan,
                                              sorunne: global.K1injury==1?'!':global.K1leave==1?'X':'',
                                              sorun: global.K1injury==1?1:global.K1leave==1?1:0,
                                              desp: global.K1Desp==null?'':global.K1Desp,
                                              oynamadurum: global.K1isplay==null?0:global.K1isplay,

                                            ),
                                            Offstage(offstage:  global.kaleci1vis,child: SizedBox(width: 20,)),
                                            ///forvetler
                                            MyPuanWidget(image: global.yedek2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.yedek2Kits,
                                              name: global.yedek2PlayerShortName==null?'Boş':global.yedek2PlayerShortName,
                                              position: "GK",gideceksayfa: 'kaleci',
                                              pozisyon: global.yedek2Pos,neresi: 'Yedek2',
                                              band: global.yedek2PlayerID==global.captain
                                                  // || global.yedek2PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //       &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.yedek2PlayerID==global.captain? 'K':
                                              // global.yedek2PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.yedek2PlayerID,
                                              gorunurluk: global.yedek2vis,emp: global.yedek2emp,
                                              puan:global.yedek2Puan==null?0: global.yedek2Puan,
                                              sorunne: global.Y2injury==1?'!':global.Y2leave==1?'X':'',
                                              sorun: global.Y2injury==1?1:global.Y2leave==1?1:0,
                                              desp: global.Y2Desp==null?'':global.Y2Desp,
                                              oynamadurum: global.Y2isplay==null?0:global.Y2isplay,

                                            ),
                                            Offstage(offstage:  global.yedek2vis,child: SizedBox(width: 20,)),


                                            ///defanslar
                                            MyPuanWidget(image: global.yedek0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.yedek0Kits,
                                              name: global.yedek0PlayerShortName==null?'Boş':global.yedek0PlayerShortName,
                                              position: "GK",gideceksayfa: 'kaleci',
                                              pozisyon: global.yedek0Pos,neresi: 'Yedek0',
                                              band: global.yedek0PlayerID==global.captain
                                                  //    || global.yedek0PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //       &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.yedek0PlayerID==global.captain? 'K':
                                              // global.yedek0PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.yedek0PlayerID,
                                              gorunurluk: global.yedek0vis,emp: global.yedek0emp,
                                              puan: global.yedek0Puan==null?0:global.yedek0Puan,
                                              sorunne: global.Y0injury==1?'!':global.Y0leave==1?'X':'',
                                              sorun: global.Y0injury==1?1:global.Y0leave==1?1:0,
                                              desp: global.Y0Desp==null?'':global.Y0Desp,
                                              oynamadurum: global.Y0isplay==null?0:global.Y0isplay,

                                            ),
                                            Offstage(offstage:  global.yedek0vis,child: SizedBox(width: 20,)),

                                            ///ortasahalar
                                            MyPuanWidget(image: global.yedek1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.yedek1Kits,
                                              name: global.yedek1PlayerShortName==null?'Boş':global.yedek1PlayerShortName,
                                              position: "GK",gideceksayfa: 'kaleci',
                                              pozisyon: global.yedek1Pos,neresi: 'Yedek1',
                                              band: global.yedek1PlayerID==global.captain
                                                  // || global.yedek1PlayerID==global.spareCaptain
                                                  &&global.captain!=null
                                              //       &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.yedek1PlayerID==global.captain? 'K':
                                              // global.yedek1PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.yedek1PlayerID,
                                              gorunurluk: global.yedek1vis,emp: global.yedek0emp,
                                              puan:global.yedek1Puan==null?0:  global.yedek1Puan,
                                              sorunne: global.Y1injury==1?'!':global.Y1leave==1?'X':'',
                                              sorun: global.Y1injury==1?1:global.Y1leave==1?1:0,
                                              desp: global.Y1Desp==null?'':global.Y1Desp,
                                              oynamadurum: global.Y1isplay==null?0:global.Y1isplay,

                                            ),
                                            Offstage(offstage:  global.yedek1vis,child: SizedBox(width: 20,)),

                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                ); }
          ); }
    );
  }

}


