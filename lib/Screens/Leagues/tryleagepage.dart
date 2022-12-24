
import 'dart:async';
import 'dart:convert';

import 'package:fantasysuperlig/Screens/News/haberayrintipage.dart';
import 'package:fantasysuperlig/Screens/Puanim/targetpointpage.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import '../../Variables/global.dart' as global;
import 'package:http/http.dart' as http;

class DenemeLig{
  final String fantasyname;
  final int Points;
  DenemeLig.fromJson(Map<String, dynamic>json):
        fantasyname=json['FantasyName'],
        Points=json['Points'];

}
class DenemeLigSiralama{
  static String url2='https://ftl.allryazilim.com/api/GetRanking?type=0';
  static Future denemeligs()async{
    http.Response response=await http.get(Uri.parse(url2),headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken} );

    var content=response.body;
    List collection=json.decode(content);
    List <DenemeLig> _den =collection.map((json) => DenemeLig.fromJson(json)).toList();

    return _den;
  }
}
class DenemeLigManager{
  final StreamController<int> _denCount=StreamController<int>();
  Stream<int> get denCount=>_denCount.stream;
  Stream<List<DenemeLig>> get denListView async*{
    yield await DenemeLigSiralama.denemeligs();
    while(true) {
      await Future.delayed(Duration(seconds: 5));
      yield await DenemeLigSiralama.denemeligs();
    }
  }
  DenemeLigManager(){
    denListView.listen((list)=>_denCount.add(list.length));
  }
}


class TryLeaguePage extends StatefulWidget {
  @override
  _TryLeaguePageState createState() => _TryLeaguePageState();
}

class _TryLeaguePageState extends State<TryLeaguePage> {

  // haberlerigetir haber=haberlerigetir();
  //liglerigetir lig=liglerigetir();
  DenemeLigManager denLig=DenemeLigManager();

  @override
  void dispose() {
    denLig.denListView;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        denLig._denCount.onPause;
        global.selectIndex=2;
        Navigator.pushNamed(context, '/menu');
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            denLig._denCount.onPause;

            global.selectIndex=2;
            Navigator.pushNamed(context, '/menu');
          },icon: Icon(Icons.arrow_back),),
          centerTitle: true,title: Text('Haftalık Ligler'),
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
          //backgroundColor:Color.fromARGB(255, 55, 0, 60 ) ,
          bottom: PreferredSize(preferredSize: Size.fromHeight(50) ,
            child: Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,bottom: 10),
                        child: Text('Sıralama',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0,bottom: 10),
                        child: Text('Takım Adı',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0,bottom: 10),
                    child: Text('Puan',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),
                  ),
                ],
              ),
            ),
          ),
        ),
        //backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
        body: StreamBuilder(
            stream: denLig.denListView,
            builder: (BuildContext context,AsyncSnapshot<List<DenemeLig>> snapshot){
              List<DenemeLig> dlig=snapshot.data;
              return Container(
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
                child: ListView.builder(
                     itemCount: dlig?.length??0,
                    //itemCount: dlig.length,
                    itemBuilder: (BuildContext context,int index){
                      DenemeLig _denemeLig=dlig[index];
                      return Column(
                        children: [
                          SizedBox(height: 10,),
                          InkWell(
                            onTap: () async{

                            },
                            child: Container(height: 80,alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: index==0?Color.fromARGB(255, 255, 215, 0):
                                index==1?Color.fromARGB(255, 192, 192, 192):
                                index==2?Color.fromARGB(255, 205, 127 , 20):
                                Colors.white.withOpacity(0.4)  ,
                                // Colors.blue.shade300,
                                borderRadius: BorderRadius.circular(25),

                              ),

                              margin: EdgeInsets.only(left: 15,right: 15),
                              child: ListTile(
                                leading: Text((index+1).toString(),
                                  style: TextStyle(fontSize: 28,color:index==0?Colors.black: Colors.white,fontWeight: FontWeight.w900),
                                ),
                                title: Row(
                                  children: [
                                    Container(width: 1.25,height:70,color: Color(0xFF3366FF),),
                                    // SizedBox(width: 50,),
                                    Expanded(flex: 16,child: CircleAvatar(backgroundColor: Colors.green,child: Icon(Icons.person,color: Colors.white,),)),
                                    // SizedBox(width: 10,),
                                    Expanded(flex: 46,
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(flex: 3,
                                            child: Text(_denemeLig.fantasyname,
                                              style: TextStyle(color: index==0?Colors.black:Colors.white,fontWeight: FontWeight.w700,fontSize: 20),
                                            ),
                                          ),
                                          Expanded(flex: 1,child: Icon(Icons.remove_red_eye,size: 32,color: Colors.purple,))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                trailing:Container(alignment: Alignment.center,
                                  width: 50,height: 80,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.15),borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Text(_denemeLig.Points.toString(),
                                    style: TextStyle(color:index==0?Colors.black: Colors.white,fontWeight: FontWeight.w900,fontSize: 22), ),
                                ),
                                //isThreeLine: true,
                                //subtitle: Text(trend.subtitle,style: TextStyle(color: Colors.black)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10   ,),
                        ],
                      );
                    }
                ),
              ); }
        ),
      ),
    );
  }
}
