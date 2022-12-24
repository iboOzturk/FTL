import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:fantasysuperlig/Screens/GecisEkrani/splashScreenPage.dart';
import 'package:fantasysuperlig/Screens/Logins/welcome.dart';
import 'package:fantasysuperlig/Screens/MenuPage.dart';
import 'package:fantasysuperlig/Services/api_service.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads.dart';
import '../../Variables/global.dart' as global;
import 'splashScreenPage3.dart';

class GesisEkranPage extends StatefulWidget {
  @override
  _GesisEkranPageState createState() => _GesisEkranPageState();
}
bool checkNetwork;

class _GesisEkranPageState extends State<GesisEkranPage> {

  Giris giris=Giris();
  void waitLogin() async{
    print('1. gecis ekranı');
    await getToken().then((value) async{
      print('2. gecis ekranı');
      await giris.getId().then((value) async{
        print('3. gecis ekranı');
     //   await checkNetConnectivity();
        await getVersion();
        if(checkNetwork==true){
          await giris.LoginService2('bos', 'bos', global.androidId).then((value) {
         global.userid==0? Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage())):
         Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));
          });
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));

        }
      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen3()));
      });
     // Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen2()));
    });

  }
  void waitLogin2() async{
    print('1. gecis ekranı');
    await getToken().then((value) async{
      print('2. gecis ekranı');
      await giris.getId();
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen2()));
    });

  }

  @override
  void initState() {
    waitLogin2();
   // getToken();
   // giris.getId();
   // giris.LoginService2('bos', 'bos', global.androidId);
    Timer(Duration(seconds: 6),(){

      Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen3()));

      //Navigator.push(context, MaterialPageRoute(builder: (context)=>DenemeHomePage2()));
    });
   // UnityAds.init(gameId: '4376159');
    // getToken();
    //giris.getId();

    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container (width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Image.asset('assets/images/intro.gif',fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,),
        ),
      ),
    );
  }
  checkNetConnectivity() async{
    var result=await Connectivity().checkConnectivity();
    if(result==ConnectivityResult.none){
      checkNetwork=false;
      _showDialog('Bağlantı Hatası', 'Lütfen internet bağlantınızı kontrol ediniz');
    }
    else if(result==ConnectivityResult.wifi){
      checkNetwork=true;
      _showDialog('wifi', 'wifi bağlı');
    }
    else if(result==ConnectivityResult.mobile){
      checkNetwork=true;

      _showDialog('mobil veri', 'mobil veri bağlı');
    }
  }
  _showDialog(title,text){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(content: Text(text),title: Text(title),);
    });
  }
}
