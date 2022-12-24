
import '../MenuPage.dart';
import '/Screens/News/haberayrintipage.dart';
import '/Screens/Puanim/targetaylikpage.dart';
import '/Screens/Puanim/targetpointpage.dart';
import '/Services/player_api.dart';
import 'package:flutter/material.dart';
import '../../Variables/global.dart' as global;

class Ozel2LeaguePage extends StatefulWidget {
  @override
  _Ozel2LeaguePageState createState() => _Ozel2LeaguePageState();
}

class _Ozel2LeaguePageState extends State<Ozel2LeaguePage> {
  // haberlerigetir haber=haberlerigetir();
  liglerigetir lig=liglerigetir();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        global.selectIndex=2;
        Navigator.pushNamed(context, '/menu');
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            global.selectIndex=2;
            Navigator.pushNamed(context, '/menu');
          },icon: Icon(Icons.arrow_back),),
          centerTitle: true,title: Text(global.OzelLig2Adi),
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
        body: FutureBuilder(
            future: lig.getLeague(4),
            builder: (BuildContext context,AsyncSnapshot snapshot){
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
                    itemCount: lig.ligler.length,
                    itemBuilder: (context,index){
                      var ligs=lig.ligler[index];
                      return Column(
                        children: [
                          SizedBox(height: 10,),
                          InkWell(
                            onTap: () async{
                              //  await setState((){
                              //    global.otheruserid=ligs.userID;
                              //  });
                              //  var data=[];
                              //  data.add(ligs.FantasyName);
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>TargetAylikPointPage(),settings: RouteSettings(arguments: data)));
                            },
                            child: Container(height: 80,alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: index==0?Color.fromARGB(255, 255, 215, 0):
                                index==1?Color.fromARGB(255, 192, 192, 192):
                                index==2?Color.fromARGB(255, 205, 127 , 20):
                                global.fantasyteamname==ligs.FantasyName?Colors.white.withOpacity(0.7):
                                Colors.white.withOpacity(0.4)  ,
                                // Colors.blue.shade300,
                                borderRadius: BorderRadius.circular(25),

                              ),

                              margin: EdgeInsets.only(left: 15,right: 15),
                              child: ListTile(
                                leading: Text((index+1).toString(),
                                  style: TextStyle(fontSize: 28,color:index==0||global.fantasyteamname==ligs.FantasyName?Colors.black: Colors.white,fontWeight: FontWeight.w900),
                                ),
                                title: Row(
                                  children: [
                                    Container(width: 1.25,height:70,color: Color(0xFF3366FF),),
                                    // SizedBox(width: 50,),
                                    Expanded(flex: 16,child: CircleAvatar(backgroundColor: Colors.green,child: Icon(Icons.person,color: Colors.white,),)),

                                    // SizedBox(width: 10,),
                                    Expanded(flex: 46,
                                      child: Text(ligs.FantasyName,
                                        style: TextStyle(color: index==0||global.fantasyteamname==ligs.FantasyName?Colors.black:Colors.white,fontWeight: FontWeight.w700,fontSize: 20),
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
                                  child: Text(ligs.Points.toString(),
                                    style: TextStyle(color:index==0||global.fantasyteamname==ligs.FantasyName?Colors.black: Colors.white,fontWeight: FontWeight.w900,fontSize: 22), ),
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
