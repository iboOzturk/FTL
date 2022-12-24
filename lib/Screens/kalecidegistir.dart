import 'Takimim/sizedboxdeneme.dart';
import 'package:fantasysuperlig/Services/api_service.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:fantasysuperlig/widgets/captainarmband.dart';
import 'package:fantasysuperlig/widgets/kalecidegistirwidget.dart';
import 'package:fantasysuperlig/widgets/oyuncu.dart';
import 'package:fantasysuperlig/widgets/sizedboxdenemewidget.dart';
import 'package:fantasysuperlig/widgets/sizedboxdenemewidget2.dart';
import 'package:fantasysuperlig/widgets/sizedboxdenemewidget3.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/refresh/hdt_refresh_controller.dart';
import 'package:line_icons/line_icons.dart';
import '/widgets/player.dart';
import '/widgets/myteamplayer.dart';
import '../Variables/global.dart' as global;
import '../Variables/konum.dart' as konum;
import 'dart:async';

class KaleciDegistir extends StatefulWidget {
  @override
  _KaleciDegistirState createState() => _KaleciDegistirState();
}
List<String> playerInfo(String boxname){
  for(var f in global.takimim){

  }
}
class _KaleciDegistirState extends State<KaleciDegistir> {
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  int kaptanid=0;
  int oyuncuid;
  String pozisyon;
  String emp;
  Future<void> loginnes() async{
    await getTakimim(global.userid);
  }
  @override
  void initState() {
    debugPrint('oyuncu id'+oyuncuid.toString());
    defanssayac();

    ortasahasayac();
    forvetsayac();
    setState(() {
      global.defans4vis;
      global.ortasaha3vis;
    });
    //loginnes();
    _refreshData2();
    //getCaptains(global.userid);
    getCaptains();
    super.initState();
  }
  Future<Null> _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    getTakimim(global.userid);
    // getCaptains(global.userid);
    getCaptains();
    setState(() {
    });
  }
  Future<Null> _refreshData2() async {
    await Future.delayed(Duration(milliseconds: 100));
    getTakimim(global.userid);
    //getCaptains(global.userid);
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
    var data1=[];
    data1=ModalRoute.of(context).settings.arguments;
    oyuncuid=data1[0];
    pozisyon=data1[1];
    emp=data1[2];
    return FutureBuilder(
        future: getTakimim(global.userid),
        builder: (BuildContext context,AsyncSnapshot snapshot){

          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: _refreshData,
            child: new Container(
                child: new Scaffold(
                    //backgroundColor: Color.fromARGB(255, 255, 0, 251),
                     //backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
                    appBar: new AppBar(
                      //backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
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
                      elevation: 0.0,
                      centerTitle: true,
                      title: new Text('Takımım'),
                      leading: new IconButton(
                        icon: new Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SizedBoxDeneme()));
                          // Navigator.pushNamed(context,'/menu');
                          },
                      ),
                    ),
                    body: Container(
                        width:MediaQuery.of(context).size.width ,height: MediaQuery.of(context).size.height,
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
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex:1,
                              child: Container(alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,height:40 ,color: Colors.white,
                                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Maç Haftası ${global.teamhaftaID}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),

                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 19,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                //height: MediaQuery.of(context).size.height-158,
                                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/saha8.png'),fit: BoxFit.fill)),
                                child: Column(
                                  children: [
                                    //SizedBox(height: 120,),
                                   // SizedBox(height: MediaQuery.of(context).size.height*0.15,),


                                    ///Kaleci
                                    Expanded(
                                      flex:2,
                                      child: Column(
                                        children: [
                                          Expanded(flex: 1,child: SizedBox(height: 50,)),

                                          Expanded(
                                            flex:3,
                                            child: KaleciDegistirWidget(image: global.kaleci0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.kaleci0Kits,
                                              name:global.kaleci0PlayerShortName==null?'Boş':global.kaleci0PlayerShortName,
                                              position: "GK",gideceksayfa: 'kaleci',
                                              pozisyon: '0',neresi: 'Kaleci0',
                                              band:global.kaleci0PlayerID==global.captain
                                                //  ||global.kaleci0PlayerID==global.spareCaptain
                                                      &&global.captain!=null
                                                  //    &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.kaleci0PlayerID==global.captain? 'K':
                                              //global.kaleci0PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.kaleci0PlayerID,
                                              gorunurluk: global.kaleci0vis,
                                              gelenPoz: pozisyon,emp: emp, cikcak: oyuncuid,
                                              takimkisaltma:global.K0takimKisa==null?'':  global.K0takimKisa,
                                              sorunne: global.K0injury==1?'+':global.K0leave==1?'X':'',
                                              sorun: global.K0injury==1?1:global.K0leave==1?1:0,

                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                   // SizedBox(width: 5,),
                                 //   SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                                    //SizedBox(height: 20,),
                                    ///Defanslar
                                    Expanded(
                                      flex:2,
                                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          KaleciDegistirWidget(image: global.defans0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans0Kits,
                                            name:global.defans0PlayerShortName==null?'Boş':global.defans0PlayerShortName,
                                            position: "CB",gideceksayfa: 'kaleci',
                                            pozisyon: '1',neresi: 'Defans0',
                                            band:global.defans0PlayerID==global.captain
                                            //    ||global.defans0PlayerID==global.spareCaptain
                                                    &&global.captain!=null
                                               //     &&global.spareCaptain!=null
                                                ? 1:0,who:global.defans0PlayerID==global.captain? 'K':
                                           // global.defans0PlayerID==global.spareCaptain?'YK':
                                            '',
                                            playerid: global.defans0PlayerID,
                                            gorunurluk:global.defans0PlayerShortName==null?true: global.defans0vis,
                                            cikcak: oyuncuid,
                                            gelenPoz: pozisyon,emp: emp,
                                            takimkisaltma:global.D0takimKisa==null?'':  global.D0takimKisa,
                                            sorunne: global.D0injury==1?'+':global.D0leave==1?'X':'',
                                            sorun: global.D0injury==1?1:global.D0leave==1?1:0,

                                          ),
                                          SizedBox(width: 5,),
                                          KaleciDegistirWidget(image: global.defans1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans1Kits,
                                            name: global.defans1PlayerShortName==null?'Boş':global.defans1PlayerShortName,
                                            position: "CB",gideceksayfa: 'kaleci',pozisyon: '1',neresi: 'Defans1',
                                            band:global.defans1PlayerID==global.captain
                                            //   ||global.defans1PlayerID==global.spareCaptain
                                                    &&global.captain!=null
                                               //     &&global.spareCaptain!=null
                                                ? 1:0,who:global.defans1PlayerID==global.captain? 'K':
                                         //   global.defans1PlayerID==global.spareCaptain?'YK':
                                            '',
                                            playerid: global.defans1PlayerID,
                                            gorunurluk:global.defans1PlayerShortName==null?true: global.defans1vis,
                                            cikcak: oyuncuid,
                                            gelenPoz: pozisyon,emp: emp,
                                            takimkisaltma:global.D1takimKisa==null?'':  global.D1takimKisa,
                                            sorunne: global.D1injury==1?'+':global.D1leave==1?'X':'',
                                            sorun: global.D1injury==1?1:global.D1leave==1?1:0,

                                          ),
                                          SizedBox(width: 5,),
                                          KaleciDegistirWidget(image: global.defans2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans2Kits,
                                            name: global.defans2PlayerShortName==null?'Boş':global.defans2PlayerShortName,
                                            position: "CB",gideceksayfa: 'kaleci',pozisyon: '1',neresi: 'Defans2',
                                            band: global.defans2PlayerID==global.captain
                                              //  || global.defans2PlayerID==global.spareCaptain
                                                    &&global.captain!=null
                                               //     &&global.spareCaptain!=null
                                                ? 1:0,who:global.defans2PlayerID==global.captain? 'K':
                                           // global.defans2PlayerID==global.spareCaptain?'YK':
                                            '',
                                            playerid: global.defans2PlayerID,
                                            gorunurluk:global.defans2PlayerShortName==null?true: global.defans2vis,
                                            cikcak: oyuncuid,
                                            gelenPoz: pozisyon,emp: emp,
                                            takimkisaltma:global.D2takimKisa==null?'':  global.D2takimKisa,
                                            sorunne: global.D2injury==1?'+':global.D2leave==1?'X':'',
                                            sorun: global.D2injury==1?1:global.D2leave==1?1:0,

                                          ),
                                          SizedBox(width: 5,),
                                          KaleciDegistirWidget(image: global.defans3Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans3Kits,
                                            name: global.defans3PlayerShortName==null?'Boş':global.defans3PlayerShortName,
                                            position: "CB",gideceksayfa: 'kaleci',pozisyon: '1',neresi: 'Defans3',
                                            band: global.defans3PlayerID==global.captain
                                             //   ||global.defans3PlayerID==global.spareCaptain
                                                    &&global.captain!=null
                                             //       &&global.spareCaptain!=null
                                                ? 1:0,who:global.defans3PlayerID==global.captain? 'K':
                                           // global.defans3PlayerID==global.spareCaptain?'YK':
                                            '',
                                            playerid: global.defans3PlayerID,
                                            gorunurluk:global.defans3PlayerShortName==null?true:  global.defans3vis,
                                            cikcak: oyuncuid,
                                            gelenPoz: pozisyon,emp: emp,
                                            takimkisaltma:global.D3takimKisa==null?'':  global.D3takimKisa,
                                            sorunne: global.D3injury==1?'+':global.D3leave==1?'X':'',
                                            sorun: global.D3injury==1?1:global.D3leave==1?1:0,

                                          ),
                                          SizedBox(width: 5,),
                                          KaleciDegistirWidget(image: global.defans4Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans4Kits,
                                            name: global.defans4PlayerShortName==null?'Boş':global.defans4PlayerShortName,
                                            position: "LB",gideceksayfa: 'kaleci',pozisyon: '1',neresi: 'Defans4',
                                            band: global.defans4PlayerID==global.captain
                                            //    ||global.defans4PlayerID==global.spareCaptain
                                                    &&global.captain!=null
                                              //      &&global.spareCaptain!=null
                                                ? 1:0,who:global.defans4PlayerID==global.captain? 'K':
                                           // global.defans4PlayerID==global.spareCaptain?'YK':
                                            '',
                                            playerid: global.defans4PlayerID,
                                            gorunurluk:global.defans4PlayerShortName==null?true: global.defans4vis,
                                            cikcak: oyuncuid,
                                            gelenPoz: pozisyon,emp: emp,
                                            takimkisaltma:global.D4takimKisa==null?'': global.D4takimKisa,
                                            sorunne: global.D4injury==1?'+':global.D4leave==1?'X':'',
                                            sorun: global.D4injury==1?1:global.D4leave==1?1:0,

                                          ),
                                        ],
                                      ),
                                    ),
                                    //SizedBox(height: 20,),
                                 //   SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                                    ///Ortasaha
                                    Expanded(
                                      flex:2,
                                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          KaleciDegistirWidget(image: global.ortasaha0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha0Kits,
                                            name: global.ortasaha0PlayerShortName==null?'Boş':global.ortasaha0PlayerShortName,
                                            position: "LMF",gideceksayfa: 'kaleci',pozisyon: '2',neresi: 'OrtaSaha0',
                                            band: global.ortasaha0PlayerID==global.captain
                                           //     ||global.ortasaha0PlayerID==global.spareCaptain
                                                    &&global.captain!=null
                                              //     &&global.spareCaptain!=null
                                                ? 1:0,who:global.ortasaha0PlayerID==global.captain? 'K':
                                          //  global.ortasaha0PlayerID==global.spareCaptain?'YK':
                                            '',
                                            playerid: global.ortasaha0PlayerID,
                                            gorunurluk:global.ortasaha0PlayerShortName==null?true:global.ortasaha0vis,
                                            cikcak: oyuncuid,
                                            gelenPoz: pozisyon,emp: emp,
                                            takimkisaltma: global.OS0takimKisa==null?'':global.OS0takimKisa,
                                            sorunne: global.OS0injury==1?'+':global.OS0leave==1?'X':'',
                                            sorun: global.OS0injury==1?1:global.OS0leave==1?1:0,

                                          ),
                                          SizedBox(width: 5,),
                                          KaleciDegistirWidget(image: global.ortasaha1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha1Kits,
                                            name: global.ortasaha1PlayerShortName==null?'Boş':global.ortasaha1PlayerShortName,
                                            position: "AMF",gideceksayfa: 'kaleci',pozisyon: '2',neresi: 'OrtaSaha1',
                                            band: global.ortasaha1PlayerID==global.captain
                                            //    ||global.ortasaha1PlayerID==global.spareCaptain
                                                    &&global.captain!=null
                                              //      &&global.spareCaptain!=null
                                                ? 1:0,who:global.ortasaha1PlayerID==global.captain? 'K':
                                           // global.ortasaha1PlayerID==global.spareCaptain?'YK':
                                            '',
                                            playerid: global.ortasaha1PlayerID,
                                            gorunurluk: global.ortasaha1PlayerShortName==null?true: global.ortasaha1vis,
                                            cikcak: oyuncuid,
                                            gelenPoz: pozisyon,emp: emp,
                                            takimkisaltma: global.OS1takimKisa==null?'':global.OS1takimKisa,
                                            sorunne: global.OS1injury==1?'+':global.OS1leave==1?'X':'',
                                            sorun: global.OS1injury==1?1:global.OS1leave==1?1:0,

                                          ),
                                          SizedBox(width: 5,),
                                          KaleciDegistirWidget(image: global.ortasaha2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha2Kits,
                                            name: global.ortasaha2PlayerShortName==null?'Boş':global.ortasaha2PlayerShortName,
                                            position: "AMF",gideceksayfa: 'kaleci',pozisyon: '2',neresi: 'OrtaSaha2',
                                            band: global.ortasaha2PlayerID==global.captain
                                            //    ||global.ortasaha2PlayerID==global.spareCaptain
                                                    &&global.captain!=null
                                               //     &&global.spareCaptain!=null
                                                ? 1:0,who:global.ortasaha2PlayerID==global.captain? 'K':
                                          //  global.ortasaha2PlayerID==global.spareCaptain?'YK':
                                            '',
                                            playerid: global.ortasaha2PlayerID,
                                            gorunurluk:global.ortasaha2PlayerShortName==null?true:  global.ortasaha2vis,
                                            cikcak: oyuncuid,
                                            gelenPoz: pozisyon,emp: emp,
                                            takimkisaltma: global.OS2takimKisa==null?'':global.OS2takimKisa,
                                            sorunne: global.OS2injury==1?'+':global.OS2leave==1?'X':'',
                                            sorun: global.OS2injury==1?1:global.OS2leave==1?1:0,

                                          ),
                                          SizedBox(width: 5,),
                                          KaleciDegistirWidget(image: global.ortasaha3Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha3Kits,
                                            name: global.ortasaha3PlayerShortName==null?'Boş':global.ortasaha3PlayerShortName,
                                            position: "AMF",gideceksayfa: 'kaleci',pozisyon: '2',neresi: 'OrtaSaha3',
                                            band: global.ortasaha3PlayerID==global.captain
                                              //  ||global.ortasaha3PlayerID==global.spareCaptain
                                                    &&global.captain!=null
                                              //      &&global.spareCaptain!=null
                                                ? 1:0,who:global.ortasaha3PlayerID==global.captain? 'K':
                                           // global.ortasaha3PlayerID==global.spareCaptain?'YK':
                                            '',
                                            playerid: global.ortasaha3PlayerID,
                                            gorunurluk:global.ortasaha3PlayerShortName==null?true:  global.ortasaha3vis,
                                            cikcak: oyuncuid,
                                            gelenPoz: pozisyon,emp: emp,
                                            takimkisaltma: global.OS3takimKisa==null?'':global.OS3takimKisa,
                                            sorunne: global.OS3injury==1?'+':global.OS3leave==1?'X':'',
                                            sorun: global.OS3injury==1?1:global.OS3leave==1?1:0,

                                          ),
                                          SizedBox(width: 5,),
                                          KaleciDegistirWidget(image: global.ortasaha4Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha4Kits,
                                            name: global.ortasaha4PlayerShortName==null?'Boş':global.ortasaha4PlayerShortName,
                                            position: "RMF",gideceksayfa: 'kaleci',pozisyon: '2',neresi: 'OrtaSaha4',
                                            band: global.ortasaha4PlayerID==global.captain
                                           //     ||global.ortasaha4PlayerID==global.spareCaptain
                                                    &&global.captain!=null
                                             //       &&global.spareCaptain!=null
                                                ? 1:0,who:global.ortasaha4PlayerID==global.captain? 'K':
                                       //     global.ortasaha4PlayerID==global.spareCaptain?'YK':
                                            '',
                                            playerid: global.ortasaha4PlayerID,
                                            gorunurluk: global.ortasaha4PlayerShortName==null?true: global.ortasaha4vis,
                                            cikcak: oyuncuid,
                                            gelenPoz: pozisyon,emp: emp,
                                            takimkisaltma: global.OS4takimKisa==null?'':global.OS4takimKisa,
                                            sorunne: global.OS4injury==1?'+':global.OS4leave==1?'X':'',
                                            sorun: global.OS4injury==1?1:global.OS4leave==1?1:0,

                                          ),
                                        ],
                                      ),
                                    ),
                                    //SizedBox(height: 20,),
                                 //   SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                                    ///Forvet
                                    Expanded(
                                      flex:2,

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(width: 30,),
                                          KaleciDegistirWidget(
                                            image: global.forvet0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.forvet0Kits,
                                            name: global.forvet0PlayerShortName==null?'Boş':global.forvet0PlayerShortName,
                                            position: "LWF",gideceksayfa: 'kaleci',pozisyon: global.forvet0Pos,neresi: 'Forvet0',
                                            band: global.forvet0PlayerID==global.captain
                                         //       || global.forvet0PlayerID==global.spareCaptain
                                                    && global.captain!=null
                                            //        &&global.spareCaptain!=null
                                                ? 1:0,
                                            who:global.forvet0PlayerID==global.captain? 'K':
                                          //  global.forvet0PlayerID==global.spareCaptain?'YK':
                                            '',
                                            playerid: global.forvet0PlayerID,
                                            gorunurluk:global.forvet0PlayerShortName==null?true: global.forvet0vis,
                                            cikcak: oyuncuid,
                                            gelenPoz: pozisyon,emp: emp,
                                            takimkisaltma: global.F0takimKisa==null?'':global.F0takimKisa,
                                            sorunne: global.F0injury==1?'+':global.F0leave==1?'X':'',
                                            sorun: global.F0injury==1?1:global.F0leave==1?1:0,

                                          ),
                                          Offstage(offstage:global.forvet0PlayerShortName==null?true: global.forvet0vis ,child: SizedBox(width: 30,)),
                                          KaleciDegistirWidget(image: global.forvet1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.forvet1Kits,
                                            name: global.forvet1PlayerShortName==null?'Boş':global.forvet1PlayerShortName,
                                            position: "LWF",gideceksayfa: 'kaleci',pozisyon: global.forvet1Pos,neresi: 'Forvet1',
                                            band: global.forvet1PlayerID==global.captain
                                            //    || global.forvet1PlayerID==global.spareCaptain
                                                    &&global.captain!=null
                                               //     && global.spareCaptain!=null
                                                ? 1:0,
                                            who:global.forvet1PlayerID==global.captain? 'K':
                                          //  global.forvet1PlayerID==global.spareCaptain?'YK':
                                            '',
                                            playerid: global.forvet1PlayerID,
                                            gorunurluk:global.forvet1PlayerShortName==null?true:  global.forvet1vis,
                                            cikcak: oyuncuid,
                                            gelenPoz: pozisyon,emp: emp,
                                            takimkisaltma: global.F1takimKisa==null?'':global.F1takimKisa,
                                            sorunne: global.F1injury==1?'+':global.F1leave==1?'X':'',
                                            sorun: global.F1injury==1?1:global.F1leave==1?1:0,

                                          ),
                                          Offstage(offstage:global.forvet1PlayerShortName==null?true:  global.forvet1vis ,child: SizedBox(width: 30,)),
                                          KaleciDegistirWidget(image: global.forvet2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.forvet2Kits,
                                            name: global.forvet2PlayerShortName==null?'Boş':global.forvet2PlayerShortName,

                                            position: "LWF",gideceksayfa: 'kaleci',pozisyon: global.forvet2Pos,neresi: 'Forvet2',
                                            band: global.forvet2PlayerID==global.captain
                                           //     || global.forvet2PlayerID==global.spareCaptain
                                                    &&global.captain!=null
                                            //        && global.spareCaptain!=null
                                                ? 1:0,
                                            who:global.forvet2PlayerID==global.captain? 'K':
                                           // global.forvet2PlayerID==global.spareCaptain?'YK':
                                            '',
                                            playerid: global.forvet2PlayerID,
                                            gorunurluk:global.forvet2PlayerShortName==null?true:  global.forvet2vis,
                                            cikcak: oyuncuid,
                                            gelenPoz: pozisyon,emp: emp,
                                            takimkisaltma: global.F2takimKisa==null?'':global.F2takimKisa,
                                            sorunne: global.F2injury==1?'+':global.F2leave==1?'X':'',
                                            sorun: global.F2injury==1?1:global.F2leave==1?1:0,

                                          ),
                                        ],
                                      ),
                                    ),
                                  //  SizedBox(height: 45,),
                                  //  SizedBox(height: MediaQuery.of(context).size.height*0.075,),


                                    ///Yedekler
                                    Expanded(
                                      flex:2,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ///kaleciler
                                          KaleciDegistirWidget(image: global.kaleci1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.kaleci1Kits,
                                              name: global.kaleci1PlayerShortName==null?'Boş':global.kaleci1PlayerShortName,
                                              position: "GK",gideceksayfa: 'kaleci',
                                              pozisyon: global.kaleci1Pos,neresi: 'YedekKaleci',
                                              band: global.kaleci1PlayerID==global.captain
                                            //      ||global.kaleci1PlayerID==global.spareCaptain
                                                      &&global.captain!=null
                                            //          &&global.spareCaptain!=null
                                                  ? 1:0,who:global.kaleci1PlayerID==global.captain? 'K':
                                           // global.kaleci1PlayerID==global.spareCaptain?'YK':
                                            '',
                                              playerid: global.kaleci1PlayerID,
                                              gorunurluk:  global.kaleci1vis,emp: emp,
                                              cikcak: oyuncuid, gelenPoz: pozisyon,
                                           // takimkisaltma: global.K1takimKisa==null?'':global.K1takimKisa,
                                            takimkisaltma: global.kaleci1Pos==null?'-':global.kaleci1Pos=='2'?'ORT':global.kaleci1Pos=='1'?'DEF':global.kaleci1Pos=='0'?'KL':'F',
                                            sorunne: global.K1injury==1?'+':global.K1leave==1?'X':'',
                                            sorun: global.K1injury==1?1:global.K1leave==1?1:0,
                                          ),
                                          Offstage(offstage:  global.kaleci1vis,child: SizedBox(width: 20,)),
                                          ///forvetler
                                          KaleciDegistirWidget(image: global.yedek2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.yedek2Kits,
                                              name: global.yedek2PlayerShortName==null?'Boş':global.yedek2PlayerShortName,
                                              position: "GK",gideceksayfa: 'kaleci',
                                              pozisyon: global.yedek2Pos,neresi: 'Yedek2',
                                              band: global.yedek2PlayerID==global.captain
                                            //      || global.yedek2PlayerID==global.spareCaptain
                                                      &&global.captain!=null
                                             //         &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.yedek2PlayerID==global.captain? 'K':
                                           //   global.yedek2PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.yedek2PlayerID,
                                              gorunurluk: global.yedek2vis,emp: emp,
                                              cikcak: oyuncuid, gelenPoz: pozisyon,
                                          //  takimkisaltma: global.Y2takimKisa==null?'':global.Y2takimKisa,
                                            takimkisaltma: global.yedek2Pos==null?'-':global.yedek2Pos=='2'?'ORT':global.yedek2Pos=='1'?'DEF':global.yedek2Pos=='0'?'KL':'F',
                                            sorunne: global.Y2injury==1?'+':global.Y2leave==1?'X':'',
                                            sorun: global.Y2injury==1?1:global.Y2leave==1?1:0,

                                          ),
                                          Offstage(offstage:  global.yedek2vis,child: SizedBox(width: 20,)),

                                          ///defanslar
                                          KaleciDegistirWidget(image: global.yedek0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.yedek0Kits,
                                              name: global.yedek0PlayerShortName==null?'Boş':global.yedek0PlayerShortName,
                                              position: "GK",gideceksayfa: 'kaleci',
                                              pozisyon: global.yedek0Pos,neresi: 'Yedek0',
                                              band: global.yedek0PlayerID==global.captain
                                              //    || global.yedek0PlayerID==global.spareCaptain
                                                      &&global.captain!=null
                                               //       &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.yedek0PlayerID==global.captain? 'K':
                                            //  global.yedek0PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.yedek0PlayerID,
                                              gorunurluk: global.yedek0vis,emp: emp,
                                              cikcak: oyuncuid, gelenPoz: pozisyon,
                                           // takimkisaltma: global.Y0takimKisa==null?'':global.Y0takimKisa,
                                            takimkisaltma: global.yedek0Pos==null?'-':global.yedek0Pos=='2'?'ORT':global.yedek0Pos=='1'?'DEF':global.yedek0Pos=='0'?'KL':'F',
                                            sorunne: global.Y0injury==1?'+':global.Y0leave==1?'X':'',
                                            sorun: global.Y0injury==1?1:global.Y0leave==1?1:0,

                                          ),
                                          Offstage(offstage:  global.yedek0vis,child: SizedBox(width: 20,)),

                                          ///ortasahalar
                                          KaleciDegistirWidget(image: global.yedek1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.yedek1Kits,
                                              name: global.yedek1PlayerShortName==null?'Boş':global.yedek1PlayerShortName,
                                              position: "GK",gideceksayfa: 'kaleci',
                                              pozisyon: global.yedek1Pos,neresi: 'Yedek1',
                                              band: global.yedek1PlayerID==global.captain
                                              //    || global.yedek1PlayerID==global.spareCaptain
                                                      &&global.captain!=null
                                              //        &&global.spareCaptain!=null
                                                  ? 1:0,
                                              who:global.yedek1PlayerID==global.captain? 'K':
                                            //  global.yedek1PlayerID==global.spareCaptain?'YK':
                                              '',
                                              playerid: global.yedek1PlayerID,
                                              gorunurluk: global.yedek1vis,emp: emp,
                                              cikcak: oyuncuid, gelenPoz: pozisyon,
                                            //takimkisaltma: global.Y1takimKisa==null?'':global.Y1takimKisa,
                                            takimkisaltma: global.yedek1Pos==null?'-':global.yedek1Pos=='2'?'ORT':global.yedek1Pos=='1'?'DEF':global.yedek1Pos=='0'?'KL':'F',
                                            sorunne: global.Y1injury==1?'+':global.Y1leave==1?'X':'',
                                            sorun: global.Y1injury==1?1:global.Y1leave==1?1:0,
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
                        )

                      /* Stack(children: [
                        Container(
                          child: Image.asset('assets/images/saha5.png', fit: BoxFit.fill),
                          height: _fieldH,
                          width: _width,),
                        //Player(image: global.kaleci0Kits, name:global.kaleci0PlayerShortName, top: 0.06272727 * _fieldH, right: 0.17923333 * _width, left: 0.0, position: "GK")),
                        MyTeamPlayer(image: global.kaleci0Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.kaleci0Kits,
                          name:global.kaleci0PlayerShortName==null?'Boş':global.kaleci0PlayerShortName, top:  konum.kaleci0top * _fieldH, right: konum.kaleci0right * _width, left: konum.kaleci0left * _width, position: "GK",gideceksayfa: 'kaleci',
                          pozisyon: '0',neresi: 'Kaleci0',
                          band:global.kaleci0PlayerID==global.captain||global.kaleci0PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.kaleci0PlayerID==global.captain? 'K':global.kaleci0PlayerID==global.spareCaptain?'YK':'',
                          playerid: global.kaleci0PlayerID,),
                        MyTeamPlayer(image: global.kaleci1Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.kaleci1Kits,
                          name: global.kaleci1PlayerShortName==null?'Boş':global.kaleci1PlayerShortName, top: konum.kaleci1top * _fieldH, right: konum.kaleci1right * _width, left: konum.kaleci1left * _width, position: "GK",gideceksayfa: 'kaleci',
                          pozisyon: '0',neresi: 'Kaleci1',
                          band: global.kaleci1PlayerID==global.captain||global.kaleci1PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.kaleci1PlayerID==global.captain? 'K':global.kaleci1PlayerID==global.spareCaptain?'YK':'',
                          playerid: global.kaleci1PlayerID,),

                        MyTeamPlayer(image: global.defans0Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.defans0Kits,
                          name: global.defans0PlayerShortName==null?'Boş':global.defans0PlayerShortName,
                          top: konum.defans0top * _fieldH, right: konum.defans0right * _width, left: konum.defans0left *_width,
                          position: "RB",gideceksayfa: 'kaleci',pozisyon: '1',neresi: 'Defans0',
                          band: global.defans0PlayerID==global.captain||global.defans0PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.defans0PlayerID==global.captain? 'K':global.defans0PlayerID==global.spareCaptain?'YK':'',
                          playerid: global.defans0PlayerID,),
                        MyTeamPlayer(image: global.defans1Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.defans1Kits,
                          name: global.defans1PlayerShortName==null?'Boş':global.defans1PlayerShortName,
                          top: konum.defans1top * _fieldH, right: konum.defans1right * _width, left: konum.defans1left *_width,
                          position: "CB",gideceksayfa: 'kaleci',pozisyon: '1',neresi: 'Defans1',
                          band:global.defans1PlayerID==global.captain||global.defans1PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.defans1PlayerID==global.captain? 'K':global.defans1PlayerID==global.spareCaptain?'YK':'',
                          playerid: global.defans1PlayerID,),
                        MyTeamPlayer(image: global.defans2Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.defans2Kits,
                          name: global.defans2PlayerShortName==null?'Boş':global.defans2PlayerShortName,
                          top: konum.defans2top * _fieldH, right: konum.defans2right * _width, left: konum.defans2left *_width,
                          position: "CB",gideceksayfa: 'kaleci',pozisyon: '1',neresi: 'Defans2',
                          band: global.defans2PlayerID==global.captain||global.defans2PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.defans2PlayerID==global.captain? 'K':global.defans2PlayerID==global.spareCaptain?'YK':'',
                          playerid: global.defans2PlayerID,),
                        MyTeamPlayer(image: global.defans3Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.defans3Kits,
                          name: global.defans3PlayerShortName==null?'Boş':global.defans3PlayerShortName,
                          top: konum.defans3top * _fieldH, right: konum.defans3right *_width,  left: konum.defans3left * _width,
                          position: "CB",gideceksayfa: 'kaleci',pozisyon: '1',neresi: 'Defans3',
                          band: global.defans3PlayerID==global.captain||global.defans3PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.defans3PlayerID==global.captain? 'K':global.defans3PlayerID==global.spareCaptain?'YK':'',
                          playerid: global.defans3PlayerID,),
                        MyTeamPlayer(image: global.defans4Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.defans4Kits,
                          name: global.defans4PlayerShortName==null?'Boş':global.defans4PlayerShortName,
                          top: konum.defans4top * _fieldH, right: konum.defans4right *_width,  left: konum.defans4left * _width,
                          position: "LB",gideceksayfa: 'kaleci',pozisyon: '1',neresi: 'Defans4',
                          band: global.defans4PlayerID==global.captain||global.defans4PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.defans4PlayerID==global.captain? 'K':global.defans4PlayerID==global.spareCaptain?'YK':'',
                          playerid: global.defans4PlayerID,),


                        MyTeamPlayer(image: global.ortasaha0Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.ortasaha0Kits,
                          name: global.ortasaha0PlayerShortName==null?'Boş':global.ortasaha0PlayerShortName, top: konum.ortasaha0top * _fieldH, right: konum.ortasaha0right * _width, left: konum.ortasaha0left * _width,
                          position: "LMF",gideceksayfa: 'kaleci',pozisyon: '2',neresi: 'OrtaSaha0',
                          band: global.ortasaha0PlayerID==global.captain||global.ortasaha0PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.ortasaha0PlayerID==global.captain? 'K': global.ortasaha0PlayerID==global.spareCaptain?'YK':'',
                          playerid: global.ortasaha0PlayerID,),
                        MyTeamPlayer(image: global.ortasaha1Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.ortasaha1Kits,
                          name: global.ortasaha1PlayerShortName==null?'Boş':global.ortasaha1PlayerShortName, top: konum.ortasaha1top * _fieldH, right: konum.ortasaha1right * _width, left: konum.ortasaha1left  *_width,
                          position: "AMF",gideceksayfa: 'kaleci',pozisyon: '2',neresi: 'OrtaSaha1',
                          band: global.ortasaha1PlayerID==global.captain||global.ortasaha1PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.ortasaha1PlayerID==global.captain? 'K':global.ortasaha1PlayerID==global.spareCaptain?'YK':'',
                          playerid: global.ortasaha1PlayerID,),
                        MyTeamPlayer(image: global.ortasaha2Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.ortasaha2Kits,
                          name: global.ortasaha2PlayerShortName==null?'Boş':global.ortasaha2PlayerShortName, top: konum.ortasaha2top * _fieldH, right: konum.ortasaha2right * _width, left: konum.ortasaha2left  *_width,
                          position: "AMF",gideceksayfa: 'kaleci',pozisyon: '2',neresi: 'OrtaSaha2',
                          band: global.ortasaha2PlayerID==global.captain||global.ortasaha2PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.ortasaha2PlayerID==global.captain? 'K': global.ortasaha2PlayerID==global.spareCaptain?'YK':'',
                          playerid: global.ortasaha2PlayerID,),
                        MyTeamPlayer(image: global.ortasaha3Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.ortasaha3Kits,
                          name: global.ortasaha3PlayerShortName==null?'Boş':global.ortasaha3PlayerShortName, top: konum.ortasaha3top * _fieldH, right: konum.ortasaha3right * _width, left: konum.ortasaha3left *_width,
                          position: "AMF",gideceksayfa: 'kaleci',pozisyon: '2',neresi: 'OrtaSaha3',
                          band: global.ortasaha3PlayerID==global.captain||global.ortasaha3PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.ortasaha3PlayerID==global.captain? 'K': global.ortasaha3PlayerID==global.spareCaptain?'YK':'',
                          playerid: global.ortasaha3PlayerID,),
                        MyTeamPlayer(image: global.ortasaha4Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.ortasaha4Kits,
                          name: global.ortasaha4PlayerShortName==null?'Boş':global.ortasaha4PlayerShortName, top: konum.ortasaha4top * _fieldH, right: konum.ortasaha4right * _width, left: konum.ortasaha4left *_width,
                          position: "RMF",gideceksayfa: 'kaleci',pozisyon: '2',neresi: 'OrtaSaha4',
                          band: global.ortasaha4PlayerID==global.captain||global.ortasaha4PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.ortasaha4PlayerID==global.captain? 'K': global.ortasaha4PlayerID==global.spareCaptain?'YK':'',
                          playerid: global.ortasaha4PlayerID,),


                        MyTeamPlayer(image: global.forvet1Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.forvet1Kits,
                          name: global.forvet1PlayerShortName==null?'Boş':global.forvet1PlayerShortName,
                          top:konum.forvet1top * _fieldH, right: konum.forvet1right * _width, left:   konum.forvet1left  * _width,
                          position: "LWF",gideceksayfa: 'kaleci',pozisyon: '3',neresi: 'Forvet1',
                          band: global.forvet1PlayerID==global.captain||global.forvet1PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.forvet1PlayerID==global.captain? 'K':   global.forvet1PlayerID==global.spareCaptain?'YK':'',
                          playerid: global.forvet1PlayerID,),
                        MyTeamPlayer(image: global.forvet2Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.forvet2Kits,
                          name: global.forvet2PlayerShortName==null?'Boş':global.forvet2PlayerShortName,
                          top: konum.forvet2top * _fieldH, right: konum.forvet2right * _width, left:  konum.forvet2left  * _width,
                          position: "LWF",gideceksayfa: 'kaleci',pozisyon: '3',neresi: 'Forvet2',
                          band: global.forvet2PlayerID==global.captain||global.forvet2PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.forvet2PlayerID==global.captain? 'K':global.forvet2PlayerID==global.spareCaptain?'YK':'',
                          playerid: global.forvet2PlayerID,),
                        MyTeamPlayer(image: global.forvet3Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.forvet3Kits,
                          name: global.forvet3PlayerShortName==null?'Boş':global.forvet3PlayerShortName,
                          top: konum.forvet3top * _fieldH, right: konum.forvet3right * _width, left:  konum.forvet3left * _width,
                          position: "LWF",gideceksayfa: 'kaleci',pozisyon: '3',neresi: 'Forvet3',
                          band: global.forvet3PlayerID==global.captain||global.forvet3PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.forvet3PlayerID==global.captain? 'K':global.forvet3PlayerID==global.spareCaptain?'YK':'',
                          playerid: global.forvet3PlayerID,),

                        /* MyTeamPlayer(image: global.forvet1Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.forvet1Kits, name: global.forvet1PlayerShortName==null?'Boş':global.forvet1PlayerShortName, top: 0.85090909 * _fieldH, right: 0.0 * _width, left: 0.22154 * _width, position: "LWF",gideceksayfa: 'kaleci',pozisyon: '3',neresi: 'Forvet1',band: global.forvet1PlayerID==global.captain||global.forvet1PlayerID==global.spareCaptain? 1:0,who:global.forvet1PlayerID==global.captain? 'K':   global.forvet1PlayerID==global.spareCaptain?'YK':'',playerid: global.forvet1PlayerID,),
                        MyTeamPlayer(image: global.forvet2Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.forvet2Kits, name: global.forvet2PlayerShortName==null?'Boş':global.forvet2PlayerShortName, top: 0.65090909 * _fieldH, right: 0.24333333 * _width, left: 0.0 * _width, position: "LWF",gideceksayfa: 'kaleci',pozisyon: '3',neresi: 'Forvet2',band: global.forvet2PlayerID==global.captain||global.forvet2PlayerID==global.spareCaptain? 1:0,who:global.forvet2PlayerID==global.captain? 'K':global.forvet2PlayerID==global.spareCaptain?'YK':'',playerid: global.forvet2PlayerID,),
                        MyTeamPlayer(image: global.forvet3Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.forvet3Kits, name: global.forvet3PlayerShortName==null?'Boş':global.forvet3PlayerShortName, top: 0.65090909 * _fieldH, right: 0.0 * _width, left: 0.24333333 * _width, position: "LWF",gideceksayfa: 'kaleci',pozisyon: '3',neresi: 'Forvet3',band: global.forvet3PlayerID==global.captain||global.forvet3PlayerID==global.spareCaptain? 1:0,who:global.forvet3PlayerID==global.captain? 'K':global.forvet3PlayerID==global.spareCaptain?'YK':'',playerid: global.forvet3PlayerID,), */

                        // CaptainArmband(who: 'K',top: 0.69090909 * _fieldH, right: 0.0 * _width, left: 0.34333333 * _width,visibilty: 1,),
                      ]
                      ), */
                    )
                )
            ),
          ); }
    );
  }

}


