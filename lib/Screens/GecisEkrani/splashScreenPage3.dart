import 'dart:async';



import 'package:connectivity/connectivity.dart';
import 'package:fantasysuperlig/Screens/GecisEkrani/splashScreenPage2.dart';
import 'package:fantasysuperlig/Screens/Logins/welcome.dart';
import 'package:fantasysuperlig/Screens/MenuPage.dart';
import 'package:fantasysuperlig/Services/api_service.dart';

import '../../Variables/global.dart' as global;
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';



class SplashScreen3 extends StatefulWidget {
  @override
  _SplashScreen3State createState() => _SplashScreen3State();
}

bool checkNetwork;

class _SplashScreen3State extends State<SplashScreen3> {
  Giris giris=Giris();
  void waitLogin() async{
    await checkNetConnectivity();
    await getVersion();
    if(checkNetwork==true){
      await giris.LoginService2('bos', 'bos', global.androidId).whenComplete(() {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
      });
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));

    }


  }
  @override
  void initState(){
    //getToken();
    // giris.getId();
   //   giris.LoginService2('bos', 'bos', global.androidId);
waitLogin();
    super.initState();
    /*Timer(Duration(seconds: 2),(){

      Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));

      //Navigator.push(context, MaterialPageRoute(builder: (context)=>DenemeHomePage2()));
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Center(
          child: Image.asset('assets/images/FTLNewLogoBeyaz.png',height: 350,width: 350,),
        ),
      ),
    );
  }
  checkNetConnectivity() async{
    var result=await Connectivity().checkConnectivity();
    if(result==ConnectivityResult.none){
      checkNetwork=false;
      global.checkNetwork=false;
    //  _showDialog('net yok ', 'internetiniz yok');
    }
    else if(result==ConnectivityResult.wifi){
      global.checkNetwork=true;
      checkNetwork=true;
      //_showDialog('wifi', 'wifi bağlı');
    }
    else if(result==ConnectivityResult.mobile){
      checkNetwork=true;
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
