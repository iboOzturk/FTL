import 'package:fantasysuperlig/Screens/MenuPage.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import '../Variables/global.dart' as global;
class BannerPage extends StatefulWidget {
  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {

  @override
  void initState() {
   // getBanner(global.userid);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double genislik=MediaQuery.of(context).size.width;
    return FutureBuilder(
      future:  getBanner(global.userid),
      builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: Colors.grey.shade900,
          child: SafeArea(
            child: Column(
              children: [
                Expanded(flex: 1,
                  child: InkWell(onTap: () async{
                    await bannerClose(global.BannerID);
                    print('KAPAT TUŞU');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));
                  },child: Column(
                    children: [
                      Container(alignment: Alignment.topLeft,
                        color: Colors.grey.shade900,width: genislik,
                          child: Padding(
                            padding:  EdgeInsets.only(left: 30),
                            child: Row(
                              children: [
                                Icon(Icons.close,size: 35,color: Colors.white,),
                            Text('Kapat',style: TextStyle(fontSize: 20,color: Colors.white,))
                              ],
                            ),
                           // child: Text('Kapat',style: TextStyle(fontSize: 28,color: Colors.white,),),
                          )),
                      Container(height: 3,width: genislik,color: Colors.black,)
                    ],
                  )),
                ),

                Expanded(flex: 19,child: Image.network(global.BannerURL,fit: BoxFit.fill,)),

              ],
            ),
          ),
        ),
      ); }
    );
  }
}
