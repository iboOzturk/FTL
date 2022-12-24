import 'package:fantasysuperlig/Screens/Leagues/ozelliglerpage.dart';
import 'package:fantasysuperlig/Screens/News/haberlerpage.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Variables/global.dart' as global;
import 'package:flutter_html/flutter_html.dart';
class PrivateAwardsPage extends StatefulWidget {
  @override
  _PrivateAwardsPageState createState() => _PrivateAwardsPageState();
}

class _PrivateAwardsPageState extends State<PrivateAwardsPage> {

  int oid;
  String ligname;
  String aciklama;
  @override
  Widget build(BuildContext context) {
    var data=[];
    data=ModalRoute.of(context).settings.arguments;
    oid=data[0];
    ligname=data[1];
    aciklama=data[2];
    return WillPopScope(
      onWillPop: () {
        // global.selectIndex=0;
        // Navigator.pushNamed(context, '/menu');
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OzelLiglerPage()));
      },
      child: Scaffold(
        appBar: AppBar(title: Text(ligname),),
        //    backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
          body: FutureBuilder(
              future: getOzelLigDetay(oid),
              builder: (BuildContext context,AsyncSnapshot snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(color: Colors.white,backgroundColor:  Color.fromARGB(255, 55, 0, 60 ),)
                  );
                }
                return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      //  color:  Color.fromARGB(255, 55, 0, 60 ),
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
                      child: SafeArea(
                        child: Column(

                          children: [
                            SizedBox(height: 20,),
                            Container(
                                alignment:Alignment.center,child: Text(aciklama,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,fontSize: 20),)),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 20,bottom: 10),
                              child: Html(data: global.awards),
                            ),
                          ],
                        ),
                      ),
                ); }
          )
      ),
    );
  }
}
