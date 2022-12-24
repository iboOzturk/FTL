import 'package:fantasysuperlig/Screens/Menu/fantezimenupage.dart';
import 'package:fantasysuperlig/Screens/PuanSiralama/ranktablepage.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'Magaza/magazapage.dart';
import 'package:fantasysuperlig/Screens/SettingPage.dart';
import 'TakimKur/create_team.dart';
import 'package:fantasysuperlig/Screens/datatabledeneme.dart';
import 'package:fantasysuperlig/Screens/deneme2.dart';
import 'News/haberlerpage.dart';
import 'TransferEt/transferlist.dart';
import 'Istatistik/statistics.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../Utils/utils.dart';
import '../Services/api_service.dart';
import '../Variables/global.dart' as global;
import '../Screens/fantezimenu.dart';
import 'bannerpage.dart';
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex=0;
  Giris _giris=Giris();
  Future<void> loginnes() async{
    await getTakimim(global.userid);

  }

  @override
  void initState() {

   // _giris.CreateTeam(global.userid);

    loginnes();
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then((mesaj) {
      if(mesaj!=null){
        final routeFromMesaj=mesaj.data["route"];
        print(routeFromMesaj);
      }
    });

    FirebaseMessaging.onMessage.listen((mesaj) {
      if(mesaj.notification!=null){
        print(mesaj.notification.body);
        print(mesaj.notification.title);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((mesaj) {
      final routeFromMesaj=mesaj.data["route"];
      Navigator.pushNamed(context, '$routeFromMesaj');
      print(routeFromMesaj);
    });
  }
  List<Widget> _widgetOptions=<Widget>[
    //HaberPage(),
    RankTablePage(),
   /* Center(child: Container(alignment: Alignment.center,
        color: Color.fromARGB(255, 55, 0, 60 ),
        child: Text('Haberler',style: BuyukBeyazBaslik,))), */
    MagazaPage(),
  /*  Center(child: Container(alignment: Alignment.center,
        //color: Color.fromARGB(255, 55, 0, 60 ),
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
        child: Text('Mağaza',style: BuyukBeyazBaslik,))), */
    //StatisticsPage(),
    ///Fantezi Menu
  // FanteziPage(),
   FanteziMenuPage(),


    //DenemePage2(),
   // DataDableDeneme(),
    //MyTeamPage(),

  /*  Center(child: Container(alignment: Alignment.center,
        color: Color.fromARGB(255, 55, 0, 60 ),
        child: Text('İstatistikler',style: BuyukBeyazBaslik,))), */

    SettingsPage(),
 /*   Center(child: Container(alignment: Alignment.center,
        color: Color.fromARGB(255, 55, 0, 60 ),
        child: Text('Ayarlar',style: BuyukBeyazBaslik,))), */

  ];
  void _onItemTap(int index){
    setState(() {
     // _selectedIndex=index;
      global.selectIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        //appBar: AppBar(centerTitle: true,title: Text('Hafta 42'),),
       // body:  _widgetOptions.elementAt(_selectedIndex),
        body:  _widgetOptions.elementAt(global.selectIndex),
//BottomNavigationBar
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
               // icon: FaIcon(LineIcons.newspaper),
                icon: Icon(Icons.list_alt),
                title: Text('Puan Durumu'),
              backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart,),
                title: Text('Mağaza'),
                backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.tshirt ),
                title: Text('  Fantezi'),
                //backgroundColor: Color.fromARGB(255, 35, 0, 36)
                //backgroundColor: Color(0xff131862)
                backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_vert),
                title: Text('Diğer'),
                backgroundColor: Colors.black

            ),
          ],
          //currentIndex: _selectedIndex,
          currentIndex: global.selectIndex,
          onTap: _onItemTap,
        ),
      ),
    );
  }
}
