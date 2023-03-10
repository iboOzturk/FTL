//import 'dart:ffi';

import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Variables/global.dart' as global;

//String url='http://fantasy.bulutbyte.net/api/';


class StatisticsPage extends StatefulWidget {
  StatisticsPage({Key key,  this.title}) : super(key: key);
  final String title;

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  bool _isAscending = true;
  bool _isFormAscending = true;
  static const int sortName = 0;
  int sortType = sortName;
  bool isAscending = true;
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  String position='10';
  String neresi;
  playergetir Oyuncugetir=playergetir();
  takimgetir TakimGetir=takimgetir();
  String takimadi='all';
  String pozisyon='10';
  String fiyat='0';
  int formicon=0;

  void waitLogin() async{
    if(Oyuncugetir.getPlayers(pozisyon,fiyat,takimadi)==[]||Oyuncugetir.getPlayers(pozisyon,fiyat,takimadi)==null){
      await getToken();
      _refreshData();
    }
  }

  @override
  void initState() {
    waitLogin();
    //TakimGetir.getTeams();
    //getPlayers(position);
    // Oyuncugetir.getPlayers(position);
    // Oyuncugetir.oyuncular.clear();
    // player.getPlayers(position, 10);
    super.initState();
  }
  Future<Null> _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    await Oyuncugetir.getPlayers(pozisyon,fiyat,takimadi);
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
  /*  var data=[];
    data=ModalRoute.of(context).settings.arguments;
    position=data[0];
    neresi=data[1]; */
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamed(context, '/menu');
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(title: Text('Oyuncu ??statistikleri'),backgroundColor: Color(0xFF3366FF),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,),onPressed:(){
          setState(() {
            global.selectIndex=2;
          });
          Navigator.pushNamed(context, '/menu');
        } ,),
        ),
        body: FutureBuilder(
          //0 ve all
            future: Oyuncugetir.getPlayers(pozisyon,fiyat,takimadi),
            builder: (BuildContext context,AsyncSnapshot snapshot){
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
                        child: Text('Y??kleniyor...',style: TextStyle(color: Colors.white,fontSize: 24),),
                      )
                    ],
                  )));
              }
              return RefreshIndicator(
                onRefresh: _refreshData,
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(flex: 1,child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return AlertDialog(backgroundColor: Color(0xFF3366FF),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(8.0))),
                                          content: Container(
                                              height: 250,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF3366FF),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[

                                                  GestureDetector(
                                                    onTap: () async{
                                                      Oyuncugetir.oyuncular.clear();

                                                      await setState(()  {
                                                       pozisyon='0';
                                                   //     global.selectIndex=1;
                                                      });
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
                                                        "Kaleci",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),
                                                  GestureDetector(
                                                    onTap: () async{
                                                      Oyuncugetir.oyuncular.clear();
                                                      await setState(() {
                                                        pozisyon='1';

                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFF00CCFF),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),width: 150,height: 30,
                                                      child: Text(
                                                        "Defans",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),

                                                  GestureDetector(
                                                    onTap: () async{
                                                      Oyuncugetir.oyuncular.clear();

                                                      await setState(()  {
                                                        pozisyon='2';
                                                        //     global.selectIndex=1;
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFF00CCFF),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),width: 150,height: 30,
                                                      child: Text(
                                                        "Orta Saha",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),

                                                  GestureDetector(
                                                    onTap: () async{
                                                      Oyuncugetir.oyuncular.clear();

                                                      await setState(()  {
                                                        pozisyon='3';
                                                        //     global.selectIndex=1;
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFF00CCFF),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),width: 150,height: 30,
                                                      child: Text(
                                                        "Forvet",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),
                                                  GestureDetector(
                                                    onTap: () async{
                                                      Oyuncugetir.oyuncular.clear();

                                                      await setState(()  {
                                                        pozisyon='10';
                                                        //     global.selectIndex=1;
                                                      });
                                                      Navigator.pop(context);

                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFF00CCFF),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),width: 150,height: 30,
                                                      child: Text(
                                                        "Hepsi",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ))); }
                                );
                              },
                              child: Container(width: 50,height: 60,color: Colors.white,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Pozisyon',style: TextStyle(color: Colors.deepPurple,fontSize: 15),),
                                        Text(pozisyon=='0'?'Kaleci':pozisyon=='1'?'Defans':pozisyon=='2'?'OrtaSaha':pozisyon=='3'?'Forvet':'Hepsi',style: TextStyle(color: Colors.black,fontSize: 15),),
                                      ],
                                    ),
                                  ),

                                  Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.keyboard_arrow_up_sharp,size: 15,),
                                      Icon(Icons.keyboard_arrow_down_sharp,size: 15,),
                                    ],
                                  )
                                ],
                              ),),
                            )),
                          //  VerticalDivider(width: 2,color: Colors.purple.shade700,thickness: 5,endIndent: 10,),
                            Container(height: 60,width: 2,color:Colors.purple.shade700),
                            Expanded(flex: 1,child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return AlertDialog(backgroundColor: Color(0xFF3366FF),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(8.0))),
                                          content: Container(
                                              height: 355,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF3366FF),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: () async{
                                                      Oyuncugetir.oyuncular.clear();

                                                      await setState(()  {
                                                        fiyat='0';

                                                        //     global.selectIndex=1;
                                                      });
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
                                                        "Hepsi",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),
                                                  GestureDetector(
                                                    onTap: () async{
                                                      Oyuncugetir.oyuncular.clear();

                                                      await setState(()  {
                                                        fiyat='1';

                                                        //     global.selectIndex=1;
                                                      });
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
                                                        "<5",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),
                                                  GestureDetector(
                                                    onTap: () async{
                                                      Oyuncugetir.oyuncular.clear();
                                                      await setState(() {
                                                        fiyat='2';


                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFF00CCFF),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),width: 150,height: 30,
                                                      child: Text(
                                                        "5-6",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),

                                                  GestureDetector(
                                                    onTap: () async{
                                                      Oyuncugetir.oyuncular.clear();

                                                      await setState(()  {
                                                        fiyat='3';

                                                        //     global.selectIndex=1;
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFF00CCFF),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),width: 150,height: 30,
                                                      child: Text(
                                                        "6-7",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),

                                                  GestureDetector(
                                                    onTap: () async{
                                                      Oyuncugetir.oyuncular.clear();

                                                      await setState(()  {
                                                        fiyat='4';

                                                        //     global.selectIndex=1;
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFF00CCFF),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),width: 150,height: 30,
                                                      child: Text(
                                                        "7-8",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),
                                                  GestureDetector(
                                                    onTap: () async{
                                                      Oyuncugetir.oyuncular.clear();

                                                      await setState(()  {
                                                        fiyat='5';

                                                        //     global.selectIndex=1;
                                                      });
                                                      Navigator.pop(context);

                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFF00CCFF),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),width: 150,height: 30,
                                                      child: Text(
                                                        "8-9",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),
                                                  GestureDetector(
                                                    onTap: () async{
                                                      Oyuncugetir.oyuncular.clear();

                                                      await setState(()  {
                                                        fiyat='6';

                                                        //     global.selectIndex=1;
                                                      });
                                                      Navigator.pop(context);

                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFF00CCFF),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),width: 150,height: 30,
                                                      child: Text(
                                                        "9-10",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),
                                                  GestureDetector(
                                                    onTap: () async{
                                                      Oyuncugetir.oyuncular.clear();

                                                      await setState(()  {
                                                          fiyat='7';
                                                        //     global.selectIndex=1;
                                                      });
                                                      Navigator.pop(context);

                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFF00CCFF),
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),width: 150,height: 30,
                                                      child: Text(
                                                        "10>",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ))); }
                                );
                              },
                              child: Container(width: 50,height: 60,color: Colors.white,
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('Fiyat',style: TextStyle(color: Colors.deepPurple,fontSize: 15),),
                                Text(fiyat=='1'?'<5 M ???':fiyat=='2'?'5-6 M ???':fiyat=='3'?'6-7 M ???':fiyat=='4'?'7-8 M ???':fiyat=='5'?'8-9 M ???':fiyat=='6'?'9-10 M ???':fiyat=='7'?'10> M ???':'Hepsi',style: TextStyle(color: Colors.black,fontSize: 15),),

                                        ],
                                      ),
                                    ),

                                    Column(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.keyboard_arrow_up_sharp,size: 15,),
                                        Icon(Icons.keyboard_arrow_down_sharp,size: 15,),
                                        SizedBox(width: 5,)
                                      ],
                                    )
                                  ],
                                ),),
                            )),
                           // VerticalDivider(width: 2,color: Colors.purple.shade700,thickness: 5,endIndent: 10,),
                            Container(height: 60,width: 2,color:Colors.purple.shade700),

                            Expanded(flex: 2,child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return AlertDialog(backgroundColor: Color(0xFF3366FF),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(16.0))),
                                          content: Container(
                                            height: 279,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 250,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF3366FF)
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='all';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),
                                                            width: 150,height: 30,
                                                            child: Text(
                                                              "Hepsi",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: () async{
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='ADS';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "ADS",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: () async{
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='ALT';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "ALT",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: () async{
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='ALY';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "ALY",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: () async{
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='ANT';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "ANT",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: () async{
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='BFK';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "BFK",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),

                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='BJK';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "BJK",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),

                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='??RS';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "??RS",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='FB';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "FB",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='FKG';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "FKG",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='GFK';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "GFK",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='G??Z';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "G??Z",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='GRS';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "GRS",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='GS';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "GS",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),

                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='HAT';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "HAT",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='KAS';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "KAS",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='KON';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "KON",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='KS';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "KS",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='SS';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "SS",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='TS';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),width: 150,height: 30,
                                                            child: Text(
                                                              "TS",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        GestureDetector(
                                                          onTap: ()async {
                                                            Oyuncugetir.oyuncular.clear();

                                                            await setState(()  {
                                                              takimadi='YMS';
                                                              //     global.selectIndex=1;
                                                            });
                                                            Navigator.pop(context);
                                                          },
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xFF00CCFF),
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),
                                                            width: 150,height: 30,
                                                            child: Text(
                                                              "YMS",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,fontSize: 20),
                                                            ),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  )),
                                                Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,size: 29,)
                                              ],
                                            ),
                                          ),

                                      ); }
                                );
                              },
                              child: Container(width: 50,height: 60,color: Colors.white,
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('Tak??m',style: TextStyle(color: Colors.deepPurple,fontSize: 15),),
                                          Text(takimadi=='all'?'T??m Tak??mlar':takimadi,style: TextStyle(color: Colors.black,),),
                                          SizedBox(width: 5,)
                                        ],
                                      ),
                                    ),

                                    Column(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.keyboard_arrow_up_sharp,size: 15,),
                                        Icon(Icons.keyboard_arrow_down_sharp,size: 15,),
                                        SizedBox(width: 10,)
                                      ],
                                    )
                                  ],
                                ),),
                            )),
                          ],
                        ),
                        Container(width: MediaQuery.of(context).size.width,height: 2,color:Colors.purple.shade700),
                        _getBodyWidget(),
                      ],
                    ),
                  ),
                ),
              ); }
        ),
      ),
    );
  }

  Widget _getBodyWidget() {
    return Container(

      child: HorizontalDataTable(
        leftHandSideColumnWidth: 200,
        rightHandSideColumnWidth: 500,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: Oyuncugetir.oyuncular.length,
        //itemCount: player.oyuncular.length,
        //itemCount: user.userInfo.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
        verticalScrollbarStyle: const ScrollbarStyle(
          thumbColor: Colors.yellow,
          isAlwaysShown: true,
          thickness: 4.0,
          radius: Radius.circular(5.0),
        ),
        horizontalScrollbarStyle: const ScrollbarStyle(
          thumbColor: Colors.red,
          isAlwaysShown: true,
          thickness: 4.0,
          radius: Radius.circular(5.0),
        ),

      ),
      height: MediaQuery.of(context).size.height-168,

    );
  }

  List<Widget> _getTitleWidget() {
    return [
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: _getTitleItemWidget(
            'Oyuncu Ad??',
            180),

      ),
      TextButton(
       /* onPressed: () {

          /*setState(() {
            formicon==0?formicon=1:formicon==1?formicon=0:null;
          }); */
        },*/
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: _getTitleItemWidget(
            'Form' ,   100),
     /*   child: Row(
          children: [
            formicon==0?Icon(Icons.arrow_drop_up):Icon(Icons.arrow_drop_down),
            _getTitleItemWidget(
                'Form' ,   75),
          ],
        ),*/

      ),
     // TextButton(child:
      _getTitleItemWidget('De??eri', 100,),
     // onPressed: () {
       // sortType = sortName;
       // isAscending = !isAscending;
       // sortList(isAscending);
       // setState(() {});
       // },),
      _getTitleItemWidget('Se??ilme oran??', 100),
      _getTitleItemWidget('Haftal??k Puan', 100),
      _getTitleItemWidget('Sezon Puan', 100),

    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return InkWell(
      onTap: (){
       Oyuncugetir.oyuncular[index].Injury==1?showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(backgroundColor: Colors.red.shade700,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(8.0))),
                  content: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.red.shade700,
                      ),
                      child: Text('${Oyuncugetir.oyuncular[index].PlayerName} ${Oyuncugetir.oyuncular[index].Description==null?'':Oyuncugetir.oyuncular[index].Description}'))); }
        ):ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 1),content: Text(Oyuncugetir.oyuncular[index].PlayerName)));
      },
      child: FutureBuilder(
          future: Oyuncugetir.getPlayers(pozisyon,'0',takimadi),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            return Container(
              //child: Text(user.userInfo[index].name),
              child: Row(
                children: [
                  Image.network(Oyuncugetir.oyuncular[index].Kits,width: 50,height: 45,),
                  Container(alignment:Alignment.center,child: Column(
                    children: [
                      Expanded(flex:2,
                        child: Container(width: 120,alignment: Alignment.centerLeft,
                          child: Text(Oyuncugetir.oyuncular[index].PlayerShortName
                              ,textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                      ),
                      Expanded(flex:1,
                        child: Container(width: 120,
                          child: Row(
                            children: [
                              Text(
                                Oyuncugetir.oyuncular[index].Position=='0'?'KL'+' - '+Oyuncugetir.oyuncular[index].TakimKisatlma:
                              Oyuncugetir.oyuncular[index].Position=='1'?'DEF'+' - '+Oyuncugetir.oyuncular[index].TakimKisatlma:
                              Oyuncugetir.oyuncular[index].Position=='2'?'ORT'+' - '+Oyuncugetir.oyuncular[index].TakimKisatlma:'F'
                                  +' - '+Oyuncugetir.oyuncular[index].TakimKisatlma
                                  ,textAlign: TextAlign.left,style: TextStyle(color: Colors.grey.shade700,fontSize: 14),
                              ),
                              Visibility(
                                  visible: Oyuncugetir.oyuncular[index].Injury==1?
                                  true:Oyuncugetir.oyuncular[index].Leave==1?
                                  true:false,child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context){
                                        return AlertDialog(backgroundColor: Colors.red.shade700,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(8.0))),
                                            content: Container(
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade700,
                                                ),
                                                child: Text('${Oyuncugetir.oyuncular[index].PlayerName} ${Oyuncugetir.oyuncular[index].Description==null?'':Oyuncugetir.oyuncular[index].Description}'))); }
                                  );
                                 // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(Oyuncugetir.oyuncular[index].PlayerName)));
                                },
                                    child: CircleAvatar(backgroundColor: Colors.red,maxRadius: 18,
                                    child: Text(Oyuncugetir.oyuncular[index].Injury==1?'!':Oyuncugetir.oyuncular[index].Leave==1?'X':''
                                    ,style: TextStyle(color: Colors.white),)
                              ),

                                  )
                              )

                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
              //child: Text(Oyuncugetir.oyuncular.elementAt(index).PlayerShortName),
              width: 100,
              height: 56,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ); }
      ),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return FutureBuilder(
        future: Oyuncugetir.getPlayers(pozisyon,'0',takimadi),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          return Row(
            children: <Widget>[
              Container(
                child: Text(Oyuncugetir.oyuncular[index].Form),
                //child: Text(player.oyuncular[index].Position),
                width: 100,
                height: 56,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(Oyuncugetir.oyuncular[index].Value1.toString()+'M ???'),
                //child: Text(player.oyuncular[index].Value+' M ???'),
                width: 100,
                height: 56,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(Oyuncugetir.oyuncular[index].ElectionRate.toString()=='null'?'%0':'%'+Oyuncugetir.oyuncular[index].ElectionRate.toString()),
                //child: Text(player.oyuncular[index].PlayerID.toString()),
                width: 100,
                height: 56,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(Oyuncugetir.oyuncular[index].WeekPoints.toString()),
                // child: Image.network(player.oyuncular[index].Kits),
                // child: Text(player.oyuncular[index].PlayerShortName),
                width: 100,
                height: 56,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(Oyuncugetir.oyuncular[index].SeasonPoints.toString()),
                // child: Image.network(player.oyuncular[index].Kits),
                // child: Text(player.oyuncular[index].PlayerShortName),
                width: 100,
                height: 56,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
            ],
          ); }
    );
  }
  sortList(bool isAscending){
    setState(() {
      if(_isAscending==true){

        print('---------------------------------------------------------zaa');
        _isAscending = false;
        Oyuncugetir.oyuncular.sort((a,b)=>

            a.Value1.compareTo(b.Value1)

        );
      }
      else
      {
        Oyuncugetir.oyuncular.clear();

        _isAscending = true;
        Oyuncugetir.oyuncular.sort((a,b)=>
            b.Value1.compareTo(a.Value1)
        );
      }

    });
  }


}


