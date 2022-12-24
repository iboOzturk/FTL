import 'package:fantasysuperlig/Services/api_service.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:fantasysuperlig/widgets/captainarmband.dart';
import 'package:fantasysuperlig/widgets/oyuncu.dart';
import 'package:fantasysuperlig/widgets/substitutePlayer.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/refresh/hdt_refresh_controller.dart';
import 'package:line_icons/line_icons.dart';
import '/widgets/player.dart';
import '/widgets/myteamplayer.dart';
import '../Variables/global.dart' as global;
import 'dart:async';

class SubstitutePage extends StatefulWidget {
  @override
  _SubstitutePageState createState() => _SubstitutePageState();
}
List<String> playerInfo(String boxname){
  for(var f in global.takimim){

  }
}
class _SubstitutePageState extends State<SubstitutePage> {
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  int kaptanid=0;

  Future<void> loginnes() async{
    await getTakimim(global.userid);
  }
  @override
  void initState() {
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



  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    final double _fieldH = 0.8143399 * _height;
    String neres='Defans';
    Color kaleci0renk;
    Color kaleci1renk;
    Color defans0renk;
    Color defans1renk;
    Color defans2renk;
    Color defans3renk;
    Color defans4renk;
    Color ortasaha0renk;
    Color ortasaha1renk;
    Color ortasaha2renk;
    Color ortasaha3renk;
    Color ortasaha4renk;
    Color forvet1renk;
    Color forvet2renk;
    Color forvet3renk;
    if(neres=='Defans'){
      kaleci0renk=Colors.yellow;
      kaleci1renk=Colors.yellow;
      defans0renk=Colors.green.shade700;
      defans1renk=Colors.green.shade700;
      defans2renk=Colors.green.shade700;
      defans3renk=Colors.green.shade700;
      defans4renk=Colors.green.shade700;
      ortasaha0renk=Colors.yellow;
      ortasaha1renk=Colors.yellow;
      ortasaha2renk=Colors.yellow;
      ortasaha3renk=Colors.yellow;
      ortasaha4renk=Colors.yellow;
      forvet1renk=Colors.yellow;
      forvet2renk=Colors.yellow;
      forvet3renk=Colors.yellow;
    }
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

                    backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
                    appBar: new AppBar(
                      backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
                      elevation: 0.0,
                      centerTitle: true,
                      title: new Text('Takımım'),
                      leading: new IconButton(
                        icon: new Icon(Icons.arrow_back_ios),
                        onPressed: () {Navigator.pushNamed(context,'/deneme2');},),
                    ),
                    body: SafeArea(
                      child: ListView(
                          children: [
                            // SizedBox(height: 15.0),
                            Container(alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,height:40 ,color: Colors.white,
                              child: Column(
                                children: [
                                  Text('YEDFEKDAS',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),

                                ],
                              ),
                            ),
                            //Container(child: Image.asset('assets/images/forma1.png', height: (0.13546798 * _height), width: _width)),

                          /*  Stack(children: [
                              Container(
                                child: Image.asset('assets/images/saha5.png', fit: BoxFit.fill),
                                height: _fieldH,
                                width: _width,),
                              //Player(image: global.kaleci0Kits, name:global.kaleci0PlayerShortName, top: 0.06272727 * _fieldH, right: 0.17923333 * _width, left: 0.0, position: "GK")),
                              SubstitutePlayer(image: global.kaleci0Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.kaleci0Kits, name:global.kaleci0PlayerShortName==null?'Boş':global.kaleci0PlayerShortName,  top: 0.15272727 * _fieldH, right: 0.0    * _width, left: 0.0 * _width, position: "GK",gideceksayfa: 'kaleci',pozisyon: '0',neresi: 'Kaleci0',band:global.kaleci0PlayerID==global.captain||global.kaleci0PlayerID==global.spareCaptain? 1:0,who:global.kaleci0PlayerID==global.captain? 'K':global.kaleci0PlayerID==global.spareCaptain?'YK':'',playerid: global.kaleci0PlayerID,/*arkarenk:kaleci0renk*/),
                              SubstitutePlayer(image: global.kaleci1Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.kaleci1Kits, name: global.kaleci1PlayerShortName==null?'Boş':global.kaleci1PlayerShortName, top: 0.85090909 * _fieldH,  right: 0.22154* _width, left: 0.0 * _width, position: "GK",gideceksayfa: 'kaleci',pozisyon: '0',neresi: 'Kaleci1',band: global.kaleci1PlayerID==global.captain||global.kaleci1PlayerID==global.spareCaptain? 1:0,who:global.kaleci1PlayerID==global.captain? 'K':global.kaleci1PlayerID==global.spareCaptain?'YK':'',playerid: global.kaleci1PlayerID,/*arkarenk: kaleci1renk*/),

                              SubstitutePlayer(image: global.defans0Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.defans0Kits, name: global.defans0PlayerShortName==null?'Boş':global.defans0PlayerShortName, top: 0.30636364 * _fieldH, right:  0.70666667 * _width, left:0.0       * _width, position: "RB",gideceksayfa: 'kaleci',pozisyon: '1',neresi: 'Defans0',band: global.defans0PlayerID==global.captain||global.defans0PlayerID==global.spareCaptain? 1:0,who:global.defans0PlayerID==global.captain? 'K':global.defans0PlayerID==global.spareCaptain?'YK':'',playerid: global.defans0PlayerID,/*arkarenk: defans0renk,*/),
                              SubstitutePlayer(image: global.defans1Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.defans1Kits, name: global.defans1PlayerShortName==null?'Boş':global.defans1PlayerShortName, top: 0.29636364 * _fieldH, right:  0.25333333 * _width, left:0.0       * _width, position: "CB",gideceksayfa: 'kaleci',pozisyon: '1',neresi: 'Defans1',band:global.defans1PlayerID==global.captain||global.defans1PlayerID==global.spareCaptain? 1:0,who:global.defans1PlayerID==global.captain? 'K':global.defans1PlayerID==global.spareCaptain?'YK':'',playerid: global.defans1PlayerID,/*arkarenk: defans1renk,*/),
                              SubstitutePlayer(image: global.defans2Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.defans2Kits, name: global.defans2PlayerShortName==null?'Boş':global.defans2PlayerShortName, top: 0.29636364 * _fieldH, right:  0.0        * _width, left:0.21333333* _width, position: "CB",gideceksayfa: 'kaleci',pozisyon: '1',neresi: 'Defans2',band: global.defans2PlayerID==global.captain||global.defans2PlayerID==global.spareCaptain? 1:0,who:global.defans2PlayerID==global.captain? 'K':global.defans2PlayerID==global.spareCaptain?'YK':'',playerid: global.defans2PlayerID,/*arkarenk: defans2renk,*/),
                              SubstitutePlayer(image: global.defans3Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.defans3Kits, name: global.defans3PlayerShortName==null?'Boş':global.defans3PlayerShortName, top: 0.30636364 * _fieldH, right:  0.0        * _width, left:0.70666667* _width, position: "CB",gideceksayfa: 'kaleci',pozisyon: '1',neresi: 'Defans3',band: global.defans3PlayerID==global.captain||global.defans3PlayerID==global.spareCaptain? 1:0,who:global.defans3PlayerID==global.captain? 'K':global.defans3PlayerID==global.spareCaptain?'YK':'',playerid: global.defans3PlayerID,/*arkarenk: defans3renk,*/),
                              SubstitutePlayer(image: global.defans4Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.defans4Kits, name: global.defans4PlayerShortName==null?'Boş':global.defans4PlayerShortName, top: 0.85090909 * _fieldH, right:  0.0        * _width, left:0.22666667* _width, position: "LB",gideceksayfa: 'kaleci',pozisyon: '1',neresi: 'Defans4',band: global.defans4PlayerID==global.captain||global.defans4PlayerID==global.spareCaptain? 1:0,who:global.defans4PlayerID==global.captain? 'K':global.defans4PlayerID==global.spareCaptain?'YK':'',playerid: global.defans4PlayerID,/*arkarenk: defans4renk,*/),

                              SubstitutePlayer(image: global.ortasaha0Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.ortasaha0Kits, name: global.ortasaha0PlayerShortName==null?'Boş':global.ortasaha0PlayerShortName, top: 0.48454545 * _fieldH, right: 0.0        * _width, left:  0.45333333 * _width, position: "LMF",gideceksayfa: 'kaleci',pozisyon: '2',neresi: 'OrtaSaha0',band: global.ortasaha0PlayerID==global.captain||global.ortasaha0PlayerID==global.spareCaptain? 1:0,who:global.ortasaha0PlayerID==global.captain? 'K': global.ortasaha0PlayerID==global.spareCaptain?'YK':'',playerid: global.ortasaha0PlayerID,/*arkarenk: ortasaha0renk,*/),
                              SubstitutePlayer(image: global.ortasaha1Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.ortasaha1Kits, name: global.ortasaha1PlayerShortName==null?'Boş':global.ortasaha1PlayerShortName, top: 0.48454545 * _fieldH, right: 0.0        * _width, left:  0.0        *_width, position: "AMF",gideceksayfa: 'kaleci',pozisyon: '2',neresi: 'OrtaSaha1',band: global.ortasaha1PlayerID==global.captain||global.ortasaha1PlayerID==global.spareCaptain? 1:0,who:global.ortasaha1PlayerID==global.captain? 'K':global.ortasaha1PlayerID==global.spareCaptain?'YK':'',playerid: global.ortasaha1PlayerID,/*arkarenk: ortasaha1renk,*/),
                              SubstitutePlayer(image: global.ortasaha2Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.ortasaha2Kits, name: global.ortasaha2PlayerShortName==null?'Boş':global.ortasaha2PlayerShortName, top: 0.48454545 * _fieldH, right: 0.45333333 * _width, left:  0.0        *_width, position: "AMF",gideceksayfa: 'kaleci',pozisyon: '2',neresi: 'OrtaSaha2',band: global.ortasaha2PlayerID==global.captain||global.ortasaha2PlayerID==global.spareCaptain? 1:0,who:global.ortasaha2PlayerID==global.captain? 'K': global.ortasaha2PlayerID==global.spareCaptain?'YK':'',playerid: global.ortasaha2PlayerID,/*arkarenk: ortasaha2renk,*/),
                              SubstitutePlayer(image: global.ortasaha3Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.ortasaha3Kits, name: global.ortasaha3PlayerShortName==null?'Boş':global.ortasaha3PlayerShortName, top: 0.85090909 * _fieldH, right: 0.0        * _width, left:  0.70666667 *_width, position: "AMF",gideceksayfa: 'kaleci',pozisyon: '2',neresi: 'OrtaSaha3',band: global.ortasaha3PlayerID==global.captain||global.ortasaha3PlayerID==global.spareCaptain? 1:0,who:global.ortasaha3PlayerID==global.captain? 'K': global.ortasaha3PlayerID==global.spareCaptain?'YK':'',playerid: global.ortasaha3PlayerID,/*arkarenk: ortasaha3renk,*/),
                              SubstitutePlayer(image: global.ortasaha4Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.ortasaha4Kits, name: global.ortasaha4PlayerShortName==null?'Boş':global.ortasaha4PlayerShortName, top: 0.85090909 * _fieldH, right: 0.70666667 * _width, left:  0.0        *_width, position: "RMF",gideceksayfa: 'kaleci',pozisyon: '2',neresi: 'OrtaSaha4',band: global.ortasaha4PlayerID==global.captain||global.ortasaha4PlayerID==global.spareCaptain? 1:0,who:global.ortasaha4PlayerID==global.captain? 'K': global.ortasaha4PlayerID==global.spareCaptain?'YK':'',playerid: global.ortasaha4PlayerID,/*arkarenk: ortasaha4renk,*/),

                              SubstitutePlayer(image: global.forvet0Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.forvet0Kits, name: global.forvet0PlayerShortName==null?'Boş':global.forvet0PlayerShortName, top: 0.65090909 * _fieldH, right: 0.0        * _width, left: 0.0        * _width, position: "LWF",gideceksayfa: 'kaleci',pozisyon: '3',neresi: 'Forvet1',band: global.forvet0PlayerID==global.captain||global.forvet0PlayerID==global.spareCaptain? 1:0,who:global.forvet0PlayerID==global.captain? 'K':   global.forvet0PlayerID==global.spareCaptain?'YK':'',playerid: global.forvet0PlayerID,/*arkarenk: forvet1renk,*/),
                              SubstitutePlayer(image: global.forvet1Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.forvet1Kits, name: global.forvet1PlayerShortName==null?'Boş':global.forvet1PlayerShortName, top: 0.65090909 * _fieldH, right: 0.44333333 * _width, left: 0.0        * _width, position: "LWF",gideceksayfa: 'kaleci',pozisyon: '3',neresi: 'Forvet2',band: global.forvet1PlayerID==global.captain||global.forvet1PlayerID==global.spareCaptain? 1:0,who:global.forvet1PlayerID==global.captain? 'K':global.forvet1PlayerID==global.spareCaptain?'YK':'',playerid: global.forvet1PlayerID,/*arkarenk: forvet2renk,*/),
                              SubstitutePlayer(image: global.forvet2Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.forvet2Kits, name: global.forvet2PlayerShortName==null?'Boş':global.forvet2PlayerShortName, top: 0.65090909 * _fieldH, right: 0.0        * _width, left: 0.44333333 * _width, position: "LWF",gideceksayfa: 'kaleci',pozisyon: '3',neresi: 'Forvet3',band: global.forvet2PlayerID==global.captain||global.forvet2PlayerID==global.spareCaptain? 1:0,who:global.forvet2PlayerID==global.captain? 'K':global.forvet2PlayerID==global.spareCaptain?'YK':'',playerid: global.forvet2PlayerID,/*arkarenk: forvet3renk,*/),

                              // CaptainArmband(who: 'K',top: 0.69090909 * _fieldH, right: 0.0 * _width, left: 0.34333333 * _width,visibilty: 1,),
                            ]
                            ), */

                          ]
                      ),
                    )
                )
            ),
          ); }
    );
  }

}


