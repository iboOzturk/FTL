
import 'package:fantasysuperlig/Screens/News/haberayrintipage.dart';
///Admob
//import 'package:fantasysuperlig/Services/admobservice.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads.dart';
///Admob
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../Variables/global.dart' as global;
import '../bannerpage.dart';


class HaberPage extends StatefulWidget {
  @override
  _HaberPageState createState() => _HaberPageState();
}

class _HaberPageState extends State<HaberPage> {
  haberlerigetir haber=haberlerigetir();
  Future<void> bannergetir() async{
    await getBanner(global.userid);
  }
  @override
  void initState() {
    UnityAds.init(gameId: '4376159');
    getBannerAds();
       bannergetir();
       super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return global.BannerID==0||global.BannerID==null?WillPopScope(
      onWillPop: () {
        Navigator.pushNamed(context, '/menu');
      },
      child: Scaffold(
        appBar: AppBar(centerTitle: true,
          leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: () {
            Navigator.pushNamed(context, '/menu');
          },color: Colors.white,),
          title: Text('Fantezi Ligi Haberler'),
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
         // backgroundColor:Color.fromARGB(255, 55, 0, 60 ) ,
        ),
        //backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
        body: FutureBuilder(
          future: haber.getNews(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
          return Container(width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height ,
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
                itemCount: haber.haberler.length,
                itemBuilder: (context,index){
                  var habers=haber.haberler[index];
                  return InkWell(
                    onTap: () {
                      var data=[];
                      data.add(habers.HaberID);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HaberAyrintiPage(),settings: RouteSettings(arguments: data)));
                    },
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Container(
                          margin: EdgeInsets.only(left: 15,right: 15),
                          height: 220,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 1.5,color: Colors.white),
                              image: DecorationImage(
                                  image: NetworkImage(habers.BaslikResim),fit: BoxFit.cover
                              )
                          ),
                          child: Container(alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.black87,
                                      Colors.transparent,
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    stops: [0.25,0.5]
                                )
                            ),
                            child: ListTile(
                              title: Text(habers.Baslik,
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,),
                              ),
                              trailing: IconButton(onPressed: (){},icon: Icon(Icons.share,color: Colors.white,)),
                              //isThreeLine: true,
                              //subtitle: Text(trend.subtitle,style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                        index==0?global.adsBannerState==0?Text(''):Visibility(
                            visible: global.bannerReaklamHakki==1?true:false,
                            child: UnityBannerAd(placementId: 'Android_Ad_Banner',)):SizedBox(height: 0.5,)
                        ///Admob
                        /* index==0?global.adsBannerState==0?Text(''): Visibility(
                          visible: global.bannerReaklamHakki==1?true:false,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0,bottom: 20),
                            child: Container(
                              height: 50,
                              child: AdWidget(
                                ad:AdmobHelper.getBannerAd()..load(),
                                key: UniqueKey(),
                              ),
                            ),
                          ),
                        ):SizedBox(height: 0.5,) */
                      ],
                    ),

                  );
                }
            ),
          ); }
        ),
      ),
    ):BannerPage();
  }
}
