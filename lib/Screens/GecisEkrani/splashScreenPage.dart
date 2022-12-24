import 'dart:async';
import 'package:fantasysuperlig/Screens/GecisEkrani/splashScreenPage2.dart';
import 'package:fantasysuperlig/Screens/Logins/welcome.dart';
import 'package:fantasysuperlig/Screens/MenuPage.dart';
import 'package:fantasysuperlig/Services/api_service.dart';
import '../../Variables/global.dart' as global;
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:unity_ads_plugin/unity_ads.dart';
import 'netbaglantiyokpage.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

bool checkNetwork;
class _SplashScreenState extends State<SplashScreen> {
  Giris giris=Giris();
  void waitLogin() async{
    print('1. gecis ekranı');
      await getToken().whenComplete(() {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen2()));
      });

  }
  @override
  void initState(){
    UnityAds.init(gameId: '4376159');
   // getToken();
    //giris.getId();
    waitLogin();
  //  giris.LoginService2('bos', 'bos', global.androidId);

    super.initState();
   /* Timer(Duration(seconds: 1),(){

        Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen2()));

      //Navigator.push(context, MaterialPageRoute(builder: (context)=>DenemeHomePage2()));
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Image.asset('assets/images/FTLNewLogoBeyaz.png',height: 350,width: 350,),
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
