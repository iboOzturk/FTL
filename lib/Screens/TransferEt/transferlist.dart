

import '../PuanDukkan/transferpuandukkan.dart';
import 'playertransferpage.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Variables/global.dart' as global;

//String url='http://fantasy.bulutbyte.net/api/';


class MyTeamPage extends StatefulWidget {
  MyTeamPage({Key key,  this.title}) : super(key: key);
  final String title;

  @override
  _MyTeamPageState createState() => _MyTeamPageState();
}

class _MyTeamPageState extends State<MyTeamPage> {

  String position;
  String neresi;
  int playerid;
  double deger;
  String takimadi='all';
  String pozisyon='10';
  String fiyat='0';

  playergetir Oyuncugetir=playergetir();

  String value;
  @override
  void initState() {
    //getPlayers(position);
   // Oyuncugetir.getPlayers(position);
   // Oyuncugetir.oyuncular.clear();
   // player.getPlayers(position, 10);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data=[];
    data=ModalRoute.of(context).settings.arguments;
    position=data[0];
    neresi=data[1];
    value=data[2];
    // value.replaceAll('M ₺', '')
    //deger=double.parse(value);
    if(value.length>2){
      deger=double.parse(value.replaceAll('M ₺', ''));

    }
    return WillPopScope(
      onWillPop: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
      },
      child: Scaffold(
        appBar: AppBar(centerTitle: true,
          title: Text(value.length>2?'Bütçe '+
              (deger+global.Butce).toString()+
              'M ₺':''),
         // backgroundColor: Color.fromARGB(255, 35, 0, 36),
          backgroundColor: Color(0xFF3366FF),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
          },),
        ),
        body: FutureBuilder(
          future: Oyuncugetir.getPlayers(position,fiyat,takimadi),
            builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.connectionState==ConnectionState.waiting)
            {return Center(child: CircularProgressIndicator());}
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(flex: 1,child: InkWell(
                          onTap: () {

                          },
                          child: Container(width: 50,height: 60,color: Colors.white,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Pozisyon',style: TextStyle(color: Colors.deepPurple,fontSize: 15),),
                                      Text(position=='0'?'Kaleci':position=='1'?'Defans':position=='2'?'OrtaSaha':'Forvet',style: TextStyle(color: Colors.black,fontSize: 15),),
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
                        ///Fiyat
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
                                                    "Sınırsız",
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
                                      Text(fiyat=='1'?'<5 M ₺':fiyat=='2'?'5-6 M ₺':fiyat=='3'?'6-7 M ₺':fiyat=='4'?'7-8 M ₺':fiyat=='5'?'8-9 M ₺':fiyat=='6'?'9-10 M ₺':fiyat=='7'?'10> M ₺':'Sınırsız',style: TextStyle(color: Colors.black,fontSize: 15),),

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

                        ///Takım
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
                                                          takimadi='ÇRS';
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
                                                          "ÇRS",
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
                                                          takimadi='GÖZ';
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
                                                          "GÖZ",
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
                                      Text('Takım',style: TextStyle(color: Colors.deepPurple,fontSize: 15),),
                                      Text(takimadi=='all'?'Tüm Takımlar':takimadi,style: TextStyle(color: Colors.black,fontSize: 15),),
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
            );; }
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
        child: _getTitleItemWidget('Oyuncu Adı', 300),
      ),
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: _getTitleItemWidget('Form' ,100),
      ),
      _getTitleItemWidget('Değeri', 100),
      _getTitleItemWidget('Seçilme oranı', 100),
      _getTitleItemWidget('Haftalık Puan', 100),
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
      onTap: ()async{
        if(global.FreeTransfer==0&&global.TransferPuan==0){
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(backgroundColor: Colors.red,
                    title: Text(
                      'Free transfer ve transfer puanınız bitti puanınızdan harcanacak emin misiniz?',
                      textAlign: TextAlign.center,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    content: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                playerid = Oyuncugetir.oyuncular[index].PlayerID;
                                debugPrint(
                                    'oyuncudeğiş ekranı hata mesajı: ' + global.hatamsj.toString());
                                return showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          title: Text(
                                            ///Buraya sakatlık ile ilgili bilgi verilecek mi diye sor!!!!
                                            '${Oyuncugetir.oyuncular[index].Description == null ? '' : Oyuncugetir.oyuncular[index].Description} ${Oyuncugetir.oyuncular[index].PlayerShortName} kadrona dahil etmek istiyor musun?',
                                            textAlign: TextAlign.center,
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                          content: Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[

                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      width: 100,
                                                      height: 35,
                                                      color: Colors.red,
                                                      child: Text(
                                                        "Vazgeç",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      await playerChange2(neresi, playerid);
                                                      if (global.hatamsj == 11) {
                                                        //  Navigator.pop(context);
                                                        //  Navigator.pop(context);
                                                        return showDialog(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return AlertDialog(
                                                                  backgroundColor:
                                                                  Colors.red.shade700,
                                                                  title: Text(
                                                                    "Seçilen oyuncuyu almak için bütçeniz yeterli değil",
                                                                    style: TextStyle(
                                                                        color: Colors.white),
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.all(
                                                                          Radius.circular(8.0))),
                                                                  content: Container(
                                                                      height: 30,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.red.shade700,
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.center,
                                                                        children: <Widget>[
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              Navigator.pop(context);
                                                                              Navigator.pop(context);
                                                                              //Navigator.pop(context);
                                                                            },
                                                                            child: Text(
                                                                              "Tamam",
                                                                              style: TextStyle(
                                                                                  color: Colors.white,
                                                                                  fontWeight:
                                                                                  FontWeight
                                                                                      .bold),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      )));
                                                            });
                                                      }
                                                      else if (global.hatamsj == 12) {
                                                        //  Navigator.pop(context);
                                                        //  Navigator.pop(context);
                                                        return showDialog(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return AlertDialog(
                                                                  backgroundColor:
                                                                  Colors.red.shade700,
                                                                  title: Text(
                                                                    "Bir Takımdan sadece 3 kişi seçebilirsin",
                                                                    style: TextStyle(
                                                                        color: Colors.white),
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.all(
                                                                          Radius.circular(8.0))),
                                                                  content: Container(
                                                                      height: 30,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.red.shade700,
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.center,
                                                                        children: <Widget>[
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              Navigator.pop(context);
                                                                              Navigator.pop(context);
                                                                              //Navigator.pop(context);
                                                                            },
                                                                            child: Text(
                                                                              "Tamam",
                                                                              style: TextStyle(
                                                                                  color: Colors.white,
                                                                                  fontWeight:
                                                                                  FontWeight
                                                                                      .bold),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      )));
                                                            });
                                                      }
                                                      else if (global.hatamsj == 13) {
                                                        //   Navigator.pop(context);
                                                        //   Navigator.pop(context);
                                                        return showDialog(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return AlertDialog(
                                                                  backgroundColor:
                                                                  Colors.red.shade700,
                                                                  title: Text(
                                                                    "Bu oyuncu zaten kadronda var",
                                                                    style: TextStyle(
                                                                        color: Colors.white),
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.all(
                                                                          Radius.circular(8.0))),
                                                                  content: Container(
                                                                      height: 30,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.red.shade700,
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.center,
                                                                        children: <Widget>[
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              Navigator.pop(context);
                                                                              Navigator.pop(context);
                                                                              //Navigator.pop(context);
                                                                            },
                                                                            child: Text(
                                                                              "Tamam",
                                                                              style: TextStyle(
                                                                                  color: Colors.white,
                                                                                  fontWeight:
                                                                                  FontWeight
                                                                                      .bold),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      )));
                                                            });
                                                      }
                                                      else if (global.FreeTransfer > 0) {
                                                        // Navigator.pop(context);
                                                        // Navigator.pop(context);
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    PlayerTransferPage()));

                                                        showDialog(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return AlertDialog(
                                                                  backgroundColor:
                                                                  Colors.blue.shade700,
                                                                  title: Text(
                                                                    "Free Transfer Kullandınız",
                                                                    style: TextStyle(
                                                                        color: Colors.white),
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.all(
                                                                          Radius.circular(8.0))),
                                                                  content: Container(
                                                                      height: 30,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.blue.shade700,
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.center,
                                                                        children: <Widget>[
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              // Navigator.pop(context);
                                                                              // Navigator.pop(context);

                                                                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child: Text(
                                                                              "Tamam",
                                                                              style: TextStyle(
                                                                                  color: Colors.white,
                                                                                  fontWeight:
                                                                                  FontWeight
                                                                                      .bold),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      )));
                                                            });
                                                      }
                                                      else if (global.TransferPuan > 0) {
                                                        //Navigator.pop(context);
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    PlayerTransferPage()));

                                                        //  Navigator.pop(context);
                                                        showDialog(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return AlertDialog(
                                                                  backgroundColor:
                                                                  Colors.blue.shade700,
                                                                  title: Text(
                                                                    "Transfer puanını Kullandınız",
                                                                    style: TextStyle(
                                                                        color: Colors.white),
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.all(
                                                                          Radius.circular(8.0))),
                                                                  content: Container(
                                                                      height: 30,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.blue.shade700,
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.center,
                                                                        children: <Widget>[
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              Navigator.push(
                                                                                  context,
                                                                                  MaterialPageRoute(
                                                                                      builder:
                                                                                          (context) =>
                                                                                          TransferPuanDukkanPage()));
                                                                              //Navigator.pop(context);
                                                                            },
                                                                            child: Container(
                                                                              alignment:
                                                                              Alignment.center,
                                                                              width: 190,
                                                                              height: 55,
                                                                              decoration: BoxDecoration(
                                                                                  color: Colors
                                                                                      .greenAccent,
                                                                                  borderRadius:
                                                                                  BorderRadius
                                                                                      .circular(
                                                                                      25)),
                                                                              child: Text(
                                                                                "Transfer Puanı Topla",
                                                                                style: TextStyle(
                                                                                    color:
                                                                                    Colors.white,
                                                                                    fontWeight:
                                                                                    FontWeight
                                                                                        .bold),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width: 10,
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>TransferPuanDukkanPage()));
                                                                              Navigator.pop(context);
                                                                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                                            },
                                                                            child: Container(
                                                                              alignment:
                                                                              Alignment.center,
                                                                              decoration: BoxDecoration(
                                                                                  color: Colors
                                                                                      .greenAccent,
                                                                                  borderRadius:
                                                                                  BorderRadius
                                                                                      .circular(
                                                                                      25)),
                                                                              width: 70,
                                                                              height: 55,
                                                                              child: Text(
                                                                                "Tamam",
                                                                                style: TextStyle(
                                                                                    color:
                                                                                    Colors.white,
                                                                                    fontWeight:
                                                                                    FontWeight
                                                                                        .bold),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      )));
                                                            });
                                                      }
                                                      else if (global.Expense < 0||global.FreeTransfer==0||global.TransferPuan==0) {
                                                        // Navigator.pop(context);
                                                        // Navigator.pop(context);
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    PlayerTransferPage()));

                                                        showDialog(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return AlertDialog(
                                                                  backgroundColor:
                                                                  Colors.red.shade700,
                                                                  title: Text(
                                                                    "Puanınızdan harcadınız!",
                                                                    style: TextStyle(
                                                                        color: Colors.white),
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.all(
                                                                          Radius.circular(8.0))),
                                                                  content: Container(
                                                                      height: 30,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.red.shade700,
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.center,
                                                                        children: <Widget>[
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              Navigator.push(
                                                                                  context,
                                                                                  MaterialPageRoute(
                                                                                      builder:
                                                                                          (context) =>
                                                                                          TransferPuanDukkanPage()));
                                                                              //Navigator.pop(context);
                                                                            },
                                                                            child: Container(
                                                                              alignment:
                                                                              Alignment.center,
                                                                              width: 190,
                                                                              height: 55,
                                                                              decoration: BoxDecoration(
                                                                                  color: Colors
                                                                                      .greenAccent,
                                                                                  borderRadius:
                                                                                  BorderRadius
                                                                                      .circular(
                                                                                      25)),
                                                                              child: Text(
                                                                                "Transfer Puanı Topla",
                                                                                style: TextStyle(
                                                                                    color:
                                                                                    Colors.white,
                                                                                    fontWeight:
                                                                                    FontWeight
                                                                                        .bold),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width: 10,
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>TransferPuanDukkanPage()));

                                                                              Navigator.pop(context);
                                                                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                                            },
                                                                            child: Container(
                                                                              alignment:
                                                                              Alignment.center,
                                                                              decoration: BoxDecoration(
                                                                                  color: Colors
                                                                                      .greenAccent,
                                                                                  borderRadius:
                                                                                  BorderRadius
                                                                                      .circular(
                                                                                      25)),
                                                                              width: 70,
                                                                              height: 55,
                                                                              child: Text(
                                                                                "Tamam",
                                                                                style: TextStyle(
                                                                                    color:
                                                                                    Colors.white,
                                                                                    fontWeight:
                                                                                    FontWeight
                                                                                        .bold),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      )));
                                                            });
                                                      } else {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    PlayerTransferPage()));
                                                        // Navigator.pushNamed(context, '/createteam');
                                                      }
                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      width: 100,
                                                      height: 35,
                                                      color: Colors.green,
                                                      child: Text(
                                                        "Tamam",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )));
                                    });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 35,
                                color: Colors.green,
                                child: Text(
                                  "Evet",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 35,
                                color: Colors.red.shade900,
                                child: Text(
                                  "Vazgeç",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )));
              });
          playerid = Oyuncugetir.oyuncular[index].PlayerID;
          debugPrint(
              'oyuncudeğiş ekranı hata mesajı: ' + global.hatamsj.toString());
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text(
                      ///Buraya sakatlık ile ilgili bilgi verilecek mi diye sor!!!!
                      '${Oyuncugetir.oyuncular[index].Description == null ? '' : Oyuncugetir.oyuncular[index].Description} ${Oyuncugetir.oyuncular[index].PlayerShortName} kadrona dahil etmek istiyor musun?',
                      textAlign: TextAlign.center,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    content: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                await playerChange2(neresi, playerid);
                                if (global.hatamsj == 11) {
                                  //  Navigator.pop(context);
                                  //  Navigator.pop(context);
                                  return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor:
                                                Colors.red.shade700,
                                            title: Text(
                                              "Seçilen oyuncuyu almak için bütçeniz yeterli değil",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                            content: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade700,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                        //Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Tamam",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                )));
                                      });
                                } else if (global.hatamsj == 12) {
                                  //  Navigator.pop(context);
                                  //  Navigator.pop(context);
                                  return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor:
                                                Colors.red.shade700,
                                            title: Text(
                                              "Bir Takımdan sadece 3 kişi seçebilirsin",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                            content: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade700,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                        //Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Tamam",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                )));
                                      });
                                } else if (global.hatamsj == 13) {
                                  //   Navigator.pop(context);
                                  //   Navigator.pop(context);
                                  return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor:
                                                Colors.red.shade700,
                                            title: Text(
                                              "Bu oyuncu zaten kadronda var",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                            content: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade700,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                        //Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Tamam",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                )));
                                      });
                                } else if (global.FreeTransfer > 0) {
                                  // Navigator.pop(context);
                                  // Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PlayerTransferPage()));

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor:
                                                Colors.blue.shade700,
                                            title: Text(
                                              "Free Transfer Kullandınız",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                            content: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue.shade700,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        // Navigator.pop(context);
                                                        // Navigator.pop(context);

                                                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Tamam",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                )));
                                      });
                                } else if (global.TransferPuan > 0) {
                                  //Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PlayerTransferPage()));

                                  //  Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor:
                                                Colors.blue.shade700,
                                            title: Text(
                                              "Transfer puanını Kullandınız",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                            content: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue.shade700,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        TransferPuanDukkanPage()));
                                                        //Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 190,
                                                        height: 55,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .greenAccent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                        child: Text(
                                                          "Transfer Puanı Topla",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>TransferPuanDukkanPage()));
                                                        Navigator.pop(context);
                                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .greenAccent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                        width: 70,
                                                        height: 55,
                                                        child: Text(
                                                          "Tamam",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )));
                                      });
                                } else if (global.Expense < 0) {
                                  // Navigator.pop(context);
                                  // Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PlayerTransferPage()));

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor:
                                                Colors.red.shade700,
                                            title: Text(
                                              "Puanınızdan harcadınız!",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                            content: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade700,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        TransferPuanDukkanPage()));
                                                        //Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 190,
                                                        height: 55,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .greenAccent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                        child: Text(
                                                          "Transfer Puanı Topla",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>TransferPuanDukkanPage()));

                                                        Navigator.pop(context);
                                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .greenAccent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                        width: 70,
                                                        height: 55,
                                                        child: Text(
                                                          "Tamam",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )));
                                      });
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PlayerTransferPage()));
                                  // Navigator.pushNamed(context, '/createteam');
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 35,
                                color: Colors.green,
                                child: Text(
                                  "Tamam",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 35,
                                color: Colors.red,
                                child: Text(
                                  "Vazgeç",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )));
              });
        }
        else{
          playerid = Oyuncugetir.oyuncular[index].PlayerID;
          debugPrint(
              'oyuncudeğiş ekranı hata mesajı: ' + global.hatamsj.toString());
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text(
                      ///Buraya sakatlık ile ilgili bilgi verilecek mi diye sor!!!!
                      '${Oyuncugetir.oyuncular[index].Description == null ? '' : Oyuncugetir.oyuncular[index].Description} ${Oyuncugetir.oyuncular[index].PlayerShortName} kadrona dahil etmek istiyor musun?',
                      textAlign: TextAlign.center,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    content: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 35,
                                color: Colors.red,
                                child: Text(
                                  "Vazgeç",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await playerChange2(neresi, playerid);
                                if (global.hatamsj == 11) {
                                  //  Navigator.pop(context);
                                  //  Navigator.pop(context);
                                  return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor:
                                            Colors.red.shade700,
                                            title: Text(
                                              "Seçilen oyuncuyu almak için bütçeniz yeterli değil",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                            content: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade700,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                        //Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Tamam",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                      ),
                                                    ),
                                                  ],
                                                )));
                                      });
                                } else if (global.hatamsj == 12) {
                                  //  Navigator.pop(context);
                                  //  Navigator.pop(context);
                                  return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor:
                                            Colors.red.shade700,
                                            title: Text(
                                              "Bir Takımdan sadece 3 kişi seçebilirsin",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                            content: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade700,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                        //Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Tamam",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                      ),
                                                    ),
                                                  ],
                                                )));
                                      });
                                } else if (global.hatamsj == 13) {
                                  //   Navigator.pop(context);
                                  //   Navigator.pop(context);
                                  return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor:
                                            Colors.red.shade700,
                                            title: Text(
                                              "Bu oyuncu zaten kadronda var",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                            content: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade700,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                        //Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Tamam",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                      ),
                                                    ),
                                                  ],
                                                )));
                                      });
                                } else if (global.FreeTransfer > 0) {
                                  // Navigator.pop(context);
                                  // Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PlayerTransferPage()));

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor:
                                            Colors.blue.shade700,
                                            title: Text(
                                              "Free Transfer Kullandınız",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                            content: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue.shade700,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        // Navigator.pop(context);
                                                        // Navigator.pop(context);

                                                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Tamam",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                      ),
                                                    ),
                                                  ],
                                                )));
                                      });
                                } else if (global.TransferPuan > 0) {
                                  //Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PlayerTransferPage()));

                                  //  Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor:
                                            Colors.blue.shade700,
                                            title: Text(
                                              "Transfer puanını Kullandınız",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                            content: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue.shade700,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                    TransferPuanDukkanPage()));
                                                        //Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        alignment:
                                                        Alignment.center,
                                                        width: 190,
                                                        height: 55,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .greenAccent,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                25)),
                                                        child: Text(
                                                          "Transfer Puanı Topla",
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>TransferPuanDukkanPage()));
                                                        Navigator.pop(context);
                                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                      },
                                                      child: Container(
                                                        alignment:
                                                        Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .greenAccent,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                25)),
                                                        width: 70,
                                                        height: 55,
                                                        child: Text(
                                                          "Tamam",
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )));
                                      });
                                } else if (global.Expense < 0) {
                                  // Navigator.pop(context);
                                  // Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PlayerTransferPage()));

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor:
                                            Colors.red.shade700,
                                            title: Text(
                                              "Puanınızdan harcadınız!",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                            content: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade700,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                    TransferPuanDukkanPage()));
                                                        //Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        alignment:
                                                        Alignment.center,
                                                        width: 190,
                                                        height: 55,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .greenAccent,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                25)),
                                                        child: Text(
                                                          "Transfer Puanı Topla",
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>TransferPuanDukkanPage()));

                                                        Navigator.pop(context);
                                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                      },
                                                      child: Container(
                                                        alignment:
                                                        Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .greenAccent,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                25)),
                                                        width: 70,
                                                        height: 55,
                                                        child: Text(
                                                          "Tamam",
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )));
                                      });
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PlayerTransferPage()));
                                  // Navigator.pushNamed(context, '/createteam');
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 35,
                                color: Colors.green,
                                child: Text(
                                  "Tamam",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),

                          ],
                        )));
              });
        }
      },
      child: FutureBuilder(
        future: Oyuncugetir.getPlayers(position,'0',takimadi),
        builder: (BuildContext context,AsyncSnapshot snapshot){
        return Visibility(
          visible: global.kaleci0PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName
          ||global.kaleci1PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.defans0PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.defans1PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.defans2PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.defans3PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.defans4PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.ortasaha0PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.ortasaha1PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.ortasaha2PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.ortasaha3PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.ortasaha4PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.forvet0PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.forvet1PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.forvet2PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.yedek0PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.yedek1PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.yedek2PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName
          ?false:true,
          child: Container(
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
                            Oyuncugetir.oyuncular[index].Position=='2'?'ORT'+' - '+Oyuncugetir.oyuncular[index].TakimKisatlma:
                            'F' +' - '+Oyuncugetir.oyuncular[index].TakimKisatlma
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
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(milliseconds: 10),content: Text(Oyuncugetir.oyuncular[index].PlayerName)));
                              },
                              child: CircleAvatar(backgroundColor: Colors.red,
                                  child: Text(Oyuncugetir.oyuncular[index].Injury==1?'!':Oyuncugetir.oyuncular[index].Leave==1?'X':''
                                    ,style: TextStyle(color: Colors.white),)
                              ),
                            )
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
              ],
            ),
            //child: Text(Oyuncugetir.oyuncular.elementAt(index).PlayerShortName),
            width: 500,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
        ); }
      ),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return FutureBuilder(
        future: Oyuncugetir.getPlayers(position,'0',takimadi),
        builder: (BuildContext context,AsyncSnapshot snapshot){
      return InkWell(
        onTap: () {
        //  content: Text(Oyuncugetir.oyuncular[index].PlayerName)));

          if(global.FreeTransfer==0&&global.TransferPuan==0){
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(backgroundColor: Colors.red,
                      title: Text(
                        'Free transfer ve transfer puanınız bitti puanınızdan harcanacak emin misiniz?',
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      content: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () async {
                                  playerid = Oyuncugetir.oyuncular[index].PlayerID;
                                  debugPrint(
                                      'oyuncudeğiş ekranı hata mesajı: ' + global.hatamsj.toString());
                                  return showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            title: Text(
                                              ///Buraya sakatlık ile ilgili bilgi verilecek mi diye sor!!!!
                                              '${Oyuncugetir.oyuncular[index].Description == null ? '' : Oyuncugetir.oyuncular[index].Description} ${Oyuncugetir.oyuncular[index].PlayerShortName} kadrona dahil etmek istiyor musun?',
                                              textAlign: TextAlign.center,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                            content: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        alignment: Alignment.center,
                                                        width: 100,
                                                        height: 35,
                                                        color: Colors.red,
                                                        child: Text(
                                                          "Vazgeç",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        await playerChange2(neresi, playerid);
                                                        if (global.hatamsj == 11) {
                                                          //  Navigator.pop(context);
                                                          //  Navigator.pop(context);
                                                          return showDialog(
                                                              context: context,
                                                              builder: (BuildContext context) {
                                                                return AlertDialog(
                                                                    backgroundColor:
                                                                    Colors.red.shade700,
                                                                    title: Text(
                                                                      "Seçilen oyuncuyu almak için bütçeniz yeterli değil",
                                                                      style: TextStyle(
                                                                          color: Colors.white),
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.all(
                                                                            Radius.circular(8.0))),
                                                                    content: Container(
                                                                        height: 30,
                                                                        decoration: BoxDecoration(
                                                                          color: Colors.red.shade700,
                                                                        ),
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment.center,
                                                                          children: <Widget>[
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                Navigator.pop(context);
                                                                                Navigator.pop(context);
                                                                                //Navigator.pop(context);
                                                                              },
                                                                              child: Text(
                                                                                "Tamam",
                                                                                style: TextStyle(
                                                                                    color: Colors.white,
                                                                                    fontWeight:
                                                                                    FontWeight
                                                                                        .bold),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )));
                                                              });
                                                        }
                                                        else if (global.hatamsj == 12) {
                                                          //  Navigator.pop(context);
                                                          //  Navigator.pop(context);
                                                          return showDialog(
                                                              context: context,
                                                              builder: (BuildContext context) {
                                                                return AlertDialog(
                                                                    backgroundColor:
                                                                    Colors.red.shade700,
                                                                    title: Text(
                                                                      "Bir Takımdan sadece 3 kişi seçebilirsin",
                                                                      style: TextStyle(
                                                                          color: Colors.white),
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.all(
                                                                            Radius.circular(8.0))),
                                                                    content: Container(
                                                                        height: 30,
                                                                        decoration: BoxDecoration(
                                                                          color: Colors.red.shade700,
                                                                        ),
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment.center,
                                                                          children: <Widget>[
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                Navigator.pop(context);
                                                                                Navigator.pop(context);
                                                                                //Navigator.pop(context);
                                                                              },
                                                                              child: Text(
                                                                                "Tamam",
                                                                                style: TextStyle(
                                                                                    color: Colors.white,
                                                                                    fontWeight:
                                                                                    FontWeight
                                                                                        .bold),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )));
                                                              });
                                                        }
                                                        else if (global.hatamsj == 13) {
                                                          //   Navigator.pop(context);
                                                          //   Navigator.pop(context);
                                                          return showDialog(
                                                              context: context,
                                                              builder: (BuildContext context) {
                                                                return AlertDialog(
                                                                    backgroundColor:
                                                                    Colors.red.shade700,
                                                                    title: Text(
                                                                      "Bu oyuncu zaten kadronda var",
                                                                      style: TextStyle(
                                                                          color: Colors.white),
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.all(
                                                                            Radius.circular(8.0))),
                                                                    content: Container(
                                                                        height: 30,
                                                                        decoration: BoxDecoration(
                                                                          color: Colors.red.shade700,
                                                                        ),
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment.center,
                                                                          children: <Widget>[
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                Navigator.pop(context);
                                                                                Navigator.pop(context);
                                                                                //Navigator.pop(context);
                                                                              },
                                                                              child: Text(
                                                                                "Tamam",
                                                                                style: TextStyle(
                                                                                    color: Colors.white,
                                                                                    fontWeight:
                                                                                    FontWeight
                                                                                        .bold),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )));
                                                              });
                                                        }
                                                        else if (global.FreeTransfer > 0) {
                                                          // Navigator.pop(context);
                                                          // Navigator.pop(context);
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      PlayerTransferPage()));

                                                          showDialog(
                                                              context: context,
                                                              builder: (BuildContext context) {
                                                                return AlertDialog(
                                                                    backgroundColor:
                                                                    Colors.blue.shade700,
                                                                    title: Text(
                                                                      "Free Transfer Kullandınız",
                                                                      style: TextStyle(
                                                                          color: Colors.white),
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.all(
                                                                            Radius.circular(8.0))),
                                                                    content: Container(
                                                                        height: 30,
                                                                        decoration: BoxDecoration(
                                                                          color: Colors.blue.shade700,
                                                                        ),
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment.center,
                                                                          children: <Widget>[
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                // Navigator.pop(context);
                                                                                // Navigator.pop(context);

                                                                                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: Text(
                                                                                "Tamam",
                                                                                style: TextStyle(
                                                                                    color: Colors.white,
                                                                                    fontWeight:
                                                                                    FontWeight
                                                                                        .bold),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )));
                                                              });
                                                        }
                                                        else if (global.TransferPuan > 0) {
                                                          //Navigator.pop(context);
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      PlayerTransferPage()));

                                                          //  Navigator.pop(context);
                                                          showDialog(
                                                              context: context,
                                                              builder: (BuildContext context) {
                                                                return AlertDialog(
                                                                    backgroundColor:
                                                                    Colors.blue.shade700,
                                                                    title: Text(
                                                                      "Transfer puanını Kullandınız",
                                                                      style: TextStyle(
                                                                          color: Colors.white),
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.all(
                                                                            Radius.circular(8.0))),
                                                                    content: Container(
                                                                        height: 30,
                                                                        decoration: BoxDecoration(
                                                                          color: Colors.blue.shade700,
                                                                        ),
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment.center,
                                                                          children: <Widget>[
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                        builder:
                                                                                            (context) =>
                                                                                            TransferPuanDukkanPage()));
                                                                                //Navigator.pop(context);
                                                                              },
                                                                              child: Container(
                                                                                alignment:
                                                                                Alignment.center,
                                                                                width: 190,
                                                                                height: 55,
                                                                                decoration: BoxDecoration(
                                                                                    color: Colors
                                                                                        .greenAccent,
                                                                                    borderRadius:
                                                                                    BorderRadius
                                                                                        .circular(
                                                                                        25)),
                                                                                child: Text(
                                                                                  "Transfer Puanı Topla",
                                                                                  style: TextStyle(
                                                                                      color:
                                                                                      Colors.white,
                                                                                      fontWeight:
                                                                                      FontWeight
                                                                                          .bold),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>TransferPuanDukkanPage()));
                                                                                Navigator.pop(context);
                                                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                                              },
                                                                              child: Container(
                                                                                alignment:
                                                                                Alignment.center,
                                                                                decoration: BoxDecoration(
                                                                                    color: Colors
                                                                                        .greenAccent,
                                                                                    borderRadius:
                                                                                    BorderRadius
                                                                                        .circular(
                                                                                        25)),
                                                                                width: 70,
                                                                                height: 55,
                                                                                child: Text(
                                                                                  "Tamam",
                                                                                  style: TextStyle(
                                                                                      color:
                                                                                      Colors.white,
                                                                                      fontWeight:
                                                                                      FontWeight
                                                                                          .bold),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )));
                                                              });
                                                        }
                                                        else if (global.Expense < 0||global.FreeTransfer==0||global.TransferPuan==0) {
                                                          // Navigator.pop(context);
                                                          // Navigator.pop(context);
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      PlayerTransferPage()));

                                                          showDialog(
                                                              context: context,
                                                              builder: (BuildContext context) {
                                                                return AlertDialog(
                                                                    backgroundColor:
                                                                    Colors.red.shade700,
                                                                    title: Text(
                                                                      "Puanınızdan harcadınız!",
                                                                      style: TextStyle(
                                                                          color: Colors.white),
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.all(
                                                                            Radius.circular(8.0))),
                                                                    content: Container(
                                                                        height: 30,
                                                                        decoration: BoxDecoration(
                                                                          color: Colors.red.shade700,
                                                                        ),
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment.center,
                                                                          children: <Widget>[
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                        builder:
                                                                                            (context) =>
                                                                                            TransferPuanDukkanPage()));
                                                                                //Navigator.pop(context);
                                                                              },
                                                                              child: Container(
                                                                                alignment:
                                                                                Alignment.center,
                                                                                width: 190,
                                                                                height: 55,
                                                                                decoration: BoxDecoration(
                                                                                    color: Colors
                                                                                        .greenAccent,
                                                                                    borderRadius:
                                                                                    BorderRadius
                                                                                        .circular(
                                                                                        25)),
                                                                                child: Text(
                                                                                  "Transfer Puanı Topla",
                                                                                  style: TextStyle(
                                                                                      color:
                                                                                      Colors.white,
                                                                                      fontWeight:
                                                                                      FontWeight
                                                                                          .bold),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>TransferPuanDukkanPage()));

                                                                                Navigator.pop(context);
                                                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                                              },
                                                                              child: Container(
                                                                                alignment:
                                                                                Alignment.center,
                                                                                decoration: BoxDecoration(
                                                                                    color: Colors
                                                                                        .greenAccent,
                                                                                    borderRadius:
                                                                                    BorderRadius
                                                                                        .circular(
                                                                                        25)),
                                                                                width: 70,
                                                                                height: 55,
                                                                                child: Text(
                                                                                  "Tamam",
                                                                                  style: TextStyle(
                                                                                      color:
                                                                                      Colors.white,
                                                                                      fontWeight:
                                                                                      FontWeight
                                                                                          .bold),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )));
                                                              });
                                                        } else {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      PlayerTransferPage()));
                                                          // Navigator.pushNamed(context, '/createteam');
                                                        }
                                                      },
                                                      child: Container(
                                                        alignment: Alignment.center,
                                                        width: 100,
                                                        height: 35,
                                                        color: Colors.green,
                                                        child: Text(
                                                          "Tamam",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ),
                                                    ),

                                                  ],
                                                )));
                                      });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 35,
                                  color: Colors.green,
                                  child: Text(
                                    "Evet",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 35,
                                  color: Colors.red.shade900,
                                  child: Text(
                                    "Vazgeç",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          )));
                });
            playerid = Oyuncugetir.oyuncular[index].PlayerID;
            debugPrint(
                'oyuncudeğiş ekranı hata mesajı: ' + global.hatamsj.toString());
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: Text(
                        ///Buraya sakatlık ile ilgili bilgi verilecek mi diye sor!!!!
                        '${Oyuncugetir.oyuncular[index].Description == null ? '' : Oyuncugetir.oyuncular[index].Description} ${Oyuncugetir.oyuncular[index].PlayerShortName} kadrona dahil etmek istiyor musun?',
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      content: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () async {
                                  await playerChange2(neresi, playerid);
                                  if (global.hatamsj == 11) {
                                    //  Navigator.pop(context);
                                    //  Navigator.pop(context);
                                    return showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              backgroundColor:
                                              Colors.red.shade700,
                                              title: Text(
                                                "Seçilen oyuncuyu almak için bütçeniz yeterli değil",
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8.0))),
                                              content: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red.shade700,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(context);
                                                          Navigator.pop(context);
                                                          //Navigator.pop(context);
                                                        },
                                                        child: Text(
                                                          "Tamam",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  )));
                                        });
                                  } else if (global.hatamsj == 12) {
                                    //  Navigator.pop(context);
                                    //  Navigator.pop(context);
                                    return showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              backgroundColor:
                                              Colors.red.shade700,
                                              title: Text(
                                                "Bir Takımdan sadece 3 kişi seçebilirsin",
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8.0))),
                                              content: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red.shade700,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(context);
                                                          Navigator.pop(context);
                                                          //Navigator.pop(context);
                                                        },
                                                        child: Text(
                                                          "Tamam",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  )));
                                        });
                                  } else if (global.hatamsj == 13) {
                                    //   Navigator.pop(context);
                                    //   Navigator.pop(context);
                                    return showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              backgroundColor:
                                              Colors.red.shade700,
                                              title: Text(
                                                "Bu oyuncu zaten kadronda var",
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8.0))),
                                              content: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red.shade700,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(context);
                                                          Navigator.pop(context);
                                                          //Navigator.pop(context);
                                                        },
                                                        child: Text(
                                                          "Tamam",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  )));
                                        });
                                  } else if (global.FreeTransfer > 0) {
                                    // Navigator.pop(context);
                                    // Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PlayerTransferPage()));

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              backgroundColor:
                                              Colors.blue.shade700,
                                              title: Text(
                                                "Free Transfer Kullandınız",
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8.0))),
                                              content: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue.shade700,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                        onTap: () {
                                                          // Navigator.pop(context);
                                                          // Navigator.pop(context);

                                                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                          Navigator.pop(context);
                                                        },
                                                        child: Text(
                                                          "Tamam",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  )));
                                        });
                                  } else if (global.TransferPuan > 0) {
                                    //Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PlayerTransferPage()));

                                    //  Navigator.pop(context);
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              backgroundColor:
                                              Colors.blue.shade700,
                                              title: Text(
                                                "Transfer puanını Kullandınız",
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8.0))),
                                              content: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue.shade700,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                      TransferPuanDukkanPage()));
                                                          //Navigator.pop(context);
                                                        },
                                                        child: Container(
                                                          alignment:
                                                          Alignment.center,
                                                          width: 190,
                                                          height: 55,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .greenAccent,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  25)),
                                                          child: Text(
                                                            "Transfer Puanı Topla",
                                                            style: TextStyle(
                                                                color:
                                                                Colors.white,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>TransferPuanDukkanPage()));
                                                          Navigator.pop(context);
                                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                        },
                                                        child: Container(
                                                          alignment:
                                                          Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .greenAccent,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  25)),
                                                          width: 70,
                                                          height: 55,
                                                          child: Text(
                                                            "Tamam",
                                                            style: TextStyle(
                                                                color:
                                                                Colors.white,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )));
                                        });
                                  } else if (global.Expense < 0) {
                                    // Navigator.pop(context);
                                    // Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PlayerTransferPage()));

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              backgroundColor:
                                              Colors.red.shade700,
                                              title: Text(
                                                "Puanınızdan harcadınız!",
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8.0))),
                                              content: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red.shade700,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                      TransferPuanDukkanPage()));
                                                          //Navigator.pop(context);
                                                        },
                                                        child: Container(
                                                          alignment:
                                                          Alignment.center,
                                                          width: 190,
                                                          height: 55,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .greenAccent,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  25)),
                                                          child: Text(
                                                            "Transfer Puanı Topla",
                                                            style: TextStyle(
                                                                color:
                                                                Colors.white,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>TransferPuanDukkanPage()));

                                                          Navigator.pop(context);
                                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                        },
                                                        child: Container(
                                                          alignment:
                                                          Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .greenAccent,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  25)),
                                                          width: 70,
                                                          height: 55,
                                                          child: Text(
                                                            "Tamam",
                                                            style: TextStyle(
                                                                color:
                                                                Colors.white,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )));
                                        });
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PlayerTransferPage()));
                                    // Navigator.pushNamed(context, '/createteam');
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 35,
                                  color: Colors.green,
                                  child: Text(
                                    "Tamam",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 35,
                                  color: Colors.red,
                                  child: Text(
                                    "Vazgeç",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          )));
                });
          }
          else{
            playerid = Oyuncugetir.oyuncular[index].PlayerID;
            debugPrint(
                'oyuncudeğiş ekranı hata mesajı: ' + global.hatamsj.toString());
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: Text(
                        ///Buraya sakatlık ile ilgili bilgi verilecek mi diye sor!!!!
                        '${Oyuncugetir.oyuncular[index].Description == null ? '' : Oyuncugetir.oyuncular[index].Description} ${Oyuncugetir.oyuncular[index].PlayerShortName} kadrona dahil etmek istiyor musun?',
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      content: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 35,
                                  color: Colors.red,
                                  child: Text(
                                    "Vazgeç",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await playerChange2(neresi, playerid);
                                  if (global.hatamsj == 11) {
                                    //  Navigator.pop(context);
                                    //  Navigator.pop(context);
                                    return showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              backgroundColor:
                                              Colors.red.shade700,
                                              title: Text(
                                                "Seçilen oyuncuyu almak için bütçeniz yeterli değil",
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8.0))),
                                              content: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red.shade700,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(context);
                                                          Navigator.pop(context);
                                                          //Navigator.pop(context);
                                                        },
                                                        child: Text(
                                                          "Tamam",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  )));
                                        });
                                  } else if (global.hatamsj == 12) {
                                    //  Navigator.pop(context);
                                    //  Navigator.pop(context);
                                    return showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              backgroundColor:
                                              Colors.red.shade700,
                                              title: Text(
                                                "Bir Takımdan sadece 3 kişi seçebilirsin",
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8.0))),
                                              content: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red.shade700,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(context);
                                                          Navigator.pop(context);
                                                          //Navigator.pop(context);
                                                        },
                                                        child: Text(
                                                          "Tamam",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  )));
                                        });
                                  } else if (global.hatamsj == 13) {
                                    //   Navigator.pop(context);
                                    //   Navigator.pop(context);
                                    return showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              backgroundColor:
                                              Colors.red.shade700,
                                              title: Text(
                                                "Bu oyuncu zaten kadronda var",
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8.0))),
                                              content: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red.shade700,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(context);
                                                          Navigator.pop(context);
                                                          //Navigator.pop(context);
                                                        },
                                                        child: Text(
                                                          "Tamam",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  )));
                                        });
                                  } else if (global.FreeTransfer > 0) {
                                    // Navigator.pop(context);
                                    // Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PlayerTransferPage()));

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              backgroundColor:
                                              Colors.blue.shade700,
                                              title: Text(
                                                "Free Transfer Kullandınız",
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8.0))),
                                              content: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue.shade700,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                        onTap: () {
                                                          // Navigator.pop(context);
                                                          // Navigator.pop(context);

                                                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                          Navigator.pop(context);
                                                        },
                                                        child: Text(
                                                          "Tamam",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  )));
                                        });
                                  } else if (global.TransferPuan > 0) {
                                    //Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PlayerTransferPage()));

                                    //  Navigator.pop(context);
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              backgroundColor:
                                              Colors.blue.shade700,
                                              title: Text(
                                                "Transfer puanını Kullandınız",
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8.0))),
                                              content: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue.shade700,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                      TransferPuanDukkanPage()));
                                                          //Navigator.pop(context);
                                                        },
                                                        child: Container(
                                                          alignment:
                                                          Alignment.center,
                                                          width: 190,
                                                          height: 55,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .greenAccent,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  25)),
                                                          child: Text(
                                                            "Transfer Puanı Topla",
                                                            style: TextStyle(
                                                                color:
                                                                Colors.white,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>TransferPuanDukkanPage()));
                                                          Navigator.pop(context);
                                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                        },
                                                        child: Container(
                                                          alignment:
                                                          Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .greenAccent,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  25)),
                                                          width: 70,
                                                          height: 55,
                                                          child: Text(
                                                            "Tamam",
                                                            style: TextStyle(
                                                                color:
                                                                Colors.white,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )));
                                        });
                                  } else if (global.Expense < 0) {
                                    // Navigator.pop(context);
                                    // Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PlayerTransferPage()));

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              backgroundColor:
                                              Colors.red.shade700,
                                              title: Text(
                                                "Puanınızdan harcadınız!",
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8.0))),
                                              content: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red.shade700,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                      TransferPuanDukkanPage()));
                                                          //Navigator.pop(context);
                                                        },
                                                        child: Container(
                                                          alignment:
                                                          Alignment.center,
                                                          width: 190,
                                                          height: 55,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .greenAccent,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  25)),
                                                          child: Text(
                                                            "Transfer Puanı Topla",
                                                            style: TextStyle(
                                                                color:
                                                                Colors.white,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>TransferPuanDukkanPage()));

                                                          Navigator.pop(context);
                                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerTransferPage()));
                                                        },
                                                        child: Container(
                                                          alignment:
                                                          Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .greenAccent,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  25)),
                                                          width: 70,
                                                          height: 55,
                                                          child: Text(
                                                            "Tamam",
                                                            style: TextStyle(
                                                                color:
                                                                Colors.white,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )));
                                        });
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PlayerTransferPage()));
                                    // Navigator.pushNamed(context, '/createteam');
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 35,
                                  color: Colors.green,
                                  child: Text(
                                    "Tamam",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),

                            ],
                          )));
                });
          }
          // Navigator.pushNamed(context, '/deneme2');

          /*
                          if(kontrol!=snapshot.data[index].oyuncuAdi && kontrol2!=snapshot.data[index].oyuncuAdi&&kontrol3!=snapshot.data[index].oyuncuAdi&&kontrol4!=snapshot.data[index].oyuncuAdi){
                            if(i==1){
                              global.defans1=snapshot.data[index].oyuncuAdi;
                              global.pozisyon=snapshot.data[index].pozisyon;
                              global.degeri=snapshot.data[index].degeri;
                            }
                            else if(i==2){
                              global.defans2=snapshot.data[index].oyuncuAdi;
                              global.pozisyon=snapshot.data[index].pozisyon;
                              global.degeri=snapshot.data[index].degeri;
                            }else if(i==3){
                              global.defans3=snapshot.data[index].oyuncuAdi;
                              global.pozisyon=snapshot.data[index].pozisyon;
                              global.degeri=snapshot.data[index].degeri;
                            }
                            else{
                              global.defans4=snapshot.data[index].oyuncuAdi;
                              global.pozisyon=snapshot.data[index].pozisyon;
                              global.degeri=snapshot.data[index].degeri;
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>YeniHomePage()));}
                          else{
                            debugPrint(snapshot.data[index].oyuncuAdi+ ' u seçemezsin');
                          }
                       */
        },
        child: Visibility(
          visible: global.kaleci0PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName
              ||global.kaleci1PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.defans0PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.defans1PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.defans2PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.defans3PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.defans4PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.ortasaha0PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.ortasaha1PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.ortasaha2PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.ortasaha3PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.ortasaha4PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.forvet0PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.forvet1PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.forvet2PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.yedek0PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.yedek1PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName||
              global.yedek2PlayerShortName==Oyuncugetir.oyuncular[index].PlayerShortName
              ?false:true,
          child:  Row(
            children: <Widget>[
              Container(
             //   child: Text(Oyuncugetir.oyuncular[index].Position),
                child: Text(Oyuncugetir.oyuncular[index].Form),

                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(Oyuncugetir.oyuncular[index].Value1.toString()+'M ₺'),
                //child: Text(player.oyuncular[index].Value+' M ₺'),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
               // child: Text(Oyuncugetir.oyuncular[index].PlayerID.toString()),
                child: Text(Oyuncugetir.oyuncular[index].ElectionRate.toString()=='null'?'%0':'%'+Oyuncugetir.oyuncular[index].ElectionRate.toString()),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(Oyuncugetir.oyuncular[index].WeekPoints.toString()),
               // child: Image.network(player.oyuncular[index].Kits),
                // child: Text(player.oyuncular[index].PlayerShortName),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(Oyuncugetir.oyuncular[index].SeasonPoints.toString()),
                // child: Image.network(player.oyuncular[index].Kits),
                // child: Text(player.oyuncular[index].PlayerShortName),
                width: 25,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
        ),
      ); }
    );
  }
}


