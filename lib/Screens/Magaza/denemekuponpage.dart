import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
class DenemeKupon extends StatefulWidget {
  @override
  _DenemeKuponState createState() => _DenemeKuponState();
}

class _DenemeKuponState extends State<DenemeKupon> {
  kuponlarigetir kupon=kuponlarigetir();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: kupon.getCouponHistory(),
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
                  itemCount: kupon.kuponlar.length,
                  itemBuilder: (context,index){
                    var kupons=kupon.kuponlar[index];
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
                                        Expanded(flex: 7,
                                          child: Text(kupons.coupecode,
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
                                child: Text(kupons.creationdate.substring(0,10),
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
    );
  }
}
