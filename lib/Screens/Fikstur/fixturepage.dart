
import 'package:fantasysuperlig/Screens/News/haberayrintipage.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Variables/global.dart' as global;


class FixturePage extends StatefulWidget {
  @override
  _FixturePageState createState() => _FixturePageState();
}

class _FixturePageState extends State<FixturePage> {
  int haftaid=global.CurrentWeek;
  String macdurum;
  // haberlerigetir haber=haberlerigetir();
  // liglerigetir lig=liglerigetir();
  fiksturlerigetir fikstur=fiksturlerigetir();
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
          centerTitle: true,title: Text('Fikstür'),
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
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white),onPressed: (){
                    setState(() {
                      haftaid>1?haftaid=haftaid-1:haftaid=1;
                    });
                  },),
                  Text('Hafta $haftaid',style: TextStyle(color: Colors.white,fontSize: 18),),
                  IconButton(icon: Icon(Icons.arrow_forward_ios,color: Colors.white,),onPressed: (){
                    setState(() {
                       fikstur.fiks.length==0?haftaid=1: haftaid=haftaid+1;
                    });
                  },),
                ],
              ),
            ),
          ),
        ),
        //backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
        body: FutureBuilder(
            future: fikstur.getFixture(haftaid),
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
                    itemCount: fikstur.fiks.length,
                    itemBuilder: (context,index){
                      var fixs=fikstur.fiks[index];
                      return Column(
                        children: [
                          SizedBox(height: 10,),
                          Container(margin: EdgeInsets.only(left: 7,right: 7),
                            width: MediaQuery.of(context).size.width/2,height: 25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                            ),
                            child: Text(fixs.MatchDate,style: TextStyle(color: Colors.white),),
                          ),
                          Container(height: 50,margin: EdgeInsets.only(left: 7,right: 7),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey.shade700,
                                    Colors.grey.shade800
                                  ],stops: [0.5,0.5],
                                  begin: Alignment.bottomRight,end:Alignment.topLeft
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            children: [
                              ///Ev Takımı
                              Expanded(flex: 2,child: Image.network(fixs.HomeLogo,width: 40,height: 40,fit: BoxFit.contain)),
                              Expanded(flex: 3,child: Text(fixs.HomeTeam,
                                style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              )
                              ),
                              ///Maç Zamanı
                              Visibility(
                                visible: fixs.MatchResult==null||fixs.MatchResult=='null'? true:false,
                                child: Expanded(flex: 1,
                                  child: Text(fixs.MatchTime,style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,),
                                ),
                              ),
                              Visibility(
                                visible: fixs.MatchResult==null||fixs.MatchResult=='null'? false:true,
                                child: Expanded(flex: 1,
                                  child: Column(
                                    children: [
                                      Visibility(visible:fixs.MatchResult==null||fixs.MatchResult=='null'? false:fixs.MatchResult.substring(0,2)=='MS'||fixs.MatchResult.substring(0,2)=='IY'?false:true ,
                                          child: Text('Canlı',style: TextStyle(fontSize: 13,color: Color.fromARGB(227, 7, 249, 136 )),)
                                      ),
                                      Visibility(visible:fixs.MatchResult==null||fixs.MatchResult=='null'? false:fixs.MatchResult.substring(0,2)=='MS'||fixs.MatchResult.substring(0,2)=='IY'?false:true,
                                        child: Text(fixs.MatchResult==null||fixs.MatchResult=='null'?'':fixs.MatchResult,style: TextStyle(color:Color.fromARGB(227, 7, 249, 136 ),fontSize: 18,fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,),
                                      ),
                                      Visibility(visible:fixs.MatchResult==null||fixs.MatchResult=='null'? true:fixs.MatchResult.substring(0,2)=='MS'||fixs.MatchResult.substring(0,2)=='IY'?true:false,
                                        child: Text(fixs.MatchResult==null||fixs.MatchResult=='null'?'':fixs.MatchResult,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ///Deplasman takımı
                              Expanded(flex: 3,child: Text(fixs.AwayTeam,
                                style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold,),
                                textAlign: TextAlign.right,
                              )
                              ),
                              Expanded(flex: 2,child: Image.network(fixs.AwayLogo,width: 40,height: 40,fit: BoxFit.contain,)),
                            ],
                          ),
                            ),
                          SizedBox(height: 10,),

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
