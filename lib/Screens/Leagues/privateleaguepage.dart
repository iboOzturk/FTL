
import 'package:fantasysuperlig/Screens/Leagues/ozelliglerpage.dart';
import 'package:fantasysuperlig/Screens/News/haberayrintipage.dart';
import 'package:fantasysuperlig/Screens/Puanim/targetaylikpage.dart';
import 'package:fantasysuperlig/Screens/Puanim/targetpointpage.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import '../../Variables/global.dart' as global;


class PrivateLeaguePage extends StatefulWidget {
  @override
  _PrivateLeaguePageState createState() => _PrivateLeaguePageState();
}

class _PrivateLeaguePageState extends State<PrivateLeaguePage> {
  int oid;
  String ligname;
  // haberlerigetir haber=haberlerigetir();
  privateliglerigetir privatelig=privateliglerigetir();
  @override
  Widget build(BuildContext context) {
    var data1=[];
    data1=ModalRoute.of(context).settings.arguments;
    oid=data1[0];
    ligname=data1[1];
    return WillPopScope(
      onWillPop: () {
        global.selectIndex=2;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OzelLiglerPage()));
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            global.selectIndex=2;
            Navigator.push(context, MaterialPageRoute(builder: (context)=>OzelLiglerPage()));
          },icon: Icon(Icons.arrow_back),),
          centerTitle: true,title: Text(ligname),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/FTLBackground.png'),fit: BoxFit.fill),

              /* gradient: new LinearGradient(
                  colors: [
                    const Color(0xFF3366FF),
                    const Color(0xFF00CCFF),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),*/
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
        body: FutureBuilder(
            future: privatelig.getPrivateLeague(oid),
            builder: (BuildContext context,AsyncSnapshot snapshot){
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/FTLBackground.png'),fit: BoxFit.fill),

                  /* gradient: new LinearGradient(
                      colors: [
                        const Color(0xFF3366FF),
                        const Color(0xFF00CCFF),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),*/
                ),
                child: ListView.builder(
                    itemCount: privatelig.privateligler.length,
                    itemBuilder: (context,index){
                      var privateligs=privatelig.privateligler[index];
                      return Column(
                        children: [
                          SizedBox(height: 5,),
                          InkWell(
                            onTap: () async{
                              //  await setState((){
                              //    global.otheruserid=ligs.userID;
                              //  });
                              //  var data=[];
                              //  data.add(ligs.FantasyName);
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>TargetAylikPointPage(),settings: RouteSettings(arguments: data)));
                            },
                            child: Stack(
                              children: [
                                Container(height: 80,alignment: Alignment.center,
                                  child: Container(height: 50,alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: index==0?Color.fromARGB(255, 255, 215, 0):
                                      index==1?Color.fromARGB(255, 192, 192, 192):
                                      index==2?Color.fromARGB(255, 205, 127 , 20):
                                      global.fantasyteamname==privateligs.FantasyName?Colors.white.withOpacity(0.7):
                                      Colors.white.withOpacity(0.4)  ,
                                      // Colors.blue.shade300,
                                      borderRadius: BorderRadius.circular(25),

                                    ),

                                    margin: EdgeInsets.only(left: 30,right: 15),
                                    child: ListTile(
                                      /*  leading: Text((index+1).toString(),
                                        style: TextStyle(fontSize: 28,color:index==0||global.fantasyteamname==ligs.FantasyName?Colors.black: Colors.white,fontWeight: FontWeight.w900),
                                      ),*/
                                      title: Row(
                                        children: [
                                          Container(width: 1.25,height:70,color: Color(0xFF3366FF),),
                                          // SizedBox(width: 50,),
                                          Expanded(flex: 16,child: CircleAvatar(backgroundColor: Colors.transparent,child: Icon(Icons.person,color: Colors.white,),)),

                                          // SizedBox(width: 10,),
                                          Expanded(flex: 46,
                                            child: Text(privateligs.FantasyName,
                                              style: TextStyle(color: index==0||global.fantasyteamname==privateligs.FantasyName?Colors.black:Colors.white,fontWeight: FontWeight.w700,fontSize: 20),
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
                                        child: Text(privateligs.Points.toString(),
                                          style: TextStyle(color:index==0||global.fantasyteamname==privateligs.FantasyName?Colors.black: Colors.white,fontWeight: FontWeight.w900,fontSize: 22), ),
                                      ),
                                      //isThreeLine: true,
                                      //subtitle: Text(trend.subtitle,style: TextStyle(color: Colors.black)),
                                    ),
                                  ),
                                ),
                                Positioned(top: 0,bottom: 0,left: 30,
                                    child: CircleAvatar(child: Text((index+1).toString(),
                                      style: TextStyle(fontSize: 28,
                                          color:index==0||index==1||index==2?Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w900),
                                    ),radius: 35,backgroundColor:
                                    index==0||index==1||index==2? Colors.green:
                                    Colors.white,)
                                )

                              ],
                            ),
                          ),

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
