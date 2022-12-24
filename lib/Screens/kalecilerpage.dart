/*

import '../Services/player_api.dart';
import 'package:flutter/material.dart';
import '../Variables/global.dart' as global;
import 'dart:convert';
import 'package:http/http.dart' as http;
class KaleciPage extends StatefulWidget {
  @override
  _KaleciPageState createState() => _KaleciPageState();
}

class _KaleciPageState extends State<KaleciPage> {


  @override
  void initState(){
    super.initState();

  }
  int i;
  String kontrol;
  String kontrol2;
  String kontrol3;
  String kontrol4;

  String hatamsj='Yetersiz bakiye...';
  String basarilimsj='İşlem Başarılı...';
  String position;
  String neresi;
  String p;
  int playerid;
  @override
  Widget build(BuildContext context) {
    var data=[];
    data=ModalRoute.of(context).settings.arguments;
    position=data[0];
    neresi=data[1];
   /* i=data[0];
    kontrol=data[1];
    kontrol2=data[2];
    kontrol3=data[3];
    kontrol4=data[4]; */
    return Scaffold(
      body: FutureBuilder(
          future: getPlayers(position),
          builder: (BuildContext context,AsyncSnapshot snapshot){

            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context,int index){

                    if(snapshot.data[index].Position=='0'){ p='Kaleci';}
                    if(snapshot.data[index].Position=='1'){p='Defans';}
                    if(snapshot.data[index].Position=='2'){p='Orta Saha';}
                    if(snapshot.data[index].Position=='3'){p='Forvet';}
                    ///snapshot.data[index].pozisyon=='Defans'
                    return Card(color: Colors.amber,
                      child:  ListTile(
                        title: Text(snapshot.data[index].PlayerShortName==null?'boş':snapshot.data[index].PlayerShortName),
                        subtitle: Text(snapshot.data[index].Position==null?'Boş':p),
                        trailing: Text(snapshot.data[index].Value==null?'BOŞ':snapshot.data[index].Value+'M\$'),
                        onTap: () async{
                          playerid=snapshot.data[index].PlayerID;
                          await playerChange(neresi, playerid);
                          debugPrint('oyuncudeğiş ekranı hata mesajı: '+global.hatamsj.toString());
                          return   showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                    title: Text(
                                      snapshot.data[index].PlayerShortName+' kadrona dahil etmek istiyor musun?',
                                      textAlign: TextAlign.center,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                    content: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                if(global.hatamsj==11){
                                                  return   showDialog(
                                                      context: context,
                                                      builder: (BuildContext context){
                                                        return AlertDialog(backgroundColor: Colors.red.shade700,
                                                            title: Text(
                                                              "Seçilen oyuncuyu almak için bütçeniz yeterli değil",style: TextStyle(
                                                              color: Colors.white
                                                            ),
                                                              textAlign: TextAlign.center,
                                                            ),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius.all(Radius.circular(8.0))),
                                                            content: Container(
                                                                height: 30,
                                                                decoration: BoxDecoration(
                                                                  color: Colors.red.shade700,
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment.center,
                                                                  children: <Widget>[

                                                                    GestureDetector(
                                                                      onTap: () {
                                                                        Navigator.pop(context);
                                                                        Navigator.pop(context);
                                                                        //Navigator.pop(context);
                                                                      },
                                                                      child: Text(
                                                                        "Tamam",
                                                                        style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ))); }
                                                  );
                                                }
                                                else if(global.hatamsj==12){
                                                  return   showDialog(
                                                      context: context,
                                                      builder: (BuildContext context){
                                                        return AlertDialog(backgroundColor: Colors.red.shade700,
                                                            title: Text(
                                                              "Bir Takımdan sadece 3 kişi seçebilirsin",style: TextStyle(
                                                                color: Colors.white
                                                            ),
                                                              textAlign: TextAlign.center,
                                                            ),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius.all(Radius.circular(8.0))),
                                                            content: Container(
                                                                height: 30,
                                                                decoration: BoxDecoration(
                                                                  color: Colors.red.shade700,
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment.center,
                                                                  children: <Widget>[

                                                                    GestureDetector(
                                                                      onTap: () {
                                                                        Navigator.pop(context);
                                                                        Navigator.pop(context);
                                                                        //Navigator.pop(context);
                                                                      },
                                                                      child: Text(
                                                                        "Tamam",
                                                                        style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ))); }
                                                  );
                                                }
                                                else{
                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Başarılı...')));
                                                  Navigator.pushNamed(context, '/createteam');
                                                }
                                              },
                                              child: Text(
                                                "Tamam",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Vazgeç",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ))); }
                          );
                         // Navigator.pushNamed(context, '/deneme2');

                          /*
                          if(kontrol!=snapshot.data[index].oyuncuAdi && kontrol2!=snapshot.data[index].oyuncuAdi&&kontrol3!=snapshot.data[index].oyuncuAdi&&kontrol4!=snapshot.data[index].oyuncuAdi){
                            if(i==1){
                              global.defans1=snapshot.data[index].oyuncuAdi;
                              global.pozisyon=snapshot.data[index].pozisyon;
                              global.degeri=snapshot.data[index].degeri;
                            }
                            else if(i==2){
                              global.defans2=snapshot.data[index].oyuncuAdi;
                              global.pozisyon=snapshot.data[index].pozisyon;
                              global.degeri=snapshot.data[index].degeri;
                            }else if(i==3){
                              global.defans3=snapshot.data[index].oyuncuAdi;
                              global.pozisyon=snapshot.data[index].pozisyon;
                              global.degeri=snapshot.data[index].degeri;
                            }
                            else{
                              global.defans4=snapshot.data[index].oyuncuAdi;
                              global.pozisyon=snapshot.data[index].pozisyon;
                              global.degeri=snapshot.data[index].degeri;
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>YeniHomePage()));}
                          else{
                            debugPrint(snapshot.data[index].oyuncuAdi+ ' u seçemezsin');
                          }
                       */ },
                      ),
                    );

                  }
              );
            }else if(snapshot.hasError){
              return Center(child: Text('${snapshot.error}'));
            }
            return CircularProgressIndicator();
          }

      ),
    );
  }
}
*/