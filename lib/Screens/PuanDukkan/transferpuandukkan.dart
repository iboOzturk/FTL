import 'dart:async';

//import 'package:fantasysuperlig/Services/admobservice.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads.dart';
import '../../Variables/global.dart' as global;
import 'package:google_mobile_ads/google_mobile_ads.dart';
class TransferPuanDukkanPage extends StatefulWidget {
  @override
  _TransferPuanDukkanPageState createState() => _TransferPuanDukkanPageState();
}


class _TransferPuanDukkanPageState extends State<TransferPuanDukkanPage> {
  void izledi(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Color(0xff131862),content: Text('1 Transfer Puanı kazandınız.',style: TextStyle(fontSize: 24,color: Color.fromARGB(227, 7, 249, 136 )),)));
  }
  int sayi;
  int hak;
  Timer _timer;
  Timer _timer2;
  Timer _timer3;
  Timer _timer4;
  ///Admob
  // AdmobHelper admobHelper=new AdmobHelper();
 // void loadAdVideo()async{await admobHelper.createRewardAd();}
  void puangetir()async{
    await getPoints(global.userid);
  }
  @override
  void initState() {
    UnityAds.init(gameId: '4376159');
    sayi=0;
     hak=0;
    getBannerAds();

    if(global.kalansure1==0){
      setState(() {
        hak=hak+1;
      });
    }
    if(global.kalansure2==0){
      setState(() {
        hak=hak+1;
      });
    }
    if(global.kalansure3==0){
      setState(() {
        hak=hak+1;
      });
    }
    // TODO: implement initState
    ///Admob
    // loadAdVideo();
    puangetir();

    ///Admob
    // AdmobHelper.getBannerAd()..load();
    // admobHelper.createRewardAd();
      super.initState();
    /*  if(global.reklamhakki>0){
        izledi();
      } */
  //  _refreshData2();
     _timer= Timer.periodic(Duration(seconds: 1), (timer) {
        if(global.goster>0)
          {
            _refreshData2();
          izledi();
          global.goster=0;
          }
      });
   _timer2= Timer.periodic(Duration(minutes:  1), (timer) {
     // Navigator.pushNamed(context, '/tpd');
      setState(() {
        global.kalansure1-1;
      });
    });
   _timer3= Timer.periodic(Duration(minutes:  1), (timer) {
      //Navigator.pushNamed(context, '/tpd');
      setState(() {
        global.kalansure2-1;
      });
    });
   _timer4= Timer.periodic(Duration(minutes:  1), (timer) {
     // Navigator.pushNamed(context, '/tpd');
      setState(() {
        global.kalansure3-1;
      });
    });
   /* Timer(Duration(seconds: 2),(){
      print('reklam bitti izledi');
      global.reklamhakki>0?izledi():null;



      //Navigator.push(context, MaterialPageRoute(builder: (context)=>DenemeHomePage2()));
    });*/
  }
  void loadVideoAd() async{
    UnityAds.isReady(placementId: 'Video_Ad_Android').then((value) {
      if(value==true){
        UnityAds.showVideoAd(placementId: 'Video_Ad_Android',listener: (state,args){
          if(state==UnityAdState.complete){
            updateReward();
            getRewards();
            izledi();
            print('Vidyo TAMAM');
          }else if(state==UnityAdState.skipped){
            print('videoyu geçti');
          }
        });
      }
      else {
        print('Ad is not Ready');
      }
    });
  }
  Future<Null> _refreshData2() async {
    await Future.delayed(Duration(milliseconds: 200));
    getRewards();
    setState(() {
    });
  }
  Future<Null> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));
    getPoints(global.userid);
    setState(() {
    });
  }
  @override
  void dispose() {
    _timer.cancel();
    _timer2.cancel();
    _timer3.cancel();
    _timer4.cancel();
    ///Admob
    //  AdmobHelper.getBannerAd().dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double uzunuluk=MediaQuery.of(context).size.height;
    double genislik=MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        _timer.cancel();
        _timer2.cancel();
        _timer3.cancel();
        _timer4.cancel();
        Navigator.pushNamed(context, '/menu');
      },
      child: RefreshIndicator(
        onRefresh: _refreshData,
        child: FutureBuilder(
          future: getPoints(global.userid),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Scaffold(backgroundColor: Colors.grey.shade300,
                body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: Colors.black,),
                    SizedBox(height: 25 ,),
                    Text('Yükleniyor...')
                  ],
                ),),
              );
            }
          return Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
              centerTitle: true,title: Text('Transfer Puan Mağazası'),
              //backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
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
              ),
              leading: IconButton(onPressed: (){
                _timer.cancel();
                _timer2.cancel();
                _timer3.cancel();
                _timer4.cancel();
                Navigator.pushNamed(context, '/menu');
              },icon: Icon(Icons.arrow_back_ios),),
            ),
            body: FutureBuilder(
              future: getRewards(),
              builder: (BuildContext context,AsyncSnapshot snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
              return SingleChildScrollView(
                child: Container(
                  width: genislik,height: uzunuluk,
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      FutureBuilder(
                        future: getPoints(global.userid),
                        builder: (BuildContext context,AsyncSnapshot snapshot){
                          if(snapshot.connectionState==ConnectionState.waiting){
                            return Container(alignment: Alignment.center,width: genislik-40,height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.green,borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: CircularProgressIndicator(color: Colors.white,),));
                          }
                       return Column(
                         children: [
                           Container(alignment: Alignment.center,width: genislik-40,height: 50,
                              decoration: BoxDecoration(
                                color: Colors.green,borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Transfer Puanınız:',style: TextStyle(color: Colors.white,fontSize: 16),),
                                Text('${global.transferpoint==null?'0'
                                  :global.transferpoint} Puan',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                              ],
                                ),),
                           SizedBox(height: 5,),
                           Visibility(
                             visible: global.Expense1<0?true:false,
                             child: Container(alignment: Alignment.center,width: genislik-40,height: 50,
                               decoration: BoxDecoration(
                                   color: Color(0xff131862),borderRadius: BorderRadius.circular(10)
                               ),
                               child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   Text('Harcanan Puanınız:',style: TextStyle(color: Colors.red,fontSize: 16),),
                                   Text('${global.Expense1==null?'0'
                                       :global.Expense1} Puan',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 16),),
                                 ],
                               ),),
                           ),
                         ],
                       );}
                      ),
                      SizedBox(height: 15,),
                   /*   Container(width: genislik-40,height: 60,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('4 Transfer Puanı ',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)),
                          Container(
                            alignment: Alignment.center,decoration: BoxDecoration(
                            color: Colors.grey.shade300,borderRadius: BorderRadius.circular(7)
                          ),
                            width: 65,height: 30,child: Text('4 TL',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                            )
                        ],
                      ),),
                      Divider(color: Colors.grey.shade800,height: 1.5,thickness: 2,indent: 20,endIndent: 20,),
                      Container(width: genislik-40,height: 60,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('12 Transfer Puanı ',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)),
                          Container(
                            alignment: Alignment.center,decoration: BoxDecoration(
                              color: Colors.grey.shade300,borderRadius: BorderRadius.circular(7)
                          ),
                            width: 65,height: 30,child: Text('9 TL',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                            )
                        ],
                      ),),
                      Divider(color: Colors.grey.shade800,height: 1.5,thickness: 2,indent: 20,endIndent: 20,),

                      Container(width: genislik-40,height: 60,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('24 Transfer Puanı ',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)),
                          Container(
                            alignment: Alignment.center,decoration: BoxDecoration(
                              color: Colors.grey.shade300,borderRadius: BorderRadius.circular(7)
                          ),
                            width: 65,height: 30,child: Text('15 TL',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                            )
                        ],
                      ),),
                      Divider(color: Colors.grey.shade800,height: 1.5,thickness: 2,indent: 20,endIndent: 20,),

                      Container(width: genislik-40,height: 60,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('60 Transfer Puanı ',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)),
                          Container(
                            alignment: Alignment.center,decoration: BoxDecoration(
                              color: Colors.grey.shade300,borderRadius: BorderRadius.circular(7)
                          ),
                            width: 65,height: 30,child: Text('30 TL',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                           )
                        ],
                      ),),
                      Divider(color: Colors.grey.shade800,height: 1.5,thickness: 2,indent: 20,endIndent: 20,),

                      Container(width: genislik-40,height: 60,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('150 Transfer Puanı ',style: TextStyle(color: Colors.grey.shade600,fontSize: 16)),
                          Container(
                            alignment: Alignment.center,decoration: BoxDecoration(
                              color: Colors.grey.shade300,borderRadius: BorderRadius.circular(7)
                          ),
                            width: 65,height: 30,child: Text('60 TL',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                            )
                        ],
                      ),),
                      Divider(color: Colors.grey.shade800,height: 1.5,thickness: 2,indent: 20,endIndent: 20,), */
                      SizedBox(height: 50,),
                      Container(alignment: Alignment.center,width: genislik-40,height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,borderRadius: BorderRadius.circular(10)
                      ),
                        child: Text('Ücretsiz Transfer Puan',style: TextStyle(color: Colors.white,fontSize: 17),),),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 16),
                        child: Text('Reklam izleyerek her yarım saatte, 3 transfer puan kazanabilirsiniz',textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16,color: Colors.grey.shade700),
                        ),
                      ),
                /*      Container(width: genislik-40,height: 80,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1 izleme hakkı için kalan süre ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          Container(
                            alignment: Alignment.center,decoration: BoxDecoration(
                            color: Colors.grey.shade300,borderRadius: BorderRadius.circular(7)
                          ),
                            width: 70,height: 30,child: Text('1:59:59',style: TextStyle(color: Colors.red.shade600,fontWeight: FontWeight.bold,fontSize: 16),),
                            )
                        ],
                      ),), */
                     // Container(child:global.reklamhakki>0?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('izledi'))):Text('')),
                     // Text(global.reklamhakki>0?'Teklam izlendi':''),

                      InkWell(
                        onTap: () async{
                          global.adsRewardState==0||sayi==5?
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Şuanda reklam izleyemezsiniz:')))
                              :global.reklamhakki==0? ScaffoldMessenger.of(context).showSnackBar(SnackBar(padding: EdgeInsets.only(bottom: 15),content: Text('Şuanda reklam izleyemezsiniz:')))
                              :loadVideoAd();
                          ///Admob
                          /* setState(() {
                            sayi=sayi+1;
                          });
                          global.adsRewardState==0||sayi==5?
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Şuanda reklam izleyemezsiniz:')))
                              :global.reklamhakki==0? ScaffoldMessenger.of(context).showSnackBar(SnackBar(padding: EdgeInsets.only(bottom: 15),content: Text('Şuanda reklam izleyemezsiniz:')))
                              :await admobHelper.showRewardAd(); */
                        },
                        child: Container(
                          decoration: BoxDecoration(

                          ),
                          width: MediaQuery.of(context).size.width*.675,
                          child: Wrap(
                           children: [
                             Row(mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 InkWell(
                                 /*  onTap: () async{
                                     global.adsRewardState==0||sayi==5?
                                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Şuanda reklam izleyemezsiniz:')))
                                         :global.reklamhakki==0? ScaffoldMessenger.of(context).showSnackBar(SnackBar(padding: EdgeInsets.only(bottom: 15),content: Text('Şuanda reklam izleyemezsiniz:')))
                                         :await admobHelper.showRewardAd();
                                   },*/
                                   child: Container(
                                     alignment: Alignment.center,
                                     width: 100,height: 70,
                                     decoration: BoxDecoration(
                                       color: Colors.green,
                                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topLeft:  Radius.circular(25))
                                     ),
                                     child: Text(global.kalansure1==0?'İZLE':'${global.kalansure1} dk',style: TextStyle(color: Colors.white,fontSize: 24)),

                                   ),
                                 ),
                                 VerticalDivider(color: Colors.grey.shade900,width: 1,thickness: 2,),
                                 InkWell(
                /*  onTap: () async{
                                      global.adsRewardState==0||sayi==5?
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Şuanda reklam izleyemezsiniz:')))
                                         :global.reklamhakki==0? ScaffoldMessenger.of(context).showSnackBar(SnackBar(padding: EdgeInsets.only(bottom: 15),content: Text('Şuanda reklam izleyemezsiniz:')))
                                          :await admobHelper.showRewardAd();
                                   },*/
                                   child: Container(
                                     alignment: Alignment.center,
                                     width:100,height: 70,
                                       color: Colors.green,

                                     child: Text(global.kalansure2==0?'İZLE':'${global.kalansure2} dk',style: TextStyle(color: Colors.white,fontSize: 24)),

                                   ),
                                 ),
                                 VerticalDivider(color: Colors.grey.shade900,width: 1,thickness: 2,),
                                 InkWell(

                /*  onTap: () async{
                                    setState(() {
                                       sayi=sayi+1;
                                     });
                                     global.adsRewardState==0||sayi==5?
                                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Şuanda reklam izleyemezsiniz:')))
                                         :global.reklamhakki==0? ScaffoldMessenger.of(context).showSnackBar(SnackBar(padding: EdgeInsets.only(bottom: 15),content: Text('Şuanda reklam izleyemezsiniz:')))
                                         :await admobHelper.showRewardAd();
                                   },*/
                                   child: Container(
                                     alignment: Alignment.center,
                                     width: 100,height: 70,
                                     decoration: BoxDecoration(
                                         color: Colors.green,
                                         borderRadius: BorderRadius.only(bottomRight:  Radius.circular(25),topRight:  Radius.circular(25))
                                     ),

                                     //color: Color(0xff131862),
                                     child: Text(global.kalansure3==0?'İZLE':'${global.kalansure3} dk',style: TextStyle(color: Colors.white,fontSize: 24)),

                                   ),
                                 ),
                               ],
                             ),
                           ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      global.adsBannerState==0?Text(''):
                      Visibility(
                          visible: global.bannerReaklamHakki==1?true:false,
                          child:Container(alignment: Alignment.center,child: UnityBannerAd(placementId: 'Android_Ad_Banner',)))
                      ///Admob
                      /*   global.adsBannerState==0?Text(''): Visibility(
                        visible: global.bannerReaklamHakki==1?true:false,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0,bottom: 20),
                          child: Container(
                            height: 50,
                            child: AdWidget(
                              ad:AdmobHelper.getBannerAd()..load(),
                              key: UniqueKey(),
                            ),
                          ),
                        ),
                      ),*/


                   /*  global.reklamhakki<0?Visibility(child: Text(''),visible: true,): Visibility(visible: global.goster==0?false:true,
                          child: Expanded(flex: 1,child: Container(height: 30,child: SnackBar(content: Text('video izledin'))))), */
                     /* ElevatedButton(onPressed: () {
                      izledi();
                      }, child: Text('tıkla')) */
                    ],
                  ),
                ),
              ); }
            ),
          ); }
        ),
      ),
    );
  }

}
