
import 'package:connectivity/connectivity.dart';
import 'package:fantasysuperlig/Screens/News/haberayrintipage.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Variables/global.dart' as global;


class RankTablePage extends StatefulWidget {
  @override
  _RankTablePageState createState() => _RankTablePageState();
}

class _RankTablePageState extends State<RankTablePage> {
  Color ligsirarenk;
  //int haftaid=global.CurrentWeek;
  // haberlerigetir haber=haberlerigetir();
  // liglerigetir lig=liglerigetir();
  //fiksturlerigetir fikstur=fiksturlerigetir();

  siralamayigetir siralama=siralamayigetir();
  void waitLogin() async{
    await checkNetConnectivity();

    if(global.checkNetwork==false){
      _showDialog('Bağlantı Hatası', 'Lütfen internet bağlantınızı kontrol ediniz');
    }

  }

  checkNetConnectivity() async{
    var result=await Connectivity().checkConnectivity();
    if(result==ConnectivityResult.none){
      //checkNetwork=false;
      global.checkNetwork=false;
      //  _showDialog('net yok ', 'internetiniz yok');
    }
    else if(result==ConnectivityResult.wifi){
      global.checkNetwork=true;
      // checkNetwork=true;
      //_showDialog('wifi', 'wifi bağlı');
    }
    else if(result==ConnectivityResult.mobile){
      //checkNetwork=true;
      global.checkNetwork=true;

      //_showDialog('mobil veri', 'mobil veri bağlı');
    }
  }
  _showDialog(title,text){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(content: Text(text),title: Text(title),);
    });
  }
  @override
  void initState() {
    waitLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        global.selectIndex=2;
        Navigator.pushNamed(context, '/menu');
      },
      child: FutureBuilder(
        future: siralama.getRankTable(),
    builder: (BuildContext context,AsyncSnapshot snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: Container(
            width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
            //  color: Color.fromARGB(255, 35, 0, 36),
            color: Colors.grey.shade900,

            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/FTLNewLogoBeyaz.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
                  child: Text('Yükleniyor...',style: TextStyle(color: Colors.white,fontSize: 24),),
                )
              ],
            )));
      }
        return Scaffold(
          backgroundColor: Color(0xFF3366FF),
          appBar: AppBar(
            leading: IconButton(onPressed: () {
             // global.selectIndex=2;
            //  Navigator.pushNamed(context, '/menu');
            },icon: Icon(Icons.arrow_back,color: Colors.transparent,),),
            centerTitle: true,title: Text('Puan Durumu'),
            flexibleSpace: Container(
              decoration: BoxDecoration(
              /*  gradient: new LinearGradient(
                    colors: [
                      const Color(0xFF3366FF),
                      const Color(0xFF00CCFF),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp), */
              ),
            ),
            //backgroundColor:Color.fromARGB(255, 55, 0, 60 ) ,
            bottom: PreferredSize(preferredSize: Size.fromHeight(50) ,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF304EA0),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))
                ),
                height: 50,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(flex: 1,child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('#',style: TextStyle(fontSize: 17,color: Colors.white)),
                    )),
                    Expanded(flex: 2,child: Text('Takım',style: TextStyle(fontSize: 17,color: Colors.white),)),
                    Expanded(flex: 1,child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('O',style: TextStyle(fontSize: 17,color: Colors.white)),
                    )),
                    Expanded(flex: 1,child: Text('G',style: TextStyle(fontSize: 17,color: Colors.white))),
                    Expanded(flex: 1,child: Text('B',style: TextStyle(fontSize: 17,color: Colors.white))),
                    Expanded(flex: 1,child: Text('M',style: TextStyle(fontSize: 17,color: Colors.white))),
                    Expanded(flex: 1,child: Text('+/-',style: TextStyle(fontSize: 17,color: Colors.white))),
                    Expanded(flex: 1,child: Text('A',style: TextStyle(fontSize: 17,color: Colors.white))),
                    Expanded(flex: 1,child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text('P',style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold))))
                  ],
                ),
              ),
            ),
          ),
          //backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
          body:
                global.checkNetwork==false?Container(alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          const Color(0xFF3366FF),
                          const Color(0xFF4374FF),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: Text('Bağlantı Hatası...',style: TextStyle(fontSize: 24,color: Colors.white),),
                ):
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          const Color(0xFF3366FF),
                          const Color(0xFF4374FF),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: Container(
                    height: siralama.rankt.length.toDouble()*50,
                   // height: MediaQuery.of(context).size.height-241,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(40, 255, 255, 255),
                    //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))

                    ),
                    child: ListView.builder(
                        itemCount: siralama.rankt.length,
                        itemBuilder: (context,index){
                          var siralamaP=siralama.rankt[index];
                          return Column(
                            children: [
                              //SizedBox(height: 3,),
                              Container(height: 50,
                                //margin: EdgeInsets.only(left: 7,right: 7),
                                decoration: BoxDecoration(
                                    color:
                                    (index+1)==1||(index+1)==2?Color(0xff0E1E5B).withOpacity(.7):
                                    (index+1)==3||(index+1)==4?Color.fromARGB(240, 0, 190, 18).withOpacity(.7):
                                    (index+1)==17||(index+1)==18||(index+1)==19||(index+1)==20?Colors.red.withOpacity(.8):
                                    Color.fromARGB(53, 255, 255, 255),
                                  //  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Row(
                                  children: [
                                    ///Ev Takımı
                                    Expanded(flex: 1,child: Row(
                                      children: [
                                    //    Container(width: 6,color: (index+1)==1||(index+1)==2?Color(0xff091442):Colors.transparent),

                                        Padding(
                                         // padding: const EdgeInsets.only(left: 11.0),
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text((index+1).toString(),style: TextStyle(color: Colors.white,fontSize: 17,),textAlign: TextAlign.left,),
                                        ),
                                      ],
                                    )),
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Image.network(siralamaP.TakimLogo,width: 30,height: 30,fit: BoxFit.contain),
                                          SizedBox(width: 8,),
                                          Text(siralamaP.TakimKisaltma,
                                            style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),

                                          ),
                                        ],
                                      ),
                                    ),
                                    ///Maç Zamanı
                                    Expanded(flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(siralamaP.PlayedMatch.toString(),style: TextStyle(color: Colors.white,fontSize: 17),
                                         ),
                                      ),
                                    ),
                                    Expanded(flex: 1,
                                      child: Text(siralamaP.Win.toString(),style: TextStyle(color: Colors.white,fontSize: 17),
                                        ),
                                    ),
                                    Expanded(flex: 1,child: Text(siralamaP.Draw.toString(),
                                      style: TextStyle(color: Colors.white,fontSize: 17),

                                    )
                                    ),
                                    Expanded(flex: 1,child: Text(siralamaP.Lose.toString(),
                                      style: TextStyle(color: Colors.white,fontSize: 17),

                                    )
                                    ),
                                    Expanded(flex: 1,child: Text(siralamaP.GF.toString()+'-'+siralamaP.GA.toString(),
                                      style: TextStyle(color: Colors.white,fontSize: 17),

                                    )
                                    ),
                                    Expanded(flex: 1,child: Text(siralamaP.AVG.toString(),
                                      style: TextStyle(color: Colors.white,fontSize: 17),

                                    )
                                    ),
                                    Expanded(flex: 1,child: Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Text(siralamaP.Point.toString(),
                                        style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),

                                      ),
                                    )
                                    ),

                                  ],
                                ),
                              ),
                            // Container(height: 1,color: Colors.blue,)
                            // SizedBox(height: .4,),
                              (index+1)==20?Container(alignment: Alignment.centerLeft,
                                height: 170,
                                //color: Color.fromARGB(153, 255, 255, 255),
                                color: Colors.white54,

                                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(alignment: Alignment.centerLeft,
                                          height: 40,width: 4,color: Color(0xff0E1E5B),),
                                        SizedBox(width: 5,),
                                        Text('Şampiyonlar Ligi Ön Eleme')
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(alignment: Alignment.centerLeft,
                                          height: 40,width: 4,color: Color.fromARGB(240, 0, 190, 18),),
                                        SizedBox(width: 5,),
                                        Text('Konferans Ligi Ön Eleme')
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(alignment: Alignment.centerLeft,
                                          height: 40,width: 4,color:Colors.red,),
                                        SizedBox(width: 5,),
                                        Text('Küme Düşme')
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              ): SizedBox(height: .4,),

                            ],
                          );
                        },

                    ),
                  ),
                ),
        ); }
      ),
    );
  }
}
