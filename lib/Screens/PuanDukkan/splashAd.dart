import 'dart:async';



import 'package:fantasysuperlig/Screens/GecisEkrani/splashScreenPage2.dart';
import 'package:fantasysuperlig/Screens/Logins/welcome.dart';
import 'package:fantasysuperlig/Screens/MenuPage.dart';
///Admob
//import 'package:fantasysuperlig/Services/admobservice.dart';
import 'package:fantasysuperlig/Services/api_service.dart';

import '../../Variables/global.dart' as global;
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';



class SplashAdScreen extends StatefulWidget {
  @override
  _SplashAdScreenState createState() => _SplashAdScreenState();
}


class _SplashAdScreenState extends State<SplashAdScreen> {
  Giris giris=Giris();
  ///Admob
  //AdmobHelper admobHelper=new AdmobHelper();

  @override
  void initState(){
   ///Admob
    // admobHelper.createRewardAd();

    // getToken();
    //giris.getId();

    //  giris.LoginService2('bos', 'bos', global.androidId);

    super.initState();
    Timer(Duration(seconds: 1),(){

      Navigator.pushNamed(context, '/tpd');


      //Navigator.push(context, MaterialPageRoute(builder: (context)=>DenemeHomePage2()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/FTLNewLogoBeyaz.png',height: 350,width: 350,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
              child: Text('Yükleniyor...',style: TextStyle(color: Colors.white,fontSize: 24),),
            )
          ],
        ),

      ),
    );
  }
}
