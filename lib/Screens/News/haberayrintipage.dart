import 'package:fantasysuperlig/Screens/News/haberlerpage.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Variables/global.dart' as global;
import 'package:flutter_html/flutter_html.dart';
class HaberAyrintiPage extends StatefulWidget {
  @override
  _HaberAyrintiPageState createState() => _HaberAyrintiPageState();
}

class _HaberAyrintiPageState extends State<HaberAyrintiPage> {
  //haberlerigetir haber=haberlerigetir();
  haberdetaygetir haber=haberdetaygetir();
  int haberid;
  @override
  Widget build(BuildContext context) {
    var data=[];
    data=ModalRoute.of(context).settings.arguments;
    haberid=data[0];

      return WillPopScope(
        onWillPop: () {
         // global.selectIndex=0;
         // Navigator.pushNamed(context, '/menu');
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HaberPage()));
        },
        child: Scaffold(
      //    backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
          body: FutureBuilder(
            future:  haber.getNewDetail(haberid),
            builder: (BuildContext context,AsyncSnapshot snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(color: Colors.white,backgroundColor:  Color.fromARGB(255, 55, 0, 60 ),)
                );
              }
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                //  backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
                  expandedHeight: 270,
                  leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HaberPage()));

                  },),
                  floating: true,
                  pinned: false,
                  snap: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25))
                      ),
                        child: Image.network(global.DetayURL,fit: BoxFit.cover)
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 20,bottom: 10),
                      child: Html(data: global.DetayBody),
                    ),width: 150,
                  ),
                )

              ],
            ); }
          )
        ),
      );
  }
}
