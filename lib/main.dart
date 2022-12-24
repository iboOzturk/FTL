import 'dart:io';

import '/Screens/GecisEkrani/gecisekranpage.dart';
import '/Screens/GecisEkrani/splashScreenPage.dart';
import '/Screens/Logins/ftlsadakat.dart';
import '/Screens/Logins/kvkkpage.dart';
import '/Screens/Logins/welcome.dart';
import '/Screens/MenuPage.dart';
import '/Screens/Partnerler/partnerlerpage.dart';
import '/Screens/Puanim/mypointpage.dart';
import '/Screens/deneme.dart';
import '/Screens/deneme2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'Screens/DuranTop/durantoppage.dart';
import 'Screens/Fikstur/fixturepage.dart';
import 'Screens/Istatistik/statistics.dart';
import 'Screens/Kurallar/rulespage.dart';
import 'Screens/Leagues/aylikligpage.dart';
import 'Screens/Leagues/liglerpage.dart';
import 'Screens/Leagues/ozellig1page.dart';
import 'Screens/Leagues/ozellig2page.dart';
import 'Screens/Leagues/yillikligpage.dart';
import 'Screens/News/haberlerpage.dart';
import 'Screens/Oduller/odullerpage.dart';
import 'Screens/PuanDukkan/splashAd.dart';
import 'Screens/SSS/ssspage.dart';
import 'Screens/TakimKur/firscreateteamlist.dart';
import 'Screens/Takimim/sizedboxdeneme.dart';
import 'package:fantasysuperlig/Screens/substitute.dart';
import 'Screens/PuanDukkan/transferpuandukkan.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '/Screens/Logins/login.dart';
import '/Screens/Logins/register.dart';
import 'Screens/TakimKur/create_team.dart';
import 'Screens/TransferEt/playertransferpage.dart';
import 'Screens/TransferEt/transferlist.dart';
import 'package:flutter/material.dart';
import 'Screens/Logins/register2.dart';

Future<void> backgroundHandler(RemoteMessage message)async{
  print(message.data.toString());
  print(message.notification.title);
}
void main() async{

  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context,widget)=>ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context,widget),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450,name: MOBILE),
          ResponsiveBreakpoint.resize(800,name: TABLET),
          ResponsiveBreakpoint.resize(1200,name: TABLET),
          ResponsiveBreakpoint.resize(1200,name: DESKTOP),
          ResponsiveBreakpoint.resize(2460,name: "4K"),
        ],

      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lexend',
        primarySwatch: Colors.blue,
        unselectedWidgetColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context)=>PartnerlerPage(),
        '/login': (context)=>LoginPage(),
        '/register': (context)=>RegisterPage(),
        '/kvkk': (context)=>KVKKPage(),
        '/ftlsadakat': (context)=>FTLSadakatPage(),
        '/register2': (context)=>RegisterPage2(),
      //  '/kaleci': (context)=>KaleciPage(),
        '/tpd': (context)=>TransferPuanDukkanPage(),
        '/substitute': (context)=>SubstitutePage(),
        '/register': (context)=>RegisterPage(),
        '/myteam': (context)=>MyTeamPage(),
        '/myteam2': (context)=>FirstMyTeamPage(),
        '/createteam': (context)=>CreateTeamPage(),
        '/menu': (context)=>MenuPage(),
        '/deneme': (context)=>DenemePage(),
        '/deneme2': (context)=>DenemePage2(),
        '/puanim':(context)=>MyPointPage(),
        '/olustur':(context)=>CreateTeamPage(),
        '/takimim':(context)=>SizedBoxDeneme(),
        '/transfer':(context)=>PlayerTransferPage(),
        '/haber':(context)=>HaberPage(),
        '/fikstur':(context)=>FixturePage(),
        '/istatistik':(context)=>StatisticsPage(),
        '/durantop':(context)=>DuranTopPage(),
        '/odul':(context)=>OdulPage(),
        '/sss':(context)=>SSSPage(),
        '/kurallar':(context)=>RulesPage(),
        '/reklamgecis':(context)=>SplashAdScreen(),
        '/hlig':(context)=>LeaguePage(),
        '/alig':(context)=>AylikLeaguePage(),
        '/ylig':(context)=>YillikLeaguePage(),
        '/ol1lig':(context)=>Ozel1LeaguePage(),
        '/ol2lig':(context)=>Ozel2LeaguePage(),

      },
    );
  }
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

