

import 'package:fantasysuperlig/Screens/Iletisim/iletisimpage.dart';
import 'package:fantasysuperlig/Screens/KurallarSartlar/kurallarsartlarpage.dart';
import 'package:fantasysuperlig/Screens/Logins/login.dart';
import 'package:fantasysuperlig/Screens/Logins/welcome.dart';
import 'package:fantasysuperlig/Screens/Profil/deneme.dart';
import 'package:fantasysuperlig/Screens/Profil/profiledit.dart';
import 'package:fantasysuperlig/Screens/Profil/profilepage.dart';
import 'package:fantasysuperlig/Screens/Yasal/yasalpage.dart';
import 'package:fantasysuperlig/Screens/bannerpage.dart';
import 'package:fantasysuperlig/Screens/fantezimenu.dart';
import 'package:fantasysuperlig/Services/api_service.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Variables/global.dart' as global;
import 'FTLOduller/ftlodullerpage.dart';
import 'Partnerler/partnerlerpage.dart';
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Giris _giris=Giris();
  @override
  void initState() {
    getProfileInfo();
   // bannergetir();
    super.initState();
  }
  Future<void> bannergetir() async{
    await getBanner(global.userid);
  }
  @override
  Widget build(BuildContext context) {
    return global.BannerID==0||global.BannerID==null?Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios,color: Colors.transparent,),
        title: Text('Diğer'),
        //backgroundColor:Color.fromARGB(255, 55, 0, 60 ) ,
        //backgroundColor:Color(0xFF3366FF),
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

      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height ,
         // color:  Color.fromARGB(255, 55, 0, 60 ),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/FTLBackground.png'),fit: BoxFit.fill),
            color:Color(0xFF3366FF),

          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                            title: Text(
                              'Çıkış yapmak istediğinizden emin misiniz ?',
                              textAlign: TextAlign.center,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                            content: Container(alignment: Alignment.center,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {

                                        _giris.signOut(global.userid).whenComplete(() {
                                          global.userid=0;
                                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
                                        });
                                       // Navigator.pushNamed(context, '/');

                                      },
                                      child: Container(
                                        width: 70,height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(25)
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Evet",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);

                                      },
                                      child: Container(
                                        width: 70,height: 30,
                                        decoration:BoxDecoration(
                                          color: Colors.red,
                                            borderRadius: BorderRadius.circular(25)
                                        ),

                                        child: Center(
                                          child: Text(
                                            "İptal",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))); }
                  );
                 // Navigator.pushNamed(context, '/');
                },
                child: Container(alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 15,right: 15),
                  padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width,height: 55,
                  //color: Color.fromARGB(240, 255, 40, 131 ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xFF00CCFF),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(child: Row(
                          children: [
                            Icon(Icons.logout,color: Colors.white,),
                            SizedBox(width: 10,),
                            Text('Çıkış yap',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                          ],
                        )),
                        Icon(Icons.arrow_forward,color: Colors.white,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>Deneme()));
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilEditPage()));
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                },
                child: Container(alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 15,right: 15),
                  padding: EdgeInsets.only(left: 10),decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Row(
                              children: [
                                Icon(Icons.person),
                                SizedBox(width: 10,),
                                Text('Profilim',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                              ],
                            )
                        ),
                        Icon(Icons.arrow_forward,color: Colors.black,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100,),
              Container(
                alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15),
                  child: Text('Diğer',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),)
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PartnerlerPage()));
                },
                child: Container(alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 15,right: 15),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Partnerler',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                        Icon(Icons.arrow_forward,color: Colors.black,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>YasalPage()));

                },
                child: Container(alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 15,right: 15),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Yasal',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                        Icon(Icons.arrow_forward,color: Colors.black,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>IletisimPage()));

                },
                child: Container(alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 15,right: 15),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('İletişim',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                        Icon(Icons.arrow_forward,color: Colors.black,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>KurallarPage()));

                },
                child: Container(alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 15,right: 15),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Kurallar & Şartlar',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                        Icon(Icons.arrow_forward,color: Colors.black,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FTLOdullerPaqe()));

                },
                child: Container(alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 15,right: 15),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('FTL Ödüller Nasıl Kazanılır?',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                        Icon(Icons.arrow_forward,color: Colors.black,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    ):BannerPage();
  }
}
