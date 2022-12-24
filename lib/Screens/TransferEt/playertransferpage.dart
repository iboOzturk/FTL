import 'package:fantasysuperlig/Animasyon/animasyon.dart';
import 'package:fantasysuperlig/Services/admobservice.dart';
///Admob
//import 'package:fantasysuperlig/Services/admobservice.dart';
import 'package:fantasysuperlig/Services/api_service.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:fantasysuperlig/widgets/BankDetailWidget.dart';
import 'package:fantasysuperlig/widgets/captainarmband.dart';
import 'package:fantasysuperlig/widgets/oyuncu.dart';
import 'package:fantasysuperlig/widgets/sizedboxdenemewidget.dart';
import 'package:fantasysuperlig/widgets/transferplayer.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
///Admob
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:horizontal_data_table/refresh/hdt_refresh_controller.dart';
import 'package:line_icons/line_icons.dart';
import 'package:unity_ads_plugin/unity_ads.dart';
import '/widgets/player.dart';
import '/widgets/myteamplayer.dart';
import '../../Variables/global.dart' as global;
import '../../Variables/konum.dart' as konum;
import 'dart:async';

class PlayerTransferPage extends StatefulWidget {
  @override
  _PlayerTransferPageState createState() => _PlayerTransferPageState();
}
List<String> playerInfo(String boxname){
  for(var f in global.takimim){

  }
}
class _PlayerTransferPageState extends State<PlayerTransferPage> {
  int sayac=0;
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  int kaptanid=0;
  Giris _giris=Giris();

  Future<void> loginnes() async{
    await getTakimim(global.userid);
  }
  @override
  void initState() {
    UnityAds.init(gameId: '4376159');
    defanssayac();
    ortasahasayac();
    forvetsayac();
    _giris.getBankInfo();
    getBannerAds();
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
    await Future.delayed(Duration(milliseconds: 360));
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
  void dispose() {
    //AdmobHelper.getBannerAd().dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    final double _fieldH = 0.8143399 * _height;

    int defansYedekSay=0;
    int ortasahaYedekSay=0;
    int forvetYedekSay=0;
    int defansYedekPID;          int defansYedek2PID;
    String defansYedekKits;   String defansYedek2Kits;
    String defansYedekSN;     String defansYedek2SN;
    String defansYedekValue;  String defansYedek2Value;
    String defansYedekEmp;    String defansYedek2Emp;
    String defansYedekPos;    String defansYedek2Pos;
    int defansYedekBand;      int defansYedek2Band;
    int defansYedekWho;       int defansYedek2Who;
    int defansYedekLeave;     int defansYedek2Leave;
    int defansYedekinjury;     int defansYedek2injury;

    int    ortasahaYedekPID;   int    ortasahaYedek2PID;
    String ortasahaYedekKits;  String ortasahaYedek2Kits;
    String ortasahaYedekSN;    String ortasahaYedek2SN;
    String ortasahaYedekValue; String ortasahaYedek2Value;
    String ortasahaYedekEmp;   String ortasahaYedek2Emp;
    String ortasahaYedekPos;   String ortasahaYedek2Pos;
    int ortasahaYedekBand;      int ortasahaYedek2Band;
    int ortasahaYedekWho;       int ortasahaYedek2Who;
    int ortasahaYedekLeave;   int ortasahaYedek2Leave;
    int ortasahaYedekinjury;     int ortasahaYedek2injury;

    int    forvetYedekPID;    int    forvetYedek2PID;
    String forvetYedekKits;   String forvetYedek2Kits;
    String forvetYedekSN;     String forvetYedek2SN;
    String forvetYedekValue ; String forvetYedek2Value;
    String forvetYedekEmp;    String forvetYedek2Emp;
    String forvetYedekPos;    String forvetYedek2Pos;
    int forvetYedekBand;      int forvetYedek2Band;
    int forvetYedekWho;       int forvetYedek2Who;
    int forvetYedekLeave;   int forvetYedek2Leave;
    int forvetYedekinjury;     int forvetYedek2injury;

    if(global.yedek0Pos=='1'){
      if(defansYedekSay==0){
        defansYedekSay=defansYedekSay+1;
        defansYedekPID=global.yedek0PlayerID;
        defansYedekSN=global.yedek0PlayerShortName;
        defansYedekKits=global.yedek0Kits;
        defansYedekValue=global.yedek0Value;
        defansYedekEmp=global.yedek0emp;
        defansYedekPos=global.yedek0Pos;
        defansYedekBand=global.yedek0PlayerID;
        defansYedekWho=global.yedek0PlayerID;
        defansYedekLeave=global.Y0leave;
        defansYedekinjury=global.Y0injury;
      }
      else {
        defansYedek2PID = global.yedek0PlayerID;
        defansYedek2SN = global.yedek0PlayerShortName;
        defansYedek2Kits = global.yedek0Kits;
        defansYedek2Value = global.yedek0Value;
        defansYedek2Emp = global.yedek0emp;
        defansYedek2Pos = global.yedek0Pos;
        defansYedek2Band=global.yedek0PlayerID;
        defansYedek2Who=global.yedek0PlayerID;
        defansYedek2Leave=global.Y0leave;
        defansYedek2injury=global.Y0injury;
      }
    }
    else if(global.yedek0Pos=='2'){
      if(ortasahaYedekSay==0){
        ortasahaYedekSay=ortasahaYedekSay+1;
        ortasahaYedekPID=global.yedek0PlayerID;
        ortasahaYedekSN=global.yedek0PlayerShortName;
        ortasahaYedekKits=global.yedek0Kits;
        ortasahaYedekValue=global.yedek0Value;
        ortasahaYedekEmp=global.yedek0emp;
        ortasahaYedekPos=global.yedek0Pos;
        ortasahaYedekBand=global.yedek0PlayerID;
        ortasahaYedekWho=global.yedek0PlayerID;
        ortasahaYedekLeave=global.Y0leave;
        ortasahaYedekinjury=global.Y0injury;
      }
      else {
        ortasahaYedek2PID = global.yedek0PlayerID;
        ortasahaYedek2SN = global.yedek0PlayerShortName;
        ortasahaYedek2Kits = global.yedek0Kits;
        ortasahaYedek2Value = global.yedek0Value;
        ortasahaYedek2Emp = global.yedek0emp;
        ortasahaYedek2Pos = global.yedek0Pos;
        ortasahaYedek2Band=global.yedek0PlayerID;
        ortasahaYedek2Who=global.yedek0PlayerID;
        ortasahaYedek2Leave=global.Y0leave;
        ortasahaYedek2injury=global.Y0injury;
      }
    }
    else if(global.yedek0Pos=='3'){
      if(forvetYedekSay==0){
        forvetYedekSay=forvetYedekSay+1;
        forvetYedekPID=global.yedek0PlayerID;
        forvetYedekSN=global.yedek0PlayerShortName;
        forvetYedekKits=global.yedek0Kits;
        forvetYedekValue=global.yedek0Value;
        forvetYedekEmp=global.yedek0emp;
        forvetYedekPos=global.yedek0Pos;
        forvetYedekBand=global.yedek0PlayerID;
        forvetYedekWho=global.yedek0PlayerID;
        forvetYedekLeave=global.Y0leave;
        forvetYedekinjury=global.Y0injury;
      }
      else {
        forvetYedek2PID = global.yedek0PlayerID;
        forvetYedek2SN = global.yedek0PlayerShortName;
        forvetYedek2Kits = global.yedek0Kits;
        forvetYedek2Value = global.yedek0Value;
        forvetYedek2Emp = global.yedek0emp;
        forvetYedek2Pos = global.yedek0Pos;
        forvetYedek2Band=global.yedek0PlayerID;
        forvetYedek2Who=global.yedek0PlayerID;
        forvetYedek2Leave=global.Y0leave;
        forvetYedek2injury=global.Y0injury;
      }
    }

    if(global.yedek1Pos=='1'){
      if(defansYedekSay==0){
        defansYedekSay=defansYedekSay+1;
        defansYedekPID=global.yedek1PlayerID;
        defansYedekSN=global.yedek1PlayerShortName;
        defansYedekKits=global.yedek1Kits;
        defansYedekValue=global.yedek1Value;
        defansYedekEmp=global.yedek1emp;
        defansYedekPos=global.yedek1Pos;
        defansYedekBand=global.yedek1PlayerID;
        defansYedekWho=global.yedek1PlayerID;
        defansYedekLeave=global.Y1leave;
        defansYedekinjury=global.Y1injury;
      }
      else {
        defansYedek2PID = global.yedek1PlayerID;
        defansYedek2SN = global.yedek1PlayerShortName;
        defansYedek2Kits = global.yedek1Kits;
        defansYedek2Value = global.yedek1Value;
        defansYedek2Emp = global.yedek1emp;
        defansYedek2Pos = global.yedek1Pos;
        defansYedek2Band=global.yedek1PlayerID;
        defansYedek2Who=global.yedek1PlayerID;
        defansYedek2Leave=global.Y1leave;
        defansYedek2injury=global.Y1injury;
      }
    }
    else if(global.yedek1Pos=='2'){
      if(ortasahaYedekSay==0){
        ortasahaYedekSay=ortasahaYedekSay+1;
        ortasahaYedekPID=global.yedek1PlayerID;
        ortasahaYedekSN=global.yedek1PlayerShortName;
        ortasahaYedekKits=global.yedek1Kits;
        ortasahaYedekValue=global.yedek1Value;
        ortasahaYedekEmp=global.yedek1emp;
        ortasahaYedekPos=global.yedek1Pos;
        ortasahaYedekBand=global.yedek1PlayerID;
        ortasahaYedekWho=global.yedek1PlayerID;
        ortasahaYedekLeave=global.Y1leave;
        ortasahaYedekinjury=global.Y1injury;
      }
      else {
        ortasahaYedek2PID = global.yedek1PlayerID;
        ortasahaYedek2SN = global.yedek1PlayerShortName;
        ortasahaYedek2Kits = global.yedek1Kits;
        ortasahaYedek2Value = global.yedek1Value;
        ortasahaYedek2Emp = global.yedek1emp;
        ortasahaYedek2Pos = global.yedek1Pos;
        ortasahaYedek2Band=global.yedek1PlayerID;
        ortasahaYedek2Who=global.yedek1PlayerID;
        ortasahaYedek2Leave=global.Y1leave;
        ortasahaYedek2injury=global.Y1injury;
      }
    }
    else if(global.yedek1Pos=='3'){
      if(forvetYedekSay==0){
        forvetYedekSay=forvetYedekSay+1;
        forvetYedekPID=global.yedek1PlayerID;
        forvetYedekSN=global.yedek1PlayerShortName;
        forvetYedekKits=global.yedek1Kits;
        forvetYedekValue=global.yedek1Value;
        forvetYedekEmp=global.yedek1emp;
        forvetYedekPos=global.yedek1Pos;
        forvetYedekBand=global.yedek1PlayerID;
        forvetYedekWho=global.yedek1PlayerID;
        forvetYedekLeave=global.Y1leave;
        forvetYedekinjury=global.Y1injury;
      }
      else {
        forvetYedek2PID = global.yedek1PlayerID;
        forvetYedek2SN = global.yedek1PlayerShortName;
        forvetYedek2Kits = global.yedek1Kits;
        forvetYedek2Value = global.yedek1Value;
        forvetYedek2Emp = global.yedek1emp;
        forvetYedek2Pos = global.yedek1Pos;
        forvetYedek2Band=global.yedek1PlayerID;
        forvetYedek2Who=global.yedek1PlayerID;
        forvetYedek2Leave=global.Y1leave;
        forvetYedek2injury=global.Y1injury;
      }
    }

    if(global.yedek2Pos=='1'){
      if(defansYedekSay==0){
        defansYedekSay=defansYedekSay+1;
        defansYedekPID=global.yedek2PlayerID;
        defansYedekSN=global.yedek2PlayerShortName;
        defansYedekKits=global.yedek2Kits;
        defansYedekValue=global.yedek2Value;
        defansYedekEmp=global.yedek2emp;
        defansYedekPos=global.yedek2Pos;
        defansYedekBand=global.yedek2PlayerID;
        defansYedekWho=global.yedek2PlayerID;
        defansYedekLeave=global.Y2leave;
        defansYedekinjury=global.Y2injury;
      }
      else {
        defansYedek2PID = global.yedek2PlayerID;
        defansYedek2SN = global.yedek2PlayerShortName;
        defansYedek2Kits = global.yedek2Kits;
        defansYedek2Value = global.yedek2Value;
        defansYedek2Emp = global.yedek2emp;
        defansYedek2Pos = global.yedek2Pos;
        defansYedek2Band=global.yedek2PlayerID;
        defansYedek2Who=global.yedek2PlayerID;
        defansYedek2Leave=global.Y2leave;
        defansYedek2injury=global.Y2injury;
      }
    }
    else if(global.yedek2Pos=='2'){
      if(ortasahaYedekSay==0){
        ortasahaYedekSay=ortasahaYedekSay+1;
        ortasahaYedekPID=global.yedek2PlayerID;
        ortasahaYedekSN=global.yedek2PlayerShortName;
        ortasahaYedekKits=global.yedek2Kits;
        ortasahaYedekValue=global.yedek2Value;
        ortasahaYedekEmp=global.yedek2emp;
        ortasahaYedekPos=global.yedek2Pos;
        ortasahaYedekBand=global.yedek2PlayerID;
        ortasahaYedekWho=global.yedek2PlayerID;
        ortasahaYedekLeave=global.Y2leave;
        ortasahaYedekinjury=global.Y2injury;
      }
      else {
        ortasahaYedek2PID = global.yedek2PlayerID;
        ortasahaYedek2SN = global.yedek2PlayerShortName;
        ortasahaYedek2Kits = global.yedek2Kits;
        ortasahaYedek2Value = global.yedek2Value;
        ortasahaYedek2Emp = global.yedek2emp;
        ortasahaYedek2Pos = global.yedek2Pos;
        ortasahaYedek2Band=global.yedek2PlayerID;
        ortasahaYedek2Who=global.yedek2PlayerID;
        ortasahaYedek2Leave=global.Y2leave;
        ortasahaYedek2injury=global.Y2injury;
      }
    }
    else if(global.yedek2Pos=='3'){
      if(forvetYedekSay==0){
        forvetYedekSay=forvetYedekSay+1;
        forvetYedekPID=global.yedek2PlayerID;
        forvetYedekSN=global.yedek2PlayerShortName;
        forvetYedekKits=global.yedek2Kits;
        forvetYedekValue=global.yedek2Value;
        forvetYedekEmp=global.yedek2emp;
        forvetYedekPos=global.yedek2Pos;
        forvetYedekBand=global.yedek2PlayerID;
        forvetYedekWho=global.yedek2PlayerID;
        forvetYedekLeave=global.Y2leave;
        forvetYedekinjury=global.Y2injury;
      }
      else {
        forvetYedek2PID = global.yedek2PlayerID;
        forvetYedek2SN = global.yedek2PlayerShortName;
        forvetYedek2Kits = global.yedek2Kits;
        forvetYedek2Value = global.yedek2Value;
        forvetYedek2Emp = global.yedek2emp;
        forvetYedek2Pos = global.yedek2Pos;
        forvetYedek2Band=global.yedek2PlayerID;
        forvetYedek2Who=global.yedek2PlayerID;
        forvetYedek2Leave=global.Y2leave;
        forvetYedek2injury=global.Y2injury;
      }
    }
    return FutureBuilder(
        future: getTakimim(global.userid),
        builder: (BuildContext context,AsyncSnapshot snapshot){

          if(snapshot.connectionState==ConnectionState.waiting){
            //return Center(child: CircularProgressIndicator());
            return Scaffold(
              appBar: new AppBar(
                // backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
                flexibleSpace: Container(
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
                ),
                elevation: 0.0,
                centerTitle: true,
                title: new Text('Transfer\n'
                    'Hafta ${global.teamhaftaID}',style: TextStyle(fontSize: 17),),
                actions: [
                  TextButton(child: Container(child: Text('Tamam',style: TextStyle(fontSize: 18,color: Colors.white),
                    textAlign: TextAlign.center,)),
                    onPressed: () {
                    Navigator.pushNamed(context,'/menu');
                  },),
                ],
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios,color: Colors.transparent,),
                  onPressed: () {
                    // Navigator.pushNamed(context,'/menu');
                  },),
              ),
              body: SafeArea(
                  child: Container(
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
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        CircularProgressIndicator(color: Colors.white,),
                        SizedBox(height: 25,),
                        Text('Takımın yükleniyor...',style: TextStyle(fontSize: 25,color: Colors.white),)

                      ],
                    ),
                  )
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: _refreshData,
            child: new Container(
                child: WillPopScope(
                  onWillPop: () {
                    Navigator.pushNamed(context, '/menu');
                  },
                  child: new Scaffold(

                     // backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
                      appBar: new AppBar(
                       // backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
                        flexibleSpace: Container(
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
                        ),
                        elevation: 0.0,
                        centerTitle: true,
                        title: new Text('Transfer\n'
                            'Hafta ${global.teamhaftaID}',style: TextStyle(fontSize: 17),),
                        actions: [
                          TextButton(child: Container(child: Text('Tamam',style: TextStyle(fontSize: 18,color: Colors.white),textAlign: TextAlign.center,)),onPressed: () {
                            Navigator.pushNamed(context,'/menu');
                          },),
                        ],
                        leading: new IconButton(
                          icon: new Icon(Icons.arrow_back_ios,color: Colors.transparent,),
                          onPressed: () {
                           // Navigator.pushNamed(context,'/menu');
                            },),
                      ),
                      body:
                      SafeArea(
                          child: Container(
                            width:MediaQuery.of(context).size.width ,height: MediaQuery.of(context).size.height,
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
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(alignment: Alignment.center,
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ///bütçe,free,transpuan,maliyet
                                        BankContainer(baslik: 'Bütçe', deger:global.Butce),
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
                                                  child: Text('Free Transfer',
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

                                                  child: Text('${global.FreeTransfer}',
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
                                                  child: Text('Transfer Puanı',
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

                                                  //child: Text('${global.TransferPuan}',
                                                  child: Text(global.TransferPuan.toString(),
                                                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),)
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(width: 10.0),
                                        Container(
                                          width: 105,height: 36,decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.red.shade700,width: 1)
                                        ),
                                          child: Column(
                                            children: [
                                              Container(alignment: Alignment.center,
                                                  width: 105,height: 16,decoration: BoxDecoration(
                                                    color: Color.fromARGB(255, 55, 0, 60 ),
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                  child: Text('Harcanan Puan',
                                                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),
                                                    textAlign: TextAlign.center,)
                                              ),
                                              SizedBox(height: 1,),
                                              Container(alignment: Alignment.center,
                                                  width: 105,height: 16,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red.shade700,
                                                    // color: Colors.purple.shade700,
                                                    //color: Color.fromARGB(255, 255, 102, 0),
                                                    borderRadius: BorderRadius.circular(15),),
                                                  //Color.fromARGB(99, 79, 35, 84 ),

                                                  child: Text('${global.Expense==null?'0':global.Expense}',
                                                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),)
                                              ),
                                            ],
                                          ),
                                        ),

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
                                      //  SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                                        // SizedBox(height: 120,),
                                        ///Kaleci
                                        Expanded(
                                          flex:2,
                                          child: FadeAnimation(
                                            sayac==0? 1:0.4, Column(
                                              children: [
                                                Expanded(flex: 1,child: SizedBox(height: 60,)),
                                                Expanded(flex: 4,
                                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      TransferPlayer(image: global.kaleci0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.kaleci0Kits,
                                                        name:global.kaleci0PlayerShortName==null?'Boş21':global.kaleci0PlayerShortName,
                                                        position: "GK",gideceksayfa: 'myteam',
                                                        pozisyon: global.kaleci0Pos,neresi: 'Kaleci0',
                                                        band:global.kaleci0PlayerID==global.captain
                                                        //    ||global.kaleci0PlayerID==global.spareCaptain
                                                                &&global.captain!=null
                                                       //         &&global.spareCaptain!=null
                                                            ? 1:0,
                                                        who:global.kaleci0PlayerID==global.captain? 'K':
                                                     //   global.kaleci0PlayerID==global.spareCaptain?'YK':
                                                        '',
                                                        playerid: global.kaleci0PlayerID,
                                                        gorunurluk: global.kaleci0PlayerShortName==null?true: global.kaleci0vis,value: global.kaleci0Value==null?'-':global.kaleci0Value+'M ₺',
                                                        sorunne: global.K0injury==1?'!':global.K0leave==1?'X':'',
                                                        sorun: global.K0injury==1?1:global.K0leave==1?1:0,
                                                      ),
                                                      SizedBox(width: 5,),
                                                      TransferPlayer(
                                                        image: global.kaleci1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.kaleci1Kits,
                                                        name: global.kaleci1PlayerShortName==null?'Boş20':global.kaleci1PlayerShortName,
                                                        position: "GK",gideceksayfa: 'myteam',
                                                        pozisyon: global.kaleci1Pos,neresi: 'YedekKaleci',
                                                        band: global.kaleci1PlayerID==global.captain
                                                      //      ||global.kaleci1PlayerID==global.spareCaptain
                                                                &&global.captain!=null
                                                      //          &&global.spareCaptain!=null
                                                            ? 1:0,who:global.kaleci1PlayerID==global.captain? 'K':
                                                    //  global.kaleci1PlayerID==global.spareCaptain?'YK':
                                                      '',
                                                        playerid: global.kaleci1PlayerID,
                                                        gorunurluk: global.kaleci1PlayerShortName==null?true:global.kaleci1vis,
                                                        value:global.kaleci1Value==null?'-':global.kaleci1Value+'M ₺',
                                                        sorunne: global.K1injury==1?'!':global.K1leave==1?'X':'',
                                                        sorun: global.K1injury==1?1:global.K1leave==1?1:0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                     //   SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                                        //SizedBox(height: 20,),
                                        ///Defanslar
                                        Expanded(
                                          flex: 2,
                                          child: FadeAnimation(
                                            sayac==0? 1.4:0.4, Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                TransferPlayer(image: global.defans0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans0Kits,
                                                  name:global.defans0PlayerShortName==null?'Boş19':global.defans0PlayerShortName,
                                                  position: "GK",gideceksayfa: 'myteam',
                                                  pozisyon: global.defans0Pos,neresi: 'Defans0',
                                                  band:global.defans0PlayerID==global.captain
                                                   //   ||global.defans0PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                  //        &&global.spareCaptain!=null
                                                      ? 1:0,who:global.defans0PlayerID==global.captain? 'K':
                                               //   global.defans0PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: global.defans0PlayerID,
                                                  gorunurluk:global.defans0PlayerShortName==null?true: global.defans0vis,
                                                  value: global.defans0Value==null?'-':global.defans0Value+'M ₺',
                                                  sorunne: global.D0injury==1?'!':global.D0leave==1?'X':'',
                                                  sorun: global.D0injury==1?1:global.D0leave==1?1:0,
                                                ),
                                                SizedBox(width: 5,),
                                                TransferPlayer(image: global.defans1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans1Kits,
                                                  name: global.defans1PlayerShortName==null?'Boş18':global.defans1PlayerShortName,
                                                  position: "CB",gideceksayfa: 'myteam',pozisyon: global.defans1Pos,neresi: 'Defans1',
                                                  band:global.defans1PlayerID==global.captain
                                                  //    ||global.defans1PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                  //        &&global.spareCaptain!=null
                                                      ? 1:0,who:global.defans1PlayerID==global.captain? 'K':
                                                //  global.defans1PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: global.defans1PlayerID,
                                                  gorunurluk:global.defans1PlayerShortName==null?true: global.defans1vis,
                                                  value: global.defans1Value==null?'-':global.defans1Value+'M ₺',
                                                  sorunne: global.D1injury==1?'!':global.D1leave==1?'X':'',
                                                  sorun: global.D1injury==1?1:global.D1leave==1?1:0,
                                                ),
                                                SizedBox(width: 5,),
                                                TransferPlayer(image: global.defans2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans2Kits,
                                                  name: global.defans2PlayerShortName==null?'Boş17':global.defans2PlayerShortName,
                                                  position: "CB",gideceksayfa: 'myteam',pozisyon:global.defans2Pos,neresi: 'Defans2',
                                                  band: global.defans2PlayerID==global.captain
                                                   //   ||global.defans2PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                    //      &&global.spareCaptain!=null
                                                      ? 1:0,who:global.defans2PlayerID==global.captain? 'K':
                                                //  global.defans2PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: global.defans2PlayerID,
                                                  gorunurluk:global.defans2PlayerShortName==null?true: global.defans2vis,
                                                  value: global.defans2Value==null?'-':global.defans2Value+'M ₺',
                                                  sorunne: global.D2injury==1?'!':global.D2leave==1?'X':'',
                                                  sorun: global.D2injury==1?1:global.D2leave==1?1:0,
                                                ),
                                                SizedBox(width: 5,),
                                                TransferPlayer(image: global.defans3Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans3Kits,
                                                  name: global.defans3PlayerShortName==null?'Boş16':global.defans3PlayerShortName,
                                                  position: "CB",gideceksayfa: 'myteam',pozisyon: global.defans3Pos,neresi: 'Defans3',
                                                  band: global.defans3PlayerID==global.captain
                                                  //    ||global.defans3PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                   //       &&global.spareCaptain!=null
                                                      ? 1:0,who:global.defans3PlayerID==global.captain? 'K':
                                                //  global.defans3PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: global.defans3PlayerID,
                                                  gorunurluk:global.defans3PlayerShortName==null?true:  global.defans3vis,
                                                  value: global.defans3Value==null?'-':global.defans3Value+'M ₺',
                                                  sorunne: global.D3injury==1?'!':global.D3leave==1?'X':'',
                                                  sorun: global.D3injury==1?1:global.D3leave==1?1:0,
                                                ),
                                                SizedBox(width: 5,),
                                                TransferPlayer(image: global.defans4Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans4Kits,
                                                  name: global.defans4PlayerShortName==null?'Boş15':global.defans4PlayerShortName,
                                                  position: "LB",gideceksayfa: 'myteam',pozisyon: global.defans4Pos,neresi: 'Defans4',
                                                  band: global.defans4PlayerID==global.captain
                                                   //   ||global.defans4PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                    //      &&global.spareCaptain!=null
                                                      ? 1:0,who:global.defans4PlayerID==global.captain? 'K':
                                                //  global.defans4PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: global.defans4PlayerID,
                                                  gorunurluk:global.defans4PlayerShortName==null?true: global.defans4vis,
                                                  value:global.defans4Value==null?'-':global.defans4Value+'M ₺',
                                                  sorunne: global.D4injury==1?'!':global.D4leave==1?'X':'',
                                                  sorun: global.D4injury==1?1:global.D4leave==1?1:0,
                                                ),
                                                SizedBox(width: 5,),
                                                TransferPlayer(image: defansYedekKits==null?'https://ftl.allryazilim.com/image/boskit.png':defansYedekKits,
                                                  name:defansYedekSN==null?'Boş14':defansYedekSN,
                                                  position: "LB",gideceksayfa: 'myteam',pozisyon: defansYedekPos,neresi: defansYedekEmp,
                                                //  band: global.defans4PlayerID==global.captain
                                                  band: defansYedekBand==global.captain
                                                  //    ||global.defans4PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                    //      &&global.spareCaptain!=null
                                                      ? 1:0,
                                                 // who:global.defans4PlayerID==global.captain? 'K':
                                                  who:defansYedekWho==global.captain? 'K':
                                                 // global.defans4PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: defansYedekPID,
                                                  gorunurluk:defansYedekSN==null?true: false,
                                                  value: defansYedekValue==null?'-':defansYedekValue+'M ₺',
                                                  sorunne: defansYedekinjury==1?'!':defansYedekLeave==1?'X':'',
                                                  sorun: defansYedekinjury==1?1:defansYedekLeave==1?1:0,
                                                ),
                                                SizedBox(width: 5,),
                                                TransferPlayer(image: defansYedek2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':defansYedek2Kits,
                                                  name:defansYedek2SN==null?'Boş13':defansYedek2SN,
                                                  position: "LB",gideceksayfa: 'myteam',pozisyon: defansYedek2Pos,neresi: defansYedek2Emp,
                                                  band: defansYedek2Band==global.captain
                                                 //     ||global.defans4PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                  //        &&global.spareCaptain!=null
                                                      ? 1:0,who:defansYedek2Who==global.captain? 'K':
                                                //  global.defans4PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: defansYedek2PID,
                                                  gorunurluk:defansYedek2SN==null?true: false,
                                                  value: defansYedek2Value==null?'-':defansYedek2Value+'M ₺',
                                                  sorunne: defansYedek2injury==1?'!':defansYedek2Leave==1?'X':'',
                                                  sorun: defansYedek2injury==1?1:defansYedek2Leave==1?1:0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                       // SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                                        // SizedBox(height: 20,),
                                        ///Ortasaha
                                        Expanded(
                                          flex: 2,
                                          child: FadeAnimation(
                                            sayac==0? 1.8:0.4, Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                TransferPlayer(image: global.ortasaha0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha0Kits,
                                                  name: global.ortasaha0PlayerShortName==null?'Boş12':global.ortasaha0PlayerShortName,
                                                  position: "LMF",gideceksayfa: 'myteam',pozisyon: global.ortasaha0Pos,neresi: 'OrtaSaha0',
                                                  band: global.ortasaha0PlayerID==global.captain
                                                    //  ||global.ortasaha0PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                   //       &&global.spareCaptain!=null
                                                      ? 1:0,who:global.ortasaha0PlayerID==global.captain? 'K':
                                               //   global.ortasaha0PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: global.ortasaha0PlayerID,
                                                  gorunurluk:global.ortasaha0PlayerShortName==null?true:   global.ortasaha0vis,
                                                  value: global.ortasaha0Value==null?'-':global.ortasaha0Value+'M ₺',
                                                  sorunne: global.OS0injury==1?'!':global.OS0leave==1?'X':'',
                                                  sorun: global.OS0injury==1?1:global.OS0leave==1?1:0,
                                                ),
                                                SizedBox(width: 5,),
                                                TransferPlayer(image: global.ortasaha1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha1Kits,
                                                  name: global.ortasaha1PlayerShortName==null?'Boş11':global.ortasaha1PlayerShortName,
                                                  position: "AMF",gideceksayfa: 'myteam',pozisyon: global.ortasaha1Pos,neresi: 'OrtaSaha1',
                                                  band: global.ortasaha1PlayerID==global.captain
                                                     // ||global.ortasaha1PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                         // &&global.spareCaptain!=null
                                                      ? 1:0,who:global.ortasaha1PlayerID==global.captain? 'K':
                                                  //global.ortasaha1PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: global.ortasaha1PlayerID,
                                                  gorunurluk: global.ortasaha1PlayerShortName==null?true: global.ortasaha1vis,
                                                    value: global.ortasaha1Value==null?'-':global.ortasaha1Value+'M ₺',
                                                  sorunne: global.OS1injury==1?'!':global.OS1leave==1?'X':'',
                                                  sorun: global.OS1injury==1?1:global.OS1leave==1?1:0,
                                                ),
                                                SizedBox(width: 5,),
                                                TransferPlayer(image: global.ortasaha2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha2Kits,
                                                  name: global.ortasaha2PlayerShortName==null?'Boş10':global.ortasaha2PlayerShortName,
                                                  position: "AMF",gideceksayfa: 'myteam',pozisyon: global.ortasaha2Pos,neresi: 'OrtaSaha2',
                                                  band: global.ortasaha2PlayerID==global.captain
                                                      //||global.ortasaha2PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                    //      &&global.spareCaptain!=null
                                                      ? 1:0,who:global.ortasaha2PlayerID==global.captain? 'K':
                                                //  global.ortasaha2PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: global.ortasaha2PlayerID,
                                                  gorunurluk:global.ortasaha2PlayerShortName==null?true:  global.ortasaha2vis,
                                                    value: global.ortasaha2Value==null?'-':global.ortasaha2Value==null?'-':global.ortasaha2Value+'M ₺',
                                                  sorunne: global.OS2injury==1?'!':global.OS2leave==1?'X':'',
                                                  sorun: global.OS2injury==1?1:global.OS2leave==1?1:0,
                                                ),
                                                SizedBox(width: 5,),
                                                TransferPlayer(image: global.ortasaha3Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha3Kits,
                                                  name: global.ortasaha3PlayerShortName==null?'Boş9':global.ortasaha3PlayerShortName,
                                                  position: "AMF",gideceksayfa: 'myteam',pozisyon: global.ortasaha3Pos,neresi: 'OrtaSaha3',
                                                  band: global.ortasaha3PlayerID==global.captain
                                                     // ||global.ortasaha3PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                   //       &&global.spareCaptain!=null
                                                      ? 1:0,who:global.ortasaha3PlayerID==global.captain? 'K':
                                                 // global.ortasaha3PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: global.ortasaha3PlayerID,
                                                  gorunurluk:global.ortasaha3PlayerShortName==null?true:  global.ortasaha3vis,
                                                    value: global.ortasaha3Value==null?'-':global.ortasaha3Value+'M ₺',
                                                  sorunne: global.OS3injury==1?'!':global.OS3leave==1?'X':'',
                                                  sorun: global.OS3injury==1?1:global.OS3leave==1?1:0,
                                                ),
                                                SizedBox(width: 5,),
                                                TransferPlayer(image: global.ortasaha4Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha4Kits,
                                                  name: global.ortasaha4PlayerShortName==null?'Boş8':global.ortasaha4PlayerShortName,
                                                  position: "RMF",gideceksayfa: 'myteam',pozisyon: global.ortasaha4Pos,neresi: 'OrtaSaha4',
                                                  band: global.ortasaha4PlayerID==global.captain
                                                 //     ||global.ortasaha4PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                //          &&global.spareCaptain!=null
                                                      ? 1:0,who:global.ortasaha4PlayerID==global.captain? 'K':
                                                //  global.ortasaha4PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: global.ortasaha4PlayerID,
                                                  gorunurluk: global.ortasaha4PlayerShortName==null?true: global.ortasaha4vis,
                                                    value:global.ortasaha4Value==null?'-': global.ortasaha4Value+'M ₺',
                                                  sorunne: global.OS4injury==1?'!':global.OS4leave==1?'X':'',
                                                  sorun: global.OS4injury==1?1:global.OS4leave==1?1:0,

                                                ),
                                                SizedBox(width: 5,),
                                                TransferPlayer(image: ortasahaYedekKits==null?'https://ftl.allryazilim.com/image/boskit.png':ortasahaYedekKits,
                                                  name:ortasahaYedekSN==null?'Boş7':ortasahaYedekSN,
                                                  position: "LB",gideceksayfa: 'myteam',pozisyon: ortasahaYedekPos,neresi: ortasahaYedekEmp,
                                                  band: ortasahaYedekBand==global.captain
                                                  //    ||global.defans4PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                //          &&global.spareCaptain!=null
                                                      ? 1:0,who:ortasahaYedekWho==global.captain? 'K':
                                              //    global.defans4PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: ortasahaYedekPID,
                                                  gorunurluk:ortasahaYedekSN==null?true: false,
                                                  value:ortasahaYedekValue==null?'-': ortasahaYedekValue+'M ₺',
                                                  sorunne: ortasahaYedekinjury==1?'!':ortasahaYedekLeave==1?'X':'',
                                                  sorun: ortasahaYedekinjury==1?1:ortasahaYedekLeave==1?1:0,
                                                ),
                                                SizedBox(width: 5,),

                                                TransferPlayer(image: ortasahaYedek2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':ortasahaYedek2Kits,
                                                  name:ortasahaYedek2SN==null?'Boş6':ortasahaYedek2SN,
                                                  position: "LB",gideceksayfa: 'myteam',pozisyon: ortasahaYedek2Pos,neresi: ortasahaYedek2Emp,
                                                  band: ortasahaYedek2Band==global.captain
                                              //        ||global.defans4PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                            //              &&global.spareCaptain!=null
                                                      ? 1:0,who:ortasahaYedek2Who==global.captain? 'K':
                                        //        global.defans4PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: ortasahaYedek2PID,
                                                  gorunurluk:ortasahaYedek2SN==null?true: false,
                                                  value:ortasahaYedek2Value==null?'-': ortasahaYedek2Value+'M ₺',
                                                  sorunne: ortasahaYedek2injury==1?'!':ortasahaYedek2Leave==1?'X':'',
                                                  sorun:ortasahaYedek2injury==1?1:ortasahaYedek2Leave==1?1:0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                       // SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                                        // SizedBox(height: 20,),
                                        ///Forvet
                                        Expanded(
                                          flex: 2,
                                          child: FadeAnimation(
                                            sayac==0? 2.2:0.4, Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 30,),
                                                TransferPlayer(
                                                  image: global.forvet0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.forvet0Kits,
                                                  name: global.forvet0PlayerShortName==null?'Boş5':global.forvet0PlayerShortName,
                                                  position: "LWF",gideceksayfa: 'myteam',pozisyon: global.forvet0Pos,neresi: 'Forvet0',
                                                  band: global.forvet0PlayerID==global.captain
                                                      //|| global.forvet0PlayerID==global.spareCaptain
                                                          && global.captain!=null
                                                    //      &&global.spareCaptain!=null
                                                      ? 1:0,
                                                  who:global.forvet0PlayerID==global.captain? 'K':
                                                  //global.forvet0PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: global.forvet0PlayerID,
                                                  gorunurluk:global.forvet0PlayerShortName==null?true: global.forvet0vis,
                                               value:global.forvet0Value==null?'-':  global.forvet0Value+'M ₺',
                                                  sorunne: global.F0injury==1?'!':global.F0leave==1?'X':'',
                                                  sorun: global.F0injury==1?1:global.F0leave==1?1:0,
                                                ),
                                                Offstage(offstage:global.forvet0PlayerShortName==null?true: global.forvet0vis ,child: SizedBox(width: 5,)),
                                                TransferPlayer(image: global.forvet1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.forvet1Kits,
                                                  name: global.forvet1PlayerShortName==null?'Boş4':global.forvet1PlayerShortName,

                                                  position: "LWF",gideceksayfa: 'myteam',pozisyon:global.forvet1Pos,neresi: 'Forvet1',
                                                  band: global.forvet1PlayerID==global.captain
                                                      //|| global.forvet1PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                    //      &&global.spareCaptain!=null
                                                      ? 1:0,
                                                  who:global.forvet1PlayerID==global.captain? 'K':
                                                  //global.forvet1PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: global.forvet1PlayerID,
                                                  gorunurluk:global.forvet1PlayerShortName==null?true:  global.forvet1vis,
                                                  value:global.forvet1Value==null?'-':  global.forvet1Value+'M ₺',
                                                  sorunne: global.F1injury==1?'!':global.F1leave==1?'X':'',
                                                  sorun: global.F1injury==1?1:global.F1leave==1?1:0,
                                                ),
                                                Offstage(offstage:global.forvet1PlayerShortName==null?true:  global.forvet1vis ,child: SizedBox(width: 5,)),
                                                TransferPlayer(image: global.forvet2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.forvet2Kits,
                                                  name: global.forvet2PlayerShortName==null?'Boş3':global.forvet2PlayerShortName,
                                                  position: "LWF",gideceksayfa: 'myteam',pozisyon: global.forvet2Pos,neresi: 'Forvet2',
                                                  band: global.forvet2PlayerID==global.captain
                                                      //|| global.forvet2PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                    //      && global.spareCaptain!=null
                                                      ? 1:0,
                                                  who:global.forvet2PlayerID==global.captain? 'K':
                                                  //global.forvet2PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: global.forvet2PlayerID,
                                                  gorunurluk:global.forvet2PlayerShortName==null?true:  global.forvet2vis,
                                                  value:global.forvet2Value==null?'-':   global.forvet2Value==null?'-':global.forvet2Value+'M ₺',
                                                  sorunne: global.F2injury==1?'!':global.F2leave==1?'X':'',
                                                  sorun: global.F2injury==1?1:global.F2leave==1?1:0,
                                                ),
                                                Offstage(offstage:global.forvet2PlayerShortName==null?true:  global.forvet2vis ,child: SizedBox(width: 5,)),
                                                TransferPlayer(image: forvetYedekKits==null?'https://ftl.allryazilim.com/image/boskit.png':forvetYedekKits,
                                                  name:forvetYedekSN==null?'Boş2':forvetYedekSN,
                                                  position: "LB",gideceksayfa: 'myteam',pozisyon: forvetYedekPos,neresi: forvetYedekEmp,
                                                 // band: global.defans4PlayerID==global.captain
                                                  band: forvetYedekBand==global.captain
                                                      //|| global.defans4PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                    //      && global.spareCaptain!=null
                                                      ? 1:0,
                                                 // who:global.defans4PlayerID==global.captain? 'K':
                                                  who:forvetYedekWho==global.captain? 'K':
                                                  //global.defans4PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: forvetYedekPID,
                                                  gorunurluk:forvetYedekSN==null?true: false,
                                                  value:forvetYedekValue==null?'-':  forvetYedekValue+'M ₺',
                                                  sorunne: forvetYedekinjury==1?'!':forvetYedekLeave==1?'X':'',
                                                  sorun: forvetYedekinjury==1?1:forvetYedekLeave==1?1:0,
                                                ),
                                                Offstage(offstage:forvetYedekSN==null?true:  false ,child: SizedBox(width: 5,)),
                                                TransferPlayer(image: forvetYedek2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':forvetYedek2Kits,
                                                  name:forvetYedek2SN==null?'Boş1':forvetYedek2SN,
                                                  position: "LB",gideceksayfa: 'myteam',pozisyon: forvetYedek2Pos,neresi: forvetYedek2Emp,
                                                 // band: global.defans4PlayerID==global.captain
                                                  band: forvetYedek2Band==global.captain
                                                    //  ||global.defans4PlayerID==global.spareCaptain
                                                          &&global.captain!=null
                                                  //        &&global.spareCaptain!=null
                                                      ? 1:0,
                                                 // who:global.defans4PlayerID==global.captain? 'K':
                                                  who:forvetYedek2Who==global.captain? 'K':
                                                //  global.defans4PlayerID==global.spareCaptain?'YK':
                                                  '',
                                                  playerid: forvetYedek2PID,
                                                  gorunurluk:forvetYedek2SN==null?true: false,
                                                  value:forvetYedek2Value==null?'-':  forvetYedek2Value+'M ₺',
                                                  sorunne: forvetYedek2injury==1?'!':forvetYedek2Leave==1?'X':'',
                                                  sorun: forvetYedek2injury==1?1:forvetYedek2Leave==1?1:0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                     Expanded(child: SizedBox(height: 10),flex: 1,),
                                     //   SizedBox(height: MediaQuery.of(context).size.height*0.075,),
                                        // SizedBox(height: 45,),
                                      ///Unity
                                        /*  global.adsBannerState==0?Expanded(flex: 1,child: Text('')):
                                        Visibility(
                                            visible: global.bannerReaklamHakki==1?true:false,
                                            child:Expanded(flex: 1,child: UnityBannerAd(placementId: 'Android_Ad_Banner',)))
                                        */
                                        ///Admob
                                         global.adsBannerState==0?Expanded(flex: 1,child: Text('')): Expanded(
                                          flex: 1,
                                          child: Visibility(
                                            visible: global.bannerReaklamHakki==1?true:false,
                                            child: Container(
                                              height: 50,
                                              child: AdWidget(
                                                ad:AdmobHelper.getBannerAd()..load(),
                                                key: UniqueKey(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///Yedekler
                                   /*     Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            ///forvetler
                                            MyTeamPlayer2(image: global.yedek2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.yedek2Kits,
                                              name: global.yedek2PlayerShortName==null?'Boş':global.yedek2PlayerShortName,
                                              position: "GK",gideceksayfa: 'kaleci',
                                              pozisyon: global.yedek2Pos,neresi: 'Yedek2',
                                              band: global.yedek2PlayerID==global.captain||
                                                  global.yedek2PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,
                                              who:global.yedek2PlayerID==global.captain? 'K':global.yedek2PlayerID==global.spareCaptain?'YK':'',
                                              playerid: global.yedek2PlayerID,
                                              gorunurluk: global.yedek2vis,
                                            ),
                                            Offstage(offstage:  global.yedek2vis,child: SizedBox(width: 20,)),
                                            ///kaleciler
                                            MyTeamPlayer2(image: global.kaleci1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.kaleci1Kits,
                                              name: global.kaleci1PlayerShortName==null?'Boş':global.kaleci1PlayerShortName,
                                              position: "GK",gideceksayfa: 'kaleci',
                                              pozisyon: global.kaleci1Pos,neresi: 'YedekKaleci',
                                              band: global.kaleci1PlayerID==global.captain||global.kaleci1PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,who:global.kaleci1PlayerID==global.captain? 'K':global.kaleci1PlayerID==global.spareCaptain?'YK':'',
                                              playerid: global.kaleci1PlayerID,
                                              gorunurluk:  global.kaleci1vis,
                                            ),
                                            Offstage(offstage:  global.kaleci1vis,child: SizedBox(width: 20,)),
                                            ///defanslar
                                            MyTeamPlayer2(image: global.yedek0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.yedek0Kits,
                                              name: global.yedek0PlayerShortName==null?'Boş':global.yedek0PlayerShortName,
                                              position: "GK",gideceksayfa: 'kaleci',
                                              pozisyon: global.yedek0Pos,neresi: 'Yedek0',
                                              band: global.yedek0PlayerID==global.captain||
                                                  global.yedek0PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,
                                              who:global.yedek0PlayerID==global.captain? 'K':global.yedek0PlayerID==global.spareCaptain?'YK':'',
                                              playerid: global.yedek0PlayerID,
                                              gorunurluk: global.yedek0vis,
                                            ),
                                            Offstage(offstage:  global.yedek0vis,child: SizedBox(width: 20,)),

                                            ///ortasahalar
                                            MyTeamPlayer2(image: global.yedek1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.yedek1Kits,
                                              name: global.yedek1PlayerShortName==null?'Boş':global.yedek1PlayerShortName,
                                              position: "GK",gideceksayfa: 'kaleci',
                                              pozisyon: global.yedek1Pos,neresi: 'Yedek1',
                                              band: global.yedek1PlayerID==global.captain||
                                                  global.yedek1PlayerID==global.spareCaptain&&global.captain!=null&&global.spareCaptain!=null? 1:0,
                                              who:global.yedek1PlayerID==global.captain? 'K':global.yedek1PlayerID==global.spareCaptain?'YK':'',
                                              playerid: global.yedek1PlayerID,
                                              gorunurluk: global.yedek1vis,
                                            ),
                                            Offstage(offstage:  global.yedek1vis,child: SizedBox(width: 20,)),

                                          ],
                                        ) */
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
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
                  ),
                )
            ),
          ); }
    );
  }

}


