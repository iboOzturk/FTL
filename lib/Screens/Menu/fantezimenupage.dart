import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantasysuperlig/Screens/Leagues/ozelliglerpage.dart';
import 'package:fantasysuperlig/Screens/Oduller/newodullerpage.dart';
import 'package:fantasysuperlig/Screens/PuanDukkan/transferpuandukkan.dart';
import 'package:fantasysuperlig/Screens/bannerpage.dart';
import 'package:fantasysuperlig/Services/api_service.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Variables/global.dart' as global;
import 'dart:math' as math;
class FanteziMenuPage extends StatefulWidget {
  @override
  _FanteziMenuPageState createState() => _FanteziMenuPageState();
}

class _FanteziMenuPageState extends State<FanteziMenuPage> {
  Future<void> bannergetir() async{
    await getBanner(global.userid);
  }
  @override
  void initState() {
    getBannerAds();
    bannergetir();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double uzunluk=MediaQuery.of(context).size.height;
    double genislik=MediaQuery.of(context).size.width;
    return global.BannerID==0?Scaffold(
      body: Container(
          height: uzunluk,width: genislik,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/FTLBackground.png'),
            fit: BoxFit.cover)
          ),
          child: SingleChildScrollView(
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
              Image.asset('assets/images/FTLNewLogoBeyaz.png'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
                child: Text('Yükleniyor...',style: TextStyle(color: Colors.white,fontSize: 24),),
              )
            ],
          )));
      }
              return SafeArea(
                child: Column(
                  children: [
                    ///Logo ve Canlı Yazısı
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(flex: 1,child: Image.asset('assets/images/FTLNewLogo.png',fit: BoxFit.contain,height: 100,width: 100,)),
                        Expanded(flex: 1,
                          child: Visibility(
                            visible: true,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/hlig');
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Container(width: genislik*.55,height: 55,
                                  decoration: BoxDecoration(
                                  color: Colors.transparent,border: Border.all(color: Colors.transparent,width: 2)
                                ),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.live_tv,color: Colors.white,),
                                      Text('Canlı Puan Takİbİ',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 21,color: Colors.white),),
                                      //Container(width: genislik*.35,height: 2,color: Colors.white,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    ///Sponsor Yazısı Başlangıç
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                      child: Container(width: genislik,height: 2,color: Colors.white,),
                    ),
                   CarouselSlider(
                     items: [
                     Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Container(
                           width: 85,height: 85,
                           decoration: BoxDecoration(
                             image: DecorationImage(image: AssetImage(
                               'assets/images/ensofra.png'
                             ),fit: BoxFit.contain,)
                           ),
                         ),
                         Text('ensofra.com',style: TextStyle(color: Colors.white,fontSize: 19))
                       ],
                     ),
                     Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Container(
                           width: 105,height: 105,
                           decoration: BoxDecoration(
                               image: DecorationImage(image: AssetImage(
                                   'assets/images/yubabeyaz.png'
                               ))
                           ),
                         ),
                         Text('yubaticaret.com',style: TextStyle(color: Colors.white,fontSize: 19),)

                       ],
                     )
                   ],options:
                     CarouselOptions(
                       height: 45,
                       enlargeCenterPage: true,
                       autoPlay: true,
                       aspectRatio: 16/9,
                       autoPlayCurve: Curves.easeOutSine,
                       enableInfiniteScroll: true,
                       autoPlayAnimationDuration: Duration(milliseconds: 700),
                       viewportFraction: 0.8
                     ),),
                   //SizedBox(height: 45,),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                      child: Container(width: genislik,height: 2,color: Colors.white,),
                    ),
                    ///Sponsor Yazısı Bitiş

                     Padding(
                       padding: const EdgeInsets.only(top: 16.0),
                       child: Stack(
                         children: [

                           Column(
                             children: [
                               Container(alignment: Alignment.center,width: genislik*.49,height: 80,decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),color: Colors.orange,border: Border.all(color: Colors.white,width: 2)
                    ),child: Container(padding: EdgeInsets.all(4),child: AutoSizeText(global.fantasyteamname,minFontSize: 24,textAlign: TextAlign.center,maxLines: 1,style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 45,color: Colors.white),)),
                               ),
                               ///Mavi yerler
                               Stack(
                                   children:[
                                     Transform(
                                       alignment: Alignment.center,
                                       transform: Matrix4.rotationX(math.pi),
                                       child: ClipPath(
                                         clipper: MyCustomClipper(),
                                         child: Container(
                                           decoration: BoxDecoration(
                                             color: Color(0xff3366ff),
                                           ),
                                           width: genislik*.53,height: 30,
                                         ),
                                       ),
                                     ),
                                     Positioned(top: 0,right: 10,left: 10,
                                         child: Container(alignment: Alignment.topCenter,
                                           width:genislik*.47,height: 10,
                                           decoration: BoxDecoration(color: Color(0xff00ccff),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),))
                                   ]
                               ),
                             ],
                           ),
                           Positioned(bottom: 15,right: -5,child: Image.asset('assets/images/futboltop.png',height: 52,width: 52,)),
                           Positioned(bottom: 15,left: -5,child: Image.asset('assets/images/futboltop.png',height: 52,width: 52,)),
                         ],
                       ),
                     ),

                    ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        width: genislik*.85,height: 30,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.grey.shade800
                            ],begin: Alignment.bottomCenter,end: Alignment.topCenter
                          ),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5))
                        ),
                        child: Row(
                          children: [
                            Expanded(flex: 2,child: Text('Ortalama',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 21,color: Colors.white),textAlign: TextAlign.center,)),
                            Container(height: 20,width: 2,color: Colors.white,),
                            Expanded(flex: 2,child: Text('Puanım',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 21,color: Colors.white),textAlign: TextAlign.center)),
                            Container(height: 20,width: 2,color: Colors.white,),
                            Expanded(flex: 2,child: Text('En Yüksek',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 21,color: Colors.white),textAlign: TextAlign.center))
                          ],
                        ),
                      ),
                    ),
                ///Puanların olduğu yer
                        FutureBuilder(
    future: getPoints(global.userid),
    builder: (BuildContext context,AsyncSnapshot snapshot){
    if(snapshot.connectionState==ConnectionState.waiting){
      return ClipPath(
        clipper: MyCustomClipper2(),
        child: Container(
          width: genislik*.82,height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5),
                  bottomRight: Radius.circular(72),bottomLeft: Radius.circular(72)),
              gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,end: Alignment.bottomCenter,
                  stops: [0.8,0.3]
              )
            //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45))
          ),
          child: Row(
            children: [
              Expanded(flex: 2,child: Container(padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(color: Colors.black,)))
              ,
              ClipPath(
                clipper: MyCustomClipper2(),
                child: Container(alignment: Alignment.center,
                  width: genislik*.32,height: 95,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.grey.shade900
                          ],begin: Alignment.bottomCenter,end: Alignment.topCenter
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45)
                      )
                  ),
                  child:
                  CircularProgressIndicator(color: Colors.white,),
                ),
              ),
              Expanded(flex: 2,child: Container(padding: EdgeInsets.only(right: 15),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(color: Colors.black,)))
            ],
          ),
        ),
      );
    }
                          return Column(
                            children: [
                              ClipPath(
                              clipper: MyCustomClipper2(),
                              child: Container(
                                width: genislik*.82,height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(72),bottomLeft: Radius.circular(72)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.transparent,
                                    ],
                                    begin: Alignment.topCenter,end: Alignment.bottomCenter,
                                    stops: [0.8,0.3]
                                  )
                                //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45))
                                ),
                                child: Row(
                                  children: [
                                    Expanded(flex: 2,child: Container(padding: EdgeInsets.only(left: 15),
                                        alignment: Alignment.center,
                                        child: AutoSizeText(global.avgpoint==null?'0':global.avgpoint,maxLines: 1,minFontSize: 30,style: TextStyle(fontSize: 60,fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,color: Colors.black),textAlign: TextAlign.center)))
                                    ,
                                    ClipPath(
                                      clipper: MyCustomClipper2(),
                                      child: Container(alignment: Alignment.center,
                                        width: genislik*.32,height: 95,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Colors.black,
                                                  Colors.grey.shade900
                                                ],begin: Alignment.bottomCenter,end: Alignment.topCenter
                                            ),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45)
                                            )
                                        ),
                                        child:
                                        AutoSizeText(global.point==null?'0':global.point,maxLines: 1,minFontSize: 30,style: TextStyle(fontSize: 55,fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,color: Colors.white,),textAlign: TextAlign.center,),
                                      ),
                                    ),
                                    Expanded(flex: 2,child: Container(padding: EdgeInsets.only(right: 15),
                                        alignment: Alignment.center,
                                        child: AutoSizeText(global.maxpoint==null?'0':global.maxpoint,maxLines: 1,minFontSize: 30,style: TextStyle(fontSize: 60,fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,color: Colors.black),textAlign: TextAlign.center)))
                                  ],
                                ),
                              ),
                      ),
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
                          ); }
                        ),
                    ///Puanım
                    Visibility(visible: global.gelenOyuncuSayisi<15?false:true,
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 12.0,bottom: 12),
                            child: Stack(
                              children: [
                                GestureDetector(
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
                                     Navigator.pushNamed(context, '/puanim');
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
                                                        Navigator.pushNamed(context, '/olustur');


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
                                  child: Container(alignment: Alignment.center,
                                    margin: EdgeInsets.only(left: 20,right: 20),
                                    width: genislik*.80,height: 65,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.grey.shade400,
                                            Colors.grey.shade700,
                                            Colors.grey.shade300
                                          ],begin: Alignment.centerLeft,end: Alignment.centerRight,
                                        stops: [
                                          0.2,0.27,0.7
                                        ]
                                      ),
                                      //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45))
                                    ),
                                    child: Container(alignment: Alignment.center,width: genislik*.65,height: 60,decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.black,
                                            Colors.grey.shade800
                                          ],begin: Alignment.bottomCenter,end: Alignment.topCenter
                                      ),
                                    )
                                      ,child: Text('PUANIM',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 38,color: Colors.white),),),
                                  ),
                                ),
                                Positioned(bottom: 0,left: -5,top: 0,child: Image.asset('assets/images/futboltop.png',height: 85,width: 85,fit: BoxFit.cover,)),
                                Positioned(bottom: 0,right: -5,top: 0,child: Image.asset('assets/images/futboltop.png',height: 85,width: 85,fit: BoxFit.cover,)),

                              ],
                            ),
                          ),
                          ///Takımım ve Transfer
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: 15,),
                              ///Takımım
                              GestureDetector(
                              onTap: () {
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
                                  Navigator.pushNamed(context, '/takimim');}
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
                                                    Navigator.pushNamed(context, '/olustur');

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
                              }
                              ,child: menuButton(genislik2: genislik*.41,genislik: genislik*.40,renk: Colors.black,renk2: Colors.grey.shade800,text: 'Takımım',textcolor: Colors.white,height2: 55,height: 50,)),
                              SizedBox(width: 15,),
                              ///Transfer
                              GestureDetector(
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
                                      Navigator.pushNamed(context, '/transfer');
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
                                                        Navigator.pushNamed(context, '/olustur');

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
                                  child: menuButton(genislik2: genislik*.41,genislik: genislik*.40,renk: Colors.black,renk2: Colors.grey.shade800,text: 'Transfer',textcolor: Colors.white,height2: 55,height: 50,)),
                              SizedBox(width: 15,),

                            ],
                          ),
                        ],
                      ),
                    ),
                    Visibility(visible: global.gelenOyuncuSayisi<15?true:false,child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/olustur');
                        },
                        child: menuButton(genislik2: genislik*.80,genislik: genislik*.79,renk: Colors.black,renk2: Colors.grey.shade800,text: 'Takım Kur',textcolor: Colors.white,height2: 55,height: 50,)),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/haber');
                        },
                        child: menuButton(genislik2: genislik*.80,genislik: genislik*.79,renk: Colors.black,renk2: Colors.grey.shade800,text: 'Fantezİ LİGİ Haberlerİ',textcolor: Colors.white,height2: 55,height: 50,)),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/fikstur');
                        },
                        child: menuButton(genislik2: genislik*.80,genislik: genislik*.79,renk: Colors.black,renk2: Colors.grey.shade800,text: 'Fİkstür & Sonuçları',textcolor: Colors.white,height2: 55,height: 50,)),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/istatistik');
                        },
                        child: menuButton(genislik2: genislik*.80,genislik: genislik*.79,renk: Colors.black,renk2: Color.fromARGB(227, 7, 249, 136 ),text: 'İstatİstİk',textcolor: Colors.white,height: 50,height2: 55)),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/durantop');
                        },
                        child: menuButton(genislik2: genislik*.80,genislik: genislik*.79,renk: Colors.black,renk2: Colors.grey.shade800,text: 'Duran Top Kullanıcıları',textcolor: Colors.white,height: 50,height2: 55)),
                    GestureDetector(
                        onTap: () {
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
                                            Navigator.pop(context);
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
                        child: menuButton(genislik2: genislik*.80,genislik: genislik*.79,renk: Colors.black,renk2: Colors.grey.shade800,text: 'FTL Bİldİrİmlerİ',textcolor: Colors.white,height: 50,height2: 55)),
                    GestureDetector(
                        onTap: () {
                          //Navigator.pushNamed(context, '/odul');
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewOdullerPage()));
                        },
                        child: menuButton(genislik2: genislik*.80,genislik: genislik*.79,renk: Colors.black,renk2: Color.fromARGB(227, 7, 249, 136 ),text: 'Ödüller',textcolor: Colors.white,height: 50,height2: 55)),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/sss');
                        },
                        child: menuButton(genislik2: genislik*.80,genislik: genislik*.79,renk: Colors.black,renk2: Colors.grey.shade800,text: 'Sıkça Sorulan Sorular',textcolor: Colors.white,height: 50,height2: 55)),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/kurallar');
                        },
                        child: menuButton(genislik2: genislik*.80,genislik: genislik*.79,renk: Colors.black,renk2: Colors.grey.shade800,text: 'Kurallar',textcolor: Colors.white,height: 50,height2: 55)),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/reklamgecis');
                        },
                        child: menuButton(genislik2: genislik*.80,genislik: genislik*.79,renk: Colors.black,renk2: Colors.orange,text: 'Transfer Puanı Topla',textcolor: Colors.white,height: 50,height2: 55)),
                    ///Fantezi Ligler
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                      child: Container(width: genislik*.80,color: Colors.transparent,child: Text('Fantezİ Lİgler',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 40,color: Colors.white),),),
                    ),
                    Container(width: genislik*.80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent,border: Border.all(color: Colors.white,width: 2)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 25,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8,top: 16,bottom: 12),

                            child: Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/hlig');
                                  },
                                  child: Container(padding: EdgeInsets.only(left: 25),width: genislik,
                                    margin: EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(flex: 3,child: Text(global.HaftalikLigAdi==null?'Haftalık Lig':global.HaftalikLigAdi,style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 20,color: Colors.white))),
                                      Expanded(flex: 1,
                                        child: IconButton(onPressed: () {
                                          Navigator.pushNamed(context, '/hlig');

                                        }, icon: Icon(Icons.remove_red_eye,color: Colors.white,)),
                                      )
                                    ],
                                  ),),
                                ),
                                Positioned(bottom: 0,left: -5,top: 0,child: GestureDetector(
                                onTap: () {
                                  showDialog(context: context, builder: (BuildContext context){
                                    return AlertDialog(content: Text(global.HLAciklama),);
                                  });
                                }
                                ,child: Image.asset('assets/images/futboltop.png',height: 45,width: 45,))),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8,top: 16,bottom: 12),

                            child: Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/alig');
                                  },
                                  child: Container(padding: EdgeInsets.only(left: 25),
                                    width: genislik,margin: EdgeInsets.only(left: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.circular(5)
                                      ),child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [
                                      Expanded(flex: 3,child: Text(global.AylikLigAdi==null?'Aylık Lig':global.AylikLigAdi,style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 20,color: Colors.white))),
                                      Expanded(flex: 1,
                                        child: IconButton(onPressed: () {
                                          Navigator.pushNamed(context, '/alig');

                                        }, icon: Icon(Icons.remove_red_eye,color: Colors.white,)),
                                      )
                                    ],
                                  ),),
                                ),
                                Positioned(bottom: 0,left: -5,top: 0,child: GestureDetector(
                                onTap: () {
                                  showDialog(context: context, builder: (BuildContext context){
                                    return AlertDialog(content: Text(global.ALAciklama),);
                                  });
                                }
                                ,child: Image.asset('assets/images/futboltop.png',height: 45,width: 45,))),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8,top: 16,bottom: 12),
                            child: Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/ylig');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(left: 25),
                                    width: genislik,margin: EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(flex: 3,child: Text(global.SezonlukLigAdi==null?'Sezon Lig':global.SezonlukLigAdi,style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 20,color: Colors.white),)),
                                      Expanded(flex: 1,
                                        child: IconButton(onPressed: () {
                                          Navigator.pushNamed(context, '/ylig');

                                        }, icon: Icon(Icons.remove_red_eye,color: Colors.white,)),
                                      )
                                    ],
                                  ),),
                                ),
                                Positioned(bottom: 0,left: 0,top: 0,child: GestureDetector(
                                onTap: () {
                                  showDialog(context: context, builder: (BuildContext context){
                                    return AlertDialog(content: Text(global.SLAciklama),);
                                  });
                                }
                                ,child: Image.asset('assets/images/futboltop.png',height: 45,width: 45,))),

                              ],
                            ),
                          ),
                          FutureBuilder(
                              future: getPoints(global.userid),
                              builder: (BuildContext context,AsyncSnapshot snapshot){
                                if(snapshot.connectionState==ConnectionState.waiting){
                                  return SizedBox();
                                }
                                return Column(
                                  children: [
                                    Visibility(
                                      visible: global.OzelLig1Durum==0?false:true,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 16,bottom: 12),
                                        child: Stack(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(context, '/ol1lig');
                                              },
                                              child: Container(
                                                padding: EdgeInsets.only(left: 25),
                                                width: genislik,margin: EdgeInsets.only(left: 20),
                                                decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius: BorderRadius.circular(5)
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Expanded(flex: 3,child: Text(global.OzelLig1Adi==null?'Özel Lig':global.OzelLig1Adi,style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 20,color: Colors.white),)),
                                                    Expanded(flex: 1,
                                                      child: IconButton(onPressed: () {
                                                        Navigator.pushNamed(context, '/ol1lig');

                                                      }, icon: Icon(Icons.remove_red_eye,color: Colors.white,)),
                                                    )
                                                  ],
                                                ),),
                                            ),
                                            Positioned(bottom: 0,left: 0,top: 0,child: GestureDetector(
                                            onTap: () {
                                              showDialog(context: context, builder: (BuildContext context){
                                                return AlertDialog(content: Text(global.OzelLig1Aciklama),);
                                              });
                                            },
                                            child: Image.asset('assets/images/futboltop.png',height: 45,width: 45,))),

                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: global.OzelLig2Durum==0?false:true  ,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 16,bottom: 12),
                                        child: Stack(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(context, '/ol2lig');
                                              },
                                              child: Container(
                                                padding: EdgeInsets.only(left: 25),
                                                width: genislik,margin: EdgeInsets.only(left: 20),
                                                decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius: BorderRadius.circular(5)
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Expanded(flex: 3,child: Text(global.OzelLig2Adi==null?'Özel Lig':global.OzelLig2Adi,style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 20,color: Colors.white),)),
                                                    Expanded(flex: 1,
                                                      child: IconButton(onPressed: () {
                                                        Navigator.pushNamed(context, '/ol2lig');

                                                      }, icon: Icon(Icons.remove_red_eye,color: Colors.white,)),
                                                    )
                                                  ],
                                                ),),
                                            ),
                                            Positioned(bottom: 0,left: 0,top: 0,child: GestureDetector(
                                            onTap: () {
                                              showDialog(context: context, builder: (BuildContext context){
                                                return AlertDialog(content: Text(global.OzelLig2Aciklama),);
                                              });
                                            },child: Image.asset('assets/images/futboltop.png',height: 45,width: 45,))),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );}
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8,top: 16,bottom: 12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>OzelLiglerPage()));
                              //  Navigator.pushNamed(context, '/ylig');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 10,bottom: 10),
                                width: genislik,margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Text('Özel Ligler',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 20,color: Colors.white),),),
                            ),
                          ),

                          SizedBox(height: 25,),
                        ],
                      ),
                    ),
                    ///Takımım Görünümü
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                      child: Container(width: genislik*.80,color: Colors.transparent,child: Text('Takımın Görünümü',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 40,color: Colors.white),),),
                    ),
                    Container(width: genislik*.80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent,border: Border.all(color: Colors.white,width: 2)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 25,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('SON HAFTA ALINAN PUAN',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 30,color: Colors.white),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: FutureBuilder(future: getPoints(global.userid),
                                  builder: (BuildContext context,AsyncSnapshot snapshot){return Text(global.point==null?'0':global.point,style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 30,color: Colors.white));}),
                            )
                          ],),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('Toplam Puan',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 30,color: Colors.white),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: FutureBuilder(future: getPoints(global.userid),
                                  builder: (BuildContext context,AsyncSnapshot snapshot){return Text(global.SeasonPoint==null?'0':global.SeasonPoint,style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 30,color: Colors.white));}),
                            )
                          ],),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Genel Sıralama',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 30,color: Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: FutureBuilder(
                                    future: getPoints(global.userid),
                                    builder: (BuildContext context,AsyncSnapshot snapshot){
    return  Text(global.SezonlukLig==null?'0':global.SezonlukLig.toString(),style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 30,color: Colors.white));}),
                              )
                            ],),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Bütçe',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 30,color: Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: FutureBuilder(
                                    future: getPoints(global.userid),
                                    builder: (BuildContext context,AsyncSnapshot snapshot){
                                return Text(global.PointButce==null?'0':global.PointButce+'M',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 30,color: Colors.white));})
                              )
                            ],),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Takım Değerİ',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 30,color: Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: FutureBuilder(
    future: getPoints(global.userid),
    builder: (BuildContext context,AsyncSnapshot snapshot){
                                return Text(global.TeamValue==null?'0':global.TeamValue+'M',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 30,color: Colors.white));}),
                              )
                            ],),
                          SizedBox(height: 25,),
                        ],
                      ),
                    ),
                    ///Transfer Puan
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0,bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/reklamgecis');
                        },
                        child: Container(width: genislik*.80,height: 50,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                          children: [
                            Expanded(flex: 3,child: AutoSizeText('Transfer Puan',minFontSize: 20,maxLines: 1,textAlign: TextAlign.center,style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 30),)),
                            Container(width: 2,height: 45,color: Colors.black,),
                            Expanded(flex: 1,child: FutureBuilder(
                                future: getPoints(global.userid),
                                builder: (BuildContext context,AsyncSnapshot snapshot){
                                return AutoSizeText(global.transferpoint==null?'0':global.transferpoint,
                                    maxLines: 1,minFontSize: 25,textAlign: TextAlign.center,style: TextStyle(fontFamily: 'BebasNeue',
                                        fontWeight: FontWeight.bold,fontSize: 30));}
                            )),
                            Expanded(flex: 2,child: Container(alignment: Alignment.center,decoration: BoxDecoration(color: Colors.black,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))),
                              child: Text('TOPLA',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 30,color: Colors.white),),
                            )
                            )
                          ],
                        ),),
                      ),
                    )
                  ],
                ),
              ); }
            ),
          ),
        ),
    ):BannerPage();

  }

}
class MyCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double genislik=size.width;
    double uzunluk=size.height;
    double offset=10.0;
    Path path=Path();
    path.lineTo(offset, uzunluk);
    path.lineTo(genislik-offset, uzunluk);
    path.lineTo(genislik, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper  ) {
    return true;
    // TODO: implement shouldReclip
   // throw UnimplementedError();
  }

}

class MyCustomClipper2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double genislik=size.width;
    double uzunluk=size.height;
    double offset=30.0;
    Path path=Path();

    path.lineTo(offset, uzunluk);

    path.lineTo(genislik-offset, uzunluk);

    path.lineTo(genislik, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper  ) {
    return true;
    // TODO: implement shouldReclip
    // throw UnimplementedError();
  }
}
class menuButton extends StatelessWidget{
  final double genislik;
  final double genislik2;
  final double height;
  final double height2;
  final Color renk;
  final Color renk2;
  final String text;
  final Color textcolor;
  menuButton({this.genislik,this.genislik2,this.height,this.height2,this.renk,this.renk2,this.text,this.textcolor});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 8),
      child: ClipPath(
        clipper: MyCustomClipper(),
        child: Container(alignment: Alignment.center,
          width: genislik2,height: height2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.grey.shade500,
                  Colors.grey.shade700,
                  Colors.grey.shade400
                ],begin: Alignment.centerLeft,end: Alignment.centerRight,
                stops: [
                  0.2,0.27,0.7
                ]
            ),
            //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45))
          ),
          child: ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              alignment: Alignment.center,
              width: genislik,height: height,
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      //Colors.black,
                      //Colors.grey.shade800
                      renk,
                      renk2
                    ],begin: Alignment.bottomCenter,end: Alignment.topCenter
                ),
                //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45))
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 35,
                  color: textcolor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
