import 'dart:async';



import 'package:fantasysuperlig/Screens/GecisEkrani/splashScreenPage3.dart';
import 'package:fantasysuperlig/Screens/Logins/welcome.dart';
import 'package:fantasysuperlig/Screens/MenuPage.dart';
import 'package:fantasysuperlig/Services/api_service.dart';

import '../../Variables/global.dart' as global;
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';



class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}


class _SplashScreen2State extends State<SplashScreen2> {
  Giris giris=Giris();

  void waitLogin() async{
    await giris.getId().whenComplete(() {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen3()));
    });

  }
  @override
  void initState(){
   // getToken();
   // giris.getId();
   waitLogin();

    super.initState();
 /*   Timer(Duration(seconds: 2),(){

      Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));

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
}
