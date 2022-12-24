
import 'package:connectivity/connectivity.dart';
import 'package:fantasysuperlig/Screens/Leagues/tryleagepage.dart';
import 'package:fantasysuperlig/Screens/News/haberlerpage.dart';
import 'package:fantasysuperlig/Screens/Oduller/odullerpage.dart';
import 'package:fantasysuperlig/Screens/Oduller/odulpage.dart';
import 'package:fantasysuperlig/Screens/PuanDukkan/splashAd.dart';
import 'package:fantasysuperlig/Screens/PuanDukkan/transferpuandukkan.dart';
import 'package:fantasysuperlig/Screens/SSS/ssspage.dart';
import 'package:fantasysuperlig/Screens/bannerpage.dart';

///Admob
//import 'package:fantasysuperlig/Services/admobservice.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'DuranTop/durantoppage.dart';
import 'Fikstur/fixturepage.dart';
import 'package:fantasysuperlig/Screens/FanteziLigiHaberleri/flhpage.dart';
import 'package:fantasysuperlig/Screens/Leagues/liglerpage.dart';
import 'Leagues/aylikligpage.dart';
import 'Leagues/yillikligpage.dart';
import 'Menu/fantezimenupage.dart';
import 'Puanim/mypointpage.dart';
import 'package:fantasysuperlig/Screens/mypuanpage.dart';
import 'TransferEt/playertransferpage.dart';
import 'Kurallar/rulespage.dart';
import 'Takimim/sizedboxdeneme.dart';
import 'Istatistik/statistics.dart';
import 'package:fantasysuperlig/Services/api_service.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utils/utils.dart';
import '../Variables/global.dart' as global;
import 'TakimKur/create_team.dart';

class FanteziPage extends StatefulWidget {
  @override
  _FanteziPageState createState() => _FanteziPageState();
}

class _FanteziPageState extends State<FanteziPage> {
  int sayi=0;

  void waitLogin() async{
    await checkNetConnectivity();

    if(global.checkNetwork==false){
      _showDialog('Bağlantı Hatası', 'Lütfen internet bağlantınızı kontrol ediniz');
    }

  }
  @override
  void initState() {
    clocktimer!=null?clocktimer.cancel():null;
    waitLogin();
    //getPoints();
   // print('giriş token: '+global.accesstoken);
   /* if(global.pCinsiyet==1){
      /* var data=[];
      data.add(sayi); */
      Navigator.push(context, MaterialPageRoute(builder: (context )=>BannerPage() ));
    } */
   // AdmobHelper.getBannerAd().dispose();

    global.point='0';
   // getBannerAds();
    getToken();
   // puangetir();
    bannergetir();
    if(global.WeekState==0){
      print('hafta kapalı');

    }
  //  _refreshData2();
    super.initState();
  }

  Future<void> puangetir() async{
    await getPoints(global.userid);
  }
  Future<void> bannergetir() async{
    await getBanner(global.userid);
  }
  Future<Null> _refreshData2() async {
    await Future.delayed(Duration(milliseconds: 600));
    //getTakimim(global.userid);
    await getPoints(global.userid);
    setState(() {
    });
  }

  @override
  void dispose() {
    ///Admob
    //AdmobHelper.getBannerAd().dispose();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return global.BannerID==0?Scaffold(
     // backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
      //backgroundColor:  Color.fromARGB(255, 0, 192, 255),
      //backgroundColor:  Colors.grey.shade600,
      backgroundColor: Color(0xFF3366FF),
      body:   SingleChildScrollView(
          child: FutureBuilder(
            future: getTakimim(global.userid),
            builder:  (BuildContext context,AsyncSnapshot snapshot){
              if(snapshot.connectionState==ConnectionState.waiting)
                // {return Center(child: CircularProgressIndicator());}
                  {return Center(child: Container(
                  width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
                  //  color: Color.fromARGB(255, 35, 0, 36),
                  color: Colors.grey.shade900,

                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/FTLlogo.png'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
                        child: Text('Yükleniyor...',style: TextStyle(color: Colors.white,fontSize: 24),),
                      )
                    ],
                  )));
              }
            return Container(
              decoration: BoxDecoration(
              // color: Colors.grey.shade600
                ///  color: Color.fromARGB(255, 55, 0, 60 )
               // image: DecorationImage(image: AssetImage('assets/images/gtc.jpeg'),fit: BoxFit.cover)
               /* gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 55, 0, 60 ),Color.fromARGB(220, 64, 3, 70 ),],stops: [0.5,0.2]
                ) */
                gradient: new LinearGradient(
                    colors: [
                      const Color(0xFF3366FF),
                      const Color(0xFF00CCFF),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),

                //image: DecorationImage(image: AssetImage('assets/images/ptb.jpeg'),fit: BoxFit.cover)
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20,),
                      //Image.asset('assets/images/FSL-logo.png',height: 200,width: 250,),
                      Image.asset('assets/images/FTLlogo.png',height: 200,width: 250,),
                      SizedBox(height: 20,),

                      FutureBuilder(
                        future: getPoints(global.userid),
                        builder: (BuildContext context,AsyncSnapshot snapshot){
                          if(snapshot.connectionState==ConnectionState.waiting){
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                // color: Color.fromARGB(220, 64, 3, 70 ),
                                //color: Color.fromARGB(227, 0, 224, 113),
                                color: Color(0xff131862),
                              ),
                              margin: EdgeInsets.only(left: 15,right: 15),
                              width: MediaQuery.of(context).size.width,
                              //height: 135,
                              //color: Color.fromARGB(220, 64, 3, 70 ),

                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                                    child: Text(
                                      global.fantasyteamname,
                                      style: TextStyle(color: Colors.white,fontSize: 42,fontWeight: FontWeight.w400,fontFamily: 'Sriracha'),
                                    ),
                                  ),
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(color: Colors.white,strokeWidth: 3,),

                                          //Text('',style: MenuBeyazBaslik),
                                          Text('Ortalama',style: MenuBeyazAltBaslik)
                                        ],
                                      ),
                                      ///güzel yeşil Color.fromARGB(227, 7, 249, 136 )
                                      SizedBox(width: 60,),
                                      Column(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(color:int.parse(global.point)<0?Colors.red: Color.fromARGB(227, 7, 249, 136 ),strokeWidth: 3,),
                                        /*  Text('',style: TextStyle(fontSize:41,
                                              color: Color.fromARGB(227, 7, 249, 136 ),fontWeight: FontWeight.w800 )), */
                                          Text('Puanım',
                                              style: TextStyle(fontSize:22,color:int.parse(global.point)<0?Colors.red: Color.fromARGB(227, 7, 249, 136 ),
                                                fontWeight: FontWeight.w800,
                                              )
                                          )
                                        ],
                                      ),
                                      SizedBox(width: 60,),
                                      Column(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(color: Colors.white,strokeWidth: 3,),

                                         // Text('',style: MenuBeyazBaslik,),
                                          Text('En Yüksek',style: MenuBeyazAltBaslik)
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,)
                                ],
                              ),
                            );
                          }
                        return Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                           // color: Color.fromARGB(220, 64, 3, 70 ),
                            //color: Color.fromARGB(227, 0, 224, 113),
                            color: Color(0xff131862),
                          ),
                          margin: EdgeInsets.only(left: 15,right: 15),
                          width: MediaQuery.of(context).size.width,
                          //height: 135,
                          //color: Color.fromARGB(220, 64, 3, 70 ),

                          child: Stack(
                            children:[
                              Positioned(right: -25,top: -25, child: Image.asset('assets/images/football.png',
                                fit: BoxFit.cover,height: 100,width: 100,color: Colors.white60,)
                              ) ,
                              Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                                  child: Text(
                                    global.fantasyteamname,textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,fontSize: 42,fontWeight: FontWeight.w400,fontFamily: 'Sriracha'),
                                  ),
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(global.avgpoint==null?'0':global.avgpoint,style: MenuBeyazBaslik),
                                        Text('Ortalama',style: MenuBeyazAltBaslik)
                                      ],
                                    ),
                                    ///güzel yeşil Color.fromARGB(227, 7, 249, 136 )
                                    SizedBox(width: 60,),
                                    Column(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(global.point==null?'0':global.point,style: TextStyle(fontSize:41,
                                            color: int.parse(global.point)<0?Colors.red: Color.fromARGB(227, 7, 249, 136 ),fontWeight: FontWeight.w800 )),
                                        Text('Puanım',
                                            style: TextStyle(fontSize:22,color:int.parse(global.point)<0?Colors.red: Color.fromARGB(227, 7, 249, 136 ),
                                                fontWeight: FontWeight.w800,
                                            )
                                        )
                                      ],
                                    ),
                                    SizedBox(width: 60,),
                                    Column(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(global.maxpoint==null?'0':global.maxpoint,style: MenuBeyazBaslik,),
                                        Text('En Yüksek',style: MenuBeyazAltBaslik)
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Visibility(visible:global.Expense1==null|| global.Expense1<0?true:false,child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Harcanan Puan: '+global.Expense1.toString()==null?'0':'Harcanan Puan: '+global.Expense1.toString(),style: TextStyle(fontSize: 19,color: Colors.red),),
                                    InkWell(onTap: () {
                                      showDialog(context: context, builder: (BuildContext context){
                                        return AlertDialog(
                                          title: Text('Harcanan Puan Nedir?'),
                                          // content: Text('Harcanan puanlarınız bu hafta ki kazanacağınız puanlardan düşecektir. Ödül kazanma fırsatı için (Transfer Puan Topla) menüsünden harcamalarınızı sıfırlayabilirsiniz.'),);
                                          content: Container(
                                            height: 155,
                                            child: Column(
                                              children: [
                                                RichText(
                                                    text: TextSpan(
                                                        text: 'Harcanan puanlarınız bu haftaki kazanacağınız '
                                                            'puanlardan düşecektir. Ödül kazanma fırsatı için '
                                                        ,style: TextStyle(color: Colors.black,fontSize: 19)
                                                        ,children: [
                                                            TextSpan(
                                                              text:  'Transfer Puan Topla '
                                                              ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange,fontSize: 19),
                                                            ),
                                                           TextSpan(
                                                             text:  'menüsünden harcamalarınızı sıfırlayabilirsiniz.',
                                                             style: TextStyle(color: Colors.black,fontSize: 19)
                                                           )
                                                    ]


                                                    )),
                                                SizedBox(height: 5,),
                                                InkWell(onTap: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context )=>TransferPuanDukkanPage()));
                                                },child: Container(
                                                  alignment: Alignment.center,
                                                  height: 40,width: 80,
                                                  decoration: BoxDecoration(
                                                      color: Colors.orange,
                                                      borderRadius: BorderRadius.circular(15)
                                                  ),
                                                  child: Text('Topla',style: TextStyle(fontWeight: FontWeight.bold),),))
                                              ],
                                            ),
                                          ),);
                                      });
                                    },child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        maxRadius: 12,
                                        child: Text('?',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                      ),
                                    )
                                    ),

                                  ],
                                )),
                                Visibility(visible:global.Expense1<0?true:false,
                            child: SizedBox(height: 8,)),
                              ],
                            ),]
                          ),
                        ); }
                      ),
                      SizedBox(height: 20,),
                      Visibility(visible: global.gelenOyuncuSayisi<15?true:false,
                        child: InkWell(
                          onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateTeamPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                //color: Colors.white,
                                // color: Color.fromARGB(255, 48, 213, 200),
                                color: Colors.white,
                                boxShadow: [BoxShadow(
                                    color: Colors.white.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(0,2)
                                )]
                            ),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 15,right: 15),
                            //padding: EdgeInsets.only(left: 10),
                            width: MediaQuery.of(context).size.width,height: 45,
                            //color: Colors.white,
                            child: Text('Takımını Kur',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                      ///puanım
                      Visibility(visible: global.gelenOyuncuSayisi<15?false:true,
                        child: InkWell(
                          onTap: () {
                             getToken();
                            if(global.WeekState==0){
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context){
                                    return AlertDialog(backgroundColor: Color(0xFF3366FF),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(8.0))),
                                        title: Text('Fikstür haftası başlıyor. Takımınızda değişiklik yapamazsınız. Gelecek haftadaki transferleriniz için transfer puan toplayabilirsiniz',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                                        content: Container(
                                            height: 90,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF3366FF),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text('Açılış Saati: '+global.WeekOpeningTime,style: TextStyle(color: Colors.white,fontSize: 22)),
                                                SizedBox(height: 10,),
                                                GestureDetector(
                                                  onTap: () async{
                                                          Navigator.pop(context);
                                                    //  Navigator.pushNamed(context, '/menu');
                                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>StatisticsPage()));

                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: Color(0xFF00CCFF),
                                                        borderRadius: BorderRadius.circular(15)
                                                    ),width: 150,height: 30,
                                                    child: Text(
                                                      "Tamam",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))); }
                              );
                            }
                            else if(global.gelenOyuncuSayisi>=15) {
                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPuanPage()));
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPointPage()));
                            }
                            else{
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                        title: Text(
                                          'Kadronuzu tamamen oluşturmadan Puan sayfasına giremezsin',
                                          textAlign: TextAlign.center,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(8.0))),
                                        content: Container(alignment: Alignment.center,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateTeamPage()));

                                              },
                                              child: Center(
                                                child: Text(
                                                  "Tamam",
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ))); }
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                //image: DecorationImage(image: AssetImage('assets/images/puanim3.png'),fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(25),
                              //color: Colors.white,
                             // color: Color.fromARGB(255, 48, 213, 200),
                              color: Colors.white,
                              boxShadow: [BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0,2)
                              )]
                            ),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 15,right: 15),
                            //padding: EdgeInsets.only(left: 10),
                            width: MediaQuery.of(context).size.width,height: 45,
                            //color: Colors.white,
                            child: Text('Puanım',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                      Visibility(visible: global.gelenOyuncuSayisi<15?false:true,
                          child: SizedBox(height: 10,)),
                      ///takımım ve transfer
                      Visibility(visible: global.gelenOyuncuSayisi<15?false:true,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: (){
                                   getToken();

                                  //Navigator.pushNamed(context, '/deneme2');
                                  if(global.WeekState==0){
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context){
                                          return AlertDialog(backgroundColor: Color(0xFF3366FF),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.all(Radius.circular(8.0))),
                                              title: Text('Fikstür haftası başlıyor. Takımınızda değişiklik yapamazsınız. Gelecek haftadaki transferleriniz için transfer puan toplayabilirsiniz',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                                              content: Container(
                                                  height: 90,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF3366FF),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text('Açılış saati: '+global.WeekOpeningTime,style: TextStyle(color: Colors.white,fontSize: 22)),
                                                      SizedBox(height: 10,),
                                                      GestureDetector(
                                                        onTap: () async{
                                                          Navigator.pop(context);
                                                          //  Navigator.pushNamed(context, '/menu');
                                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>StatisticsPage()));

                                                        },
                                                        child: Container(
                                                          alignment: Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color: Color(0xFF00CCFF),
                                                              borderRadius: BorderRadius.circular(15)
                                                          ),width: 150,height: 30,
                                                          child: Text(
                                                            "Tamam",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.bold,fontSize: 20),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ))); }
                                    );
                                  }
                                  else if(global.gelenOyuncuSayisi>=15) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SizedBoxDeneme()));
                                  }
                                  else{
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context){
                                          return AlertDialog(
                                              title: Text(
                                                'Kadronuzu tamamen oluşturmadan Takımım sayfasına giremezsin',
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.all(Radius.circular(8.0))),
                                              content: Container(alignment: Alignment.center,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateTeamPage()));

                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        "Tamam",
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ))); }
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    //image: DecorationImage(image: AssetImage('assets/images/takimimbutton.png'),fit: BoxFit.cover),

                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 15,right: 5),
                                  //padding: EdgeInsets.only(left: 10),
                                  height: 45,
                                  child: Text('Takımım',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),

                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                   getToken();
                                  // Navigator.pushNamed(context, '/createteam');
                                  if(global.WeekState==0){
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context){
                                          return AlertDialog(backgroundColor: Color(0xFF3366FF),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.all(Radius.circular(8.0))),
                                              title: Text('Fikstür haftası başlıyor. Takımınızda değişiklik yapamazsınız. Gelecek haftadaki transferleriniz için transfer puan toplayabilirsiniz',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                                              content: Container(
                                                  height: 90,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF3366FF),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text('Açılış Satti: '+global.WeekOpeningTime,style: TextStyle(color: Colors.white,fontSize: 22)),
                                                      SizedBox(height: 10,),
                                                      GestureDetector(
                                                        onTap: () async{
                                                          Navigator.pop(context);
                                                          //  Navigator.pushNamed(context, '/menu');
                                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>StatisticsPage()));

                                                        },
                                                        child: Container(
                                                          alignment: Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color: Color(0xFF00CCFF),
                                                              borderRadius: BorderRadius.circular(15)
                                                          ),width: 150,height: 30,
                                                          child: Text(
                                                            "Tamam",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.bold,fontSize: 20),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ))); }
                                    );
                                  }
                                  else if(global.gelenOyuncuSayisi>=15) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PlayerTransferPage()));
                                  }
                                  else{
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context){
                                          return AlertDialog(
                                              title: Text(
                                                'Kadronuzu tamamen oluşturmadan transfer yapamazsınız',
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.all(Radius.circular(8.0))),
                                              content: Container(alignment: Alignment.center,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateTeamPage()));

                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        "Tamam",
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ))); }
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                   // image: DecorationImage(image: AssetImage('assets/images/transfer.png'),fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 5,right: 15),
                                  width: MediaQuery.of(context).size.width/3,height: 45,
                                  //color: Colors.white,
                                  child: Text('Transfer',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      ///fantezi ligi haberleri
                      InkWell(
                        onTap: ()async{
                          await getToken();
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>HaberPage()));

                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>FanteziLigiHaberPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width,height: 45,
                          child: Text('Fantezi Ligi Haberleri',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      ///fikstür ve sonuçlar
                      InkWell(
                        onTap: () async{
                          await getToken();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FixturePage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width,height: 45,
                          //color: Colors.white,
                          child: Text('Fikstür & Sonuçlar',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height: 10,),

                      ///istatistik
                      InkWell(
                        onTap: () async{
                          await getToken();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> StatisticsPage(),));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            //color:  Colors.white,
                            color:  Color.fromARGB(227, 7, 249, 136 ),
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width,height: 45,
                          //color: Colors.white,
                          child: Text('İstatistik',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      ///Duran top kullanıcıları
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DuranTopPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width,height: 45,
                          //color: Colors.white,
                          child: Text('Duran Top Kullanıcıları',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      ///FTL bildilirimleri
                      InkWell(
                        onTap: () {
                         // checkNetConnectivity();
                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>TryLeaguePage()));
                        showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    backgroundColor: Color(
                                        0xFF3366FF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius
                                            .circular(8.0))),
                                    title: Container(
                                        alignment: Alignment
                                            .center,
                                        child: Text('Bu kısım yapım aşamasında',
                                          style: TextStyle(
                                              color: Colors
                                                  .white),)),
                                    content: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Color(
                                              0xFF3366FF),
                                        ),
                                        child: GestureDetector(
                                          onTap: ()  {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FanteziMenuPage()));
                                          //  Navigator.pop(context);


                                            //  Navigator.pushNamed(context, '/menu');
                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>StatisticsPage()));

                                          },
                                          child: Container(
                                            alignment: Alignment
                                                .center,
                                            decoration: BoxDecoration(
                                                color: Color(
                                                    0xFF00CCFF),
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    15)
                                            ),
                                            width: 180,
                                            height: 30,
                                            child: Text(
                                              "Tamam",
                                              style: TextStyle(
                                                  color: Colors
                                                      .white,
                                                  fontWeight: FontWeight
                                                      .bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        )));
                              }
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width,height: 45,
                          //color: Colors.white,
                          child: Text('FTL Bildirimleri',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      ///ödüller
                      InkWell(
                        onTap: () {
                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>OdullerPage()));
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OdulPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                           // image: DecorationImage(image: AssetImage('assets/images/oduller.png'),fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(25),
                            //color: Color.fromARGB(227, 7, 249, 136 ),
                            color: Color.fromARGB(227, 7, 249, 136 ),
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          //padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width,height: 45,
                          //color: Color.fromARGB(227, 7, 249, 136 ),
                          child: Text('Ödüller',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      ///yardımcılar
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SSSPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width,height: 45,
                          //color: Colors.white,
                          child: Text('Sıkça Sorunlan Sorular',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      ///kurallar
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RulesPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width,height: 45,
                          //color: Colors.white,
                          child: Text('Kurallar',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashAdScreen()));
                        },
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            //color:  Colors.white,
                           // color:  Color.fromARGB(227, 7, 249, 136 ),
                            color:  Colors.orange.shade400,
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15,right: 15),
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width,height: 45,
                          //color: Colors.white,
                          child: Text('Transfer Puanı Topla',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      ///fantazi ligler
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 15,right: 15),
                        padding: EdgeInsets.only(left: 10),
                        width: MediaQuery.of(context).size.width,height: 249,
                        //color: Colors.white,
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0,top: 8),
                              child: Text('Fantezi Ligler',style: MenuSiyahBaslikMetin,textAlign: TextAlign.left,),
                            ),
                            SizedBox(height: 8,),
                            Container(alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(left: 15,right: 15),
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width,height: 40,color: Colors.grey.shade300,
                              child: Text('Sıralamlar',style: MenuSiyahMetin,),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: InkWell(
                                onTap: () {
                                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaguePage()));
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 16,),
                                        //Text('Konum'),
                                        Text('          '),
                                        SizedBox(width: 25,),
                                        Text('Sıralama'),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    InkWell(
                                      onTap: () async{
                                        await getToken();
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaguePage()));
                                      },
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                SizedBox(width: 16,),
                                                //Text(global.HaftalikSira==null?'0':global.HaftalikSira.toString()),
                                                InkWell(onTap:(){
                                                  showDialog(context: context, builder: (BuildContext context){
                                                    return AlertDialog(content: Text(global.HLAciklama),);
                                                  });
                                                },
                                                    child: CircleAvatar(child: Text('?'),maxRadius: 12,)),
                                                SizedBox(width: 45,),
                                                InkWell(onTap: () async{
                                                  await getToken();
                                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaguePage()));
                                                },child: Text(global.HaftalikLigAdi==null?'Haftalık Lig':global.HaftalikLigAdi,style: MenuSiyahMetin)),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 16.0),
                                            child: Icon(Icons.remove_red_eye,color: Colors.purple,),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Divider(height: 10,thickness: 1.5,color: Colors.grey.shade600,indent: 12,endIndent: 12,),
                                    SizedBox(height: 5,),
                                    InkWell(onTap: () async{
                                      await getToken();

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AylikLeaguePage()));
                                    },
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                SizedBox(width: 16,),
                                              //  Text(global.AylikSira==null?'0':global.AylikSira.toString()),
                                                InkWell(onTap:(){
                                                  showDialog(context: context, builder: (BuildContext context){
                                                    return AlertDialog(content: Text(global.ALAciklama),);
                                                  });
                                                },
                                                    child: CircleAvatar(child: Text('?'),maxRadius: 12,)),
                                                SizedBox(width: 45,),
                                                Text(global.AylikLigAdi==null?'Aylık Lig':global.AylikLigAdi,style: MenuSiyahMetin),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 16.0),
                                            child: Icon(Icons.remove_red_eye,color: Colors.purple,),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Divider(height: 10,thickness: 1.5,color: Colors.grey.shade600,indent: 12,endIndent: 12,),
                                    SizedBox(height: 5,),
                                    InkWell(onTap: () async{
                                      await getToken();
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>YillikLeaguePage()));
                                    },
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                SizedBox(width: 16,),
                                              //  Text(global.SezonlukLig==null?'0':global.SezonlukLig.toString()),
                                                InkWell(onTap:(){
                                                  showDialog(context: context, builder: (BuildContext context){
                                                    return AlertDialog(content: Text(global.SLAciklama),);
                                                  });
                                                },
                                                    child: CircleAvatar(child: Text('?'),maxRadius: 12,)),
                                                SizedBox(width: 45,),
                                                Text(global.SezonlukLigAdi==null?'Sezon Lig':global.SezonlukLigAdi,style: MenuSiyahMetin,),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 16.0),
                                            child: Icon(Icons.remove_red_eye,color: Colors.purple,),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      ///Takımım görünümü
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 15,right: 15),
                        padding: EdgeInsets.only(left: 10),
                        width: MediaQuery.of(context).size.width,height: 300,
                        //color: Colors.white,
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0,top: 8),
                              child: Text('Takımının Görünümü',style: MenuSiyahBaslikMetin,textAlign: TextAlign.left,),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              child: Column(
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Text('Son Hafta Alınanan Puan'),
                                      ),
                                     // SizedBox(width: 205,),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Text(global.point==null?'0':global.point,style: MenuSiyahMetin,),
                                      ),
                                      //SizedBox(width: 25,)
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Divider(height: 10,thickness: 1.5,color: Colors.grey.shade600,indent: 12,endIndent: 12,),
                                  SizedBox(height: 5,),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Text('Toplam Puan'),
                                      ),
                                      //SizedBox(width: 278,),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Text(global.SeasonPoint==null?'0':global.SeasonPoint,style: MenuSiyahMetin),
                                      ),
                                     // SizedBox(width: 25,)

                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Divider(height: 10,thickness: 1.5,color: Colors.grey.shade600,indent: 12,endIndent: 12,),
                                  SizedBox(height: 5,),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Text('Genel Sıralama'),
                                      ),
                                      //SizedBox(width: 265,),

                                      Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Text('0',style: MenuSiyahMetin),
                                      ),
                                     // SizedBox(width: 25,)
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Divider(height: 10,thickness: 1.5,color: Colors.grey.shade600,indent: 12,endIndent: 12,),
                                  SizedBox(height: 5,),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Text('Bütçe'),
                                      ),
                                      //SizedBox(width: 295,),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Text(global.PointButce==null?'0':global.PointButce+'M ₺',style: MenuSiyahMetin,),
                                      ),
                                      //SizedBox(width: 25,)
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Divider(height: 10,thickness: 1.5,color: Colors.grey.shade600,indent: 12,endIndent: 12,),
                                  SizedBox(height: 5,),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Text('Takım Değeri'),
                                      ),
                                      //SizedBox(width: 280,),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Text(global.TeamValue==null?'0':global.TeamValue+'M ₺',style: MenuSiyahMetin,),
                                      ),
                                      //SizedBox(width: 25,)
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Divider(height: 10,thickness: 1.5,color: Colors.grey.shade600,indent: 12,endIndent: 12,),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Text('Transfer Puanı'),
                                      ),
                                     // SizedBox(width: 200,),
                                    //  SizedBox(width: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Row(
                                          children: [
                                            Text(global.transferpoint==null?'0':global.transferpoint,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                            SizedBox(width: 10,),
                                            ElevatedButton(
                                                onPressed: (){
                                                     // Navigator.pushNamed(context, '/tpd');
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashAdScreen()));
                                                },
                                                child: Text('Topla',style: MenuSiyahMetin,),
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.orange.shade400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                   //   SizedBox(width: 10,)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 225,),
                    ],
                  ),
             /*     Visibility(visible: sayi==0?true:false,
                    child: Positioned(
                      top: 40,left: 50,
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,height: 150,
                        color: Colors.greenAccent,
                        child: Container(
                          //color: Colors.purple,

                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: () {
                                setState(() {
                                  sayi=1;
                                });
                              }, icon: Icon(Icons.add)),
                              Text('Profili doldur'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ), */

                ],
              ),
            ); }
          ),
        ),
    ):BannerPage();

  }
  checkNetConnectivity() async{
    var result=await Connectivity().checkConnectivity();
    if(result==ConnectivityResult.none){
      //checkNetwork=false;
      global.checkNetwork=false;
      //  _showDialog('net yok ', 'internetiniz yok');
    }
    else if(result==ConnectivityResult.wifi){
      global.checkNetwork=true;
     // checkNetwork=true;
      //_showDialog('wifi', 'wifi bağlı');
    }
    else if(result==ConnectivityResult.mobile){
      //checkNetwork=true;
      global.checkNetwork=true;

      //_showDialog('mobil veri', 'mobil veri bağlı');
    }
  }
  _showDialog(title,text){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(content: Text(text),title: Text(title),);
    });
  }
}
