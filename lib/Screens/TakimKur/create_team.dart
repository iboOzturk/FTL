///Admob
//import 'package:fantasysuperlig/Services/admobservice.dart';

import 'package:fantasysuperlig/Services/admobservice.dart';
import 'package:fantasysuperlig/Services/api_service.dart';
import 'package:fantasysuperlig/widgets/BankDetailWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
///Admob
//import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:horizontal_data_table/refresh/hdt_refresh_controller.dart';
import 'package:line_icons/line_icons.dart';
import 'package:unity_ads_plugin/unity_ads.dart';
import '/widgets/player.dart';
import '../../Variables/global.dart' as global;
import 'dart:async';

class CreateTeamPage extends StatefulWidget {
  @override
  _CreateTeamPageState createState() => _CreateTeamPageState();
}
List<String> playerInfo(String boxname){
  for(var f in global.takimim){

  }
}


class _CreateTeamPageState extends State<CreateTeamPage> {

  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  Giris _giris=Giris();

  Future<void> loginnes() async{
    await getTakimim(global.userid);
  }
  /*
  Future<void> getBank() async{
   // await  _giris.getBankInfo(global.userid);
    await  _giris.getBankInfo();
  } */
  @override
  void initState() {
    UnityAds.init(gameId: '4376159');

    _giris.CreateTeam(global.userid);
    //loginnes();
    _refreshData2();
    super.initState();
  }
  Future<Null> _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    //getTakimim(global.userid);
    loginnes();
    _giris.getBankInfo();
    setState(() {
    });
  }
  Future<Null> _refreshData2() async {
    await Future.delayed(Duration(milliseconds: 300));
    //getTakimim(global.userid);
    loginnes();
    _giris.getBankInfo();
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    final double _fieldH = 0.6773399 * _height;

    return FutureBuilder(
        future: getTakimim(global.userid),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
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
                      appBar: PreferredSize(
                        preferredSize: Size.fromHeight(50),

                        child: new AppBar(
                        //backgroundColor: Color.fromARGB(255, 44, 0, 49),
                        backgroundColor: Color(0xff131862),
                          elevation: 0.0,

                          centerTitle: true,
                          title: new Text('Transfer et',textAlign: TextAlign.center,),
                         leading: Icon(Icons.arrow_back,color: Colors.transparent,),
                         actions: [
                           TextButton(child: Container(child: Text('Tamam',style: TextStyle(fontSize: 18,color: Colors.white,),textAlign: TextAlign.center,)),onPressed: () {
                             global.gelenOyuncuSayisi<15? showDialog(context: context, builder: (BuildContext context){
                               return AlertDialog(title: Text('Takımınız eksik. Oyun menüleri açılmayacaktır, ödül kazanamazsınız.',textAlign: TextAlign.center,),
                               content: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.orange.shade900),child: Text('Çıkış'),onPressed: () {
                                     Navigator.pushNamed(context,'/menu');
                                   },),
                                   ElevatedButton(child: Text('Tamamlamak için geri dön',style: TextStyle(fontWeight: FontWeight.bold),),onPressed: () {
                                     Navigator.pop(context);
                                   },),
                                 ],
                               ),);
                             }):
                             Navigator.pushNamed(context,'/menu');
                           },),
                         ],
                         /* new IconButton(
                            icon: new Icon(Icons.arrow_back_ios),
                            onPressed: () {Navigator.pushNamed(context,'/menu');},), */
                        ),
                      ),
                      body: SafeArea(
                        child: Container(
                          width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
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
                                tileMode: TileMode.clamp), */
                          ),
                          child: ListView(
                              children: [

                                SizedBox(height: 15.0),
                                SizedBox(height: 10.0),
                                Container(alignment: Alignment.center,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ///bütçe,free,transpuan,maliyet
                                    //  BankContainer(baslik: 'Bütçe', deger:global.Butce),
                                    Container(
                                    width: 105,height: 56,decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      //border: Border.all(color: Colors.green.shade700,width: 1)
                                    ),
                                    child: Column(
                                      children: [
                                        Container(alignment: Alignment.center,
                                            width: 105,height: 27,decoration: BoxDecoration(
                                              color: Color.fromARGB(255, 55, 0, 60 ),
                                              borderRadius: BorderRadius.circular(15),
                                            ),

                                            child: Text('Bütçe',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,)
                                        ),
                                        SizedBox(height: 1,),
                                        Container(alignment: Alignment.center,
                                            width: 105,height: 27,
                                            decoration: BoxDecoration(
                                              // color: Colors.purple.shade700,
                                              color: Colors.green.shade700,
                                              borderRadius: BorderRadius.circular(15),),
                                            //Color.fromARGB(99, 79, 35, 84 ),

                                            child: Text(global.Butce.toString()+'M ₺',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)
                                        ),
                                      ],
                                    ),
                                  ),

                                  /*    SizedBox(width: 10.0),
                                      Container(
                                        width: 105,height: 36,decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          //border: Border.all(color: Colors.grey,width: 1)
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
                                          borderRadius: BorderRadius.circular(10),
                                          //border: Border.all(color: Colors.grey,width: 1)
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

                                                child: Text('${global.TransferPuan}',
                                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),)
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Container(
                                        width: 105,height: 36,decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                         // border: Border.all(color: Colors.red.shade600,width: 1)
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
                                                  color: Colors.red.shade600,
                                                  borderRadius: BorderRadius.circular(15),),
                                                //Color.fromARGB(99, 79, 35, 84 ),

                                                child: Text('${global.Expense==null?'0':global.Expense}',
                                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),)
                                            ),
                                          ],
                                        ),
                                      ), */



                                    ],
                                  ),
                                ),
                                //Container(child: Image.asset('assets/images/forma1.png', height: (0.13546798 * _height), width: _width)),
                                SizedBox(height: 10.0),
                                Stack(children: [
                                  Container(
                                    child: Image.asset('assets/images/saha.png', fit: BoxFit.fill),
                                    //child: Image.asset('assets/images/saha2.png', fit: BoxFit.fill),
                                    height: _fieldH,
                                    width: _width,),
                                  //Player(image: global.kaleci0Kits, name:global.kaleci0PlayerShortName, top: 0.06272727 * _fieldH, right: 0.17923333 * _width, left: 0.0, position: "GK")),
                                  Player(image: global.kaleci0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.kaleci0Kits,
                                    name:global.kaleci0PlayerShortName==null?'Oyuncu Seç':global.kaleci0PlayerShortName,
                                    top: 0.04272727 * _fieldH, right: 0.17923333 * _width, left: 0.0,
                                    position: "GK",gideceksayfa: 'myteam2',pozisyon: '0',neresi: 'Kaleci0',
                                    value:  global.kaleci0Value==null?'-':global.kaleci0Value+'M ₺',),
                                  Player(image: global.kaleci1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.kaleci1Kits,
                                      name: global.kaleci1PlayerShortName==null?'Oyuncu Seç':global.kaleci1PlayerShortName,
                                      top: 0.04272727 * _fieldH, right: 0.0, left: 0.24333333 * _width,
                                      position: "GK",gideceksayfa: 'myteam2',pozisyon: '0',neresi: 'YedekKaleci',
                                      value: global.kaleci1Value==null?'-':global.kaleci1Value+'M ₺'),

                                  Player(image: global.defans0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans0Kits,
                                      name: global.defans0PlayerShortName==null?'Oyuncu Seç':global.defans0PlayerShortName,
                                      top: 0.27818182 * _fieldH, right: 0.70666667 * _width, left: 0.0* _width ,
                                      position: "RB",gideceksayfa: 'myteam2',pozisyon: '1',neresi: 'Defans0',
                                      value: global.defans0Value==null?'-':global.defans0Value+'M ₺'),
                                  Player(image: global.defans1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans1Kits,
                                      name: global.defans1PlayerShortName==null?'Oyuncu Seç':global.defans1PlayerShortName,
                                      top: 0.23936364 * _fieldH, right: 0.37333333 * _width, left: 0.0* _width        ,
                                      position: "CB",gideceksayfa: 'myteam2',pozisyon: '1',neresi: 'Defans1',value: global.defans1Value==null?'-':global.defans1Value+'M ₺'),
                                  Player(image: global.defans2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans2Kits,
                                      name: global.defans2PlayerShortName==null?'Oyuncu Seç':global.defans2PlayerShortName,
                                      top: 0.22736364 * _fieldH, right: 0.00923333 * _width, left: 0.0* _width        ,
                                      position: "CB",gideceksayfa: 'myteam2',pozisyon: '1',neresi: 'Defans2',value: global.defans2Value==null?'-':global.defans2Value+'M ₺'),
                                  Player(image: global.defans3Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.defans3Kits,
                                      name: global.defans3PlayerShortName==null?'Oyuncu Seç':global.defans3PlayerShortName,
                                      top: 0.23936364 * _fieldH, right: 0.0 * _width       , left: 0.35333333 * _width,
                                      position: "CB",gideceksayfa: 'myteam2',pozisyon: '1',neresi: 'Defans3',
                                      value: global.defans3Value==null?'-':global.defans3Value+'M ₺'),
                                 // Player(image: global.defans4Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.defans4Kits, name: global.defans4PlayerShortName==null?'Boş':global.defans4PlayerShortName, top: 0.27818182 * _fieldH,right:  0.0 * _width       , left: 0.70666667 * _width, position: "LB",gideceksayfa: 'myteam',pozisyon: '1',neresi: 'Yedek0',value: global.defans4Value==null?'-':global.defans4Value+'M ₺',),
                                  Player(image: global.yedek0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.yedek0Kits,
                                    name: global.yedek0PlayerShortName==null?'Oyuncu Seç':global.yedek0PlayerShortName,
                                    top: 0.27818182 * _fieldH,right:  0.0 * _width       , left: 0.70666667 * _width,
                                    position: "LB",gideceksayfa: 'myteam2',pozisyon: '1',neresi: 'Yedek0',
                                    value: global.yedek0Value==null?'-':global.yedek0Value+'M ₺',),

                                  Player(image: global.ortasaha0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha0Kits,
                                      name: global.ortasaha0PlayerShortName==null?'Oyuncu Seç':global.ortasaha0PlayerShortName,
                                      top: 0.52272727 * _fieldH, right: 0.0        * _width, left: 0.70666667 * _width,
                                      position: "LMF",gideceksayfa: 'myteam2',pozisyon: '2',neresi: 'OrtaSaha0',
                                      value: global.ortasaha0Value==null?'-':global.ortasaha0Value+'M ₺'),
                                  Player(image: global.ortasaha1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha1Kits,
                                      name: global.ortasaha1PlayerShortName==null?'Oyuncu Seç':global.ortasaha1PlayerShortName,
                                      top: 0.48454545 * _fieldH, right: 0.0        * _width, left: 0.35333333  *_width,
                                      position: "AMF",gideceksayfa: 'myteam2',pozisyon: '2',neresi: 'OrtaSaha1',
                                      value: global.ortasaha1Value==null?'-':global.ortasaha1Value+'M ₺'),
                                  Player(image: global.ortasaha2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha2Kits,
                                      name: global.ortasaha2PlayerShortName==null?'Oyuncu Seç':global.ortasaha2PlayerShortName,
                                      top: 0.46454545 * _fieldH, right: 0.00923333 * _width, left: 0.0         *_width,
                                      position: "AMF",gideceksayfa: 'myteam2',pozisyon: '2',neresi: 'OrtaSaha2',
                                      value: global.ortasaha2Value==null?'-':global.ortasaha2Value+'M ₺'),
                                  Player(image: global.ortasaha3Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.ortasaha3Kits,
                                      name: global.ortasaha3PlayerShortName==null?'Oyuncu Seç':global.ortasaha3PlayerShortName,
                                      top: 0.48454545 * _fieldH, right: 0.35333333 * _width, left: 0.0        *_width,
                                      position: "AMF",gideceksayfa: 'myteam2',pozisyon: '2',neresi: 'OrtaSaha3',
                                      value:  global.ortasaha3Value==null?'-':global.ortasaha3Value+'M ₺'),
                                 // Player(image: global.ortasaha4Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.ortasaha4Kits, name: global.ortasaha4PlayerShortName==null?'Boş':global.ortasaha4PlayerShortName, top: 0.52272727 * _fieldH, right: 0.70666667 * _width, left: 0.0        *_width, position: "RMF",gideceksayfa: 'myteam',pozisyon: '2',neresi: 'Yedek1',value:  global.ortasaha4Value==null?'-':global.ortasaha4Value+'M ₺'),
                                  Player(image: global.yedek1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.yedek1Kits,
                                      name: global.yedek1PlayerShortName==null?'Oyuncu Seç':global.yedek1PlayerShortName,
                                      top: 0.52272727 * _fieldH, right: 0.70666667 * _width, left: 0.0        *_width,
                                      position: "RMF",gideceksayfa: 'myteam2',pozisyon: '2',neresi: 'Yedek1',
                                      value:  global.yedek1Value==null?'-':global.yedek1Value+'M ₺'),

                                  //http://fantasy.bulutbyte.net/image/boskit.png
                                  Player(image: global.forvet0Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.forvet0Kits,
                                      name: global.forvet0PlayerShortName==null?'Oyuncu Seç':global.forvet0PlayerShortName,
                                      top: 0.75090909 * _fieldH, right: 0.29333333 * _width, left: 0.29333333 * _width,
                                      position: "CF",gideceksayfa: 'myteam2',pozisyon: '3',neresi: 'Forvet0',
                                      value: global.forvet0Value==null?'-':global.forvet0Value+'M ₺'),
                                  Player(image: global.forvet1Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.forvet1Kits,
                                      name: global.forvet1PlayerShortName==null?'Oyuncu Seç':global.forvet1PlayerShortName,
                                      top: 0.75090909 * _fieldH, right: 0.44333333 * _width, left: 0.0,
                                      position: "RWF",gideceksayfa: 'myteam2',pozisyon: '3',neresi: 'Forvet1',
                                      value: global.forvet1Value==null?'-':global.forvet1Value+'M ₺'),
                                 // Player(image: global.forvet2Kits==null?'http://fantasy.bulutbyte.net/image/boskit.png':global.forvet2Kits, name: global.forvet2PlayerShortName==null?'Boş':global.forvet2PlayerShortName, top: 0.75090909 * _fieldH, right: 0.16333333 * _width, left: 0.65333333 * _width, position: "LWF",gideceksayfa: 'myteam',pozisyon: '3',neresi: 'Yedek2',value: global.forvet2Value==null?'-':global.forvet2Value+'M ₺',)]),
                                  Player(image: global.yedek2Kits==null?'https://ftl.allryazilim.com/image/boskit.png':global.yedek2Kits,
                                    name: global.yedek2PlayerShortName==null?'Oyuncu Seç':global.yedek2PlayerShortName,
                                    top: 0.75090909 * _fieldH, right: 0.16333333 * _width, left: 0.65333333 * _width,
                                    position: "LWF",gideceksayfa: 'myteam2',pozisyon: '3',neresi: 'Yedek2',
                                    value: global.yedek2Value==null?'-':global.yedek2Value+'M ₺',)]),
                             ///Unity
                                /*   global.adsBannerState==0?Text(''):
                                Visibility(
                                    visible: global.bannerReaklamHakki==1?true:false,
                                    child:Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(child: UnityBannerAd(placementId: 'Android_Ad_Banner',)),
                                    )),*/
                                ///Admob
                                    global.adsBannerState==0?Text(''): Visibility(
                                  visible: global.bannerReaklamHakki==1?true:false,
                                  child: Container(
                                    height: 50,
                                    child: AdWidget(
                                      ad:AdmobHelper.getBannerAd()..load(),
                                      key: UniqueKey(),
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ),

                      ),
                  /*  bottomNavigationBar: Container(
                      child: AdWidget(
                        ad:AdmobHelper.getBannerAd()..load(),
                        key: UniqueKey(),
                      ),
                      height: 50,
                    ), */
                  ),
                )
            ),
          ); }
    );
  }

}


