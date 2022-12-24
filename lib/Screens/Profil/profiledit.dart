import '/Screens/KVKKWeb/kvkkwebpage.dart';

import '../MenuPage.dart';
import '/Screens/Profil/deneme.dart';
import '/Screens/Profil/profilephoto.dart';
import '/Screens/SettingPage.dart';
import '/Services/player_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Variables/global.dart' as global;
import 'dart:async';


class ProfilEditPage extends StatefulWidget {
  ProfilEditPage({Key key}) : super(key: key);

  @override
  _ProfilEditPageState createState() => _ProfilEditPageState();
}

class _ProfilEditPageState extends State<ProfilEditPage> {
  bool adbool = true;
  bool soyadbool = true;
  bool ftabool = false;
  bool emailbool = true;
  bool telnobool = true;
  bool adresbool = true;
  bool dogumcins = true;
  String dogumyili;
  int cinsiyet=3;
  String beden='';
  int favteamid=0;

  TextEditingController isimctrl = TextEditingController();
  TextEditingController soyisimctrl = TextEditingController();
  TextEditingController ftactrl = TextEditingController();
  TextEditingController telnoctrl = TextEditingController();
  TextEditingController adresctrl = TextEditingController();
  TextEditingController yilctrl = TextEditingController();
  TextEditingController ayctrl = TextEditingController();
  TextEditingController gunctrl = TextEditingController();
  bool _validateisim=false;
  bool _validatesoyisim=false;
  bool _validatefta=false;
  bool _validatetelno=false;
  bool _validatedogumyil = false;
  bool _validatedogumay = false;
  bool _validatedogumgun = false;
  @override
  void initState() {
    // TODO: implement initState

    _refreshData2();
    super.initState();
  }
  Future<Null> _refreshData2() async {
    await Future.delayed(Duration(milliseconds: 100));

    //getCaptains(global.userid);
    await getProfileInfo();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery
        .of(context)
        .size
        .width;
    double uzunluk = MediaQuery
        .of(context)
        .size
        .height;
    dogumyili= yilctrl.text+'-'+ayctrl.text+'-'+gunctrl.text;
    // erkek==true?cinsiyet='1':kadin==true?cinsiyet='0':cinsiyet='3';
    //  s==true?beden='S':m==true?beden='M':l==true?beden='L':xl==true?beden='XL':beden='XXL';



    return WillPopScope(
      onWillPop: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()
        ));
        //Navigator.pushNamed(context, '/menu');
      },
      child: Scaffold(

          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()
                ));
                //Navigator.pushNamed(context, '/menu');
              },),
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
            title: Text('Profil',
              style: TextStyle(color: Colors.black),),
          ),
          body:


          Container(
            width: genislik, height: uzunluk,
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
            child: Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(backgroundColor: Colors.green,
                        radius: 70,
                        child: ClipOval(
                          //child: Image.asset('assets/images/FTLlogo.png', height: 150, width: 150, fit: BoxFit.contain,),

                          child: Icon(
                            Icons.person, size: 124, color: Colors.white,),
                        ),
                      ),
                      /*   Positioned(bottom: 1, right: 1 ,child: InkWell(
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePhotoPage()));
                           },
                           child: Container(
                      height: 40, width: 40,
                      child: Icon(Icons.edit, color: Colors.white,),
                      decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                    ),
                         )) */
                    ],
                  ),
                ),
                Expanded(child: Container(alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[

                        ///ad
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),

                          child: Column(
                            children: [
                              Container(alignment: Alignment.centerLeft,
                                  child: Text('Ad: ', style: TextStyle(
                                      color: Colors.grey.shade700),)),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Container(width: genislik * .8,
                                      child: TextFormField(
                                        controller: isimctrl,
                                        onEditingComplete: () {
                                          setState(() {
                                            adbool = true;
                                          });
                                        },
                                        onTap: () {
                                          setState(() {
                                            adbool == true
                                                ? adbool = false
                                                : null;
                                            adbool == false
                                                ? soyadbool = true
                                                : null;
                                            adbool == false
                                                ? ftabool = true
                                                : null;
                                            adbool == false
                                                ? emailbool = true
                                                : null;
                                            adbool == false
                                                ? telnobool = true
                                                : null;
                                            adbool == false
                                                ? adresbool = true
                                                : null;
                                          });
                                        },
                                        keyboardType: TextInputType.name,
                                        cursorColor: Colors.black,
                                        style: TextStyle(color: Colors.black),
                                        readOnly: adbool,
                                        //enabled: adbool,

                                        decoration: InputDecoration(
                                          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                          //hintText: global.userName,
                                          hintText: global.pName,
                                          hintStyle: TextStyle(
                                              color: Colors.black),
                                          //labelText: 'Fantasy Takım Adı*',labelStyle: TextStyle(color: Colors.white),
                                          errorText: _validateisim?'Lütfen adınızı giriniz':null,

                                        ),
                                      ),
                                    ),
                                  ),
                                  /*    Expanded(
                                      flex: 1,
                                      child: IconButton(icon: Icon(
                                        isimctrl.text.length<2?Icons.close:
                                          adbool == false ? Icons.edit : Icons
                                              .done),
                                        color: adbool == false
                                            ? Colors.black
                                            : Colors.blue,
                                        onPressed: () {

                                        },),
                                    ), */
                                ],
                              ),
                            ],
                          ),
                        ),

                        ///soyad
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),

                          child: Column(
                            children: [
                              Container(alignment: Alignment.centerLeft,
                                  child: Text('Soyad: ', style: TextStyle(
                                      color: Colors.grey.shade700),)),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Container(
                                      width: genislik * .8,
                                      child: TextFormField(
                                        onEditingComplete: () {
                                          setState(() {
                                            soyadbool = true;
                                          });
                                        },
                                        controller: soyisimctrl,
                                        onTap: () {
                                          setState(() {
                                            soyadbool == true ?
                                            soyadbool = false : null;

                                            soyadbool == false
                                                ? adbool = true
                                                : null;

                                            soyadbool == false
                                                ? ftabool = true
                                                : null;

                                            soyadbool == false ?
                                            emailbool = true : null;

                                            soyadbool == false ?
                                            telnobool = true : null;

                                            soyadbool == false ?
                                            adresbool = true : null;
                                          });
                                        },
                                        keyboardType: TextInputType.name,
                                        cursorColor: Colors.black,
                                        style: TextStyle(color: Colors.black),
                                        // enabled: soyadbool,
                                        readOnly: soyadbool,
                                        decoration: InputDecoration(

                                          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                          // hintText: global.userSurname,
                                          hintText: global.pSurname,
                                          hintStyle: TextStyle(
                                              color: Colors.black),
                                          //labelText: 'Fantasy Takım Adı*',labelStyle: TextStyle(color: Colors.white),
                                          errorText: _validatesoyisim?'Lütfen soyadınızı adınızı giriniz':null,

                                        ),
                                      ),
                                    ),
                                  ),
                                  /*   Expanded(
                                      flex: 1,
                                      child: IconButton(icon: Icon(
                                          soyadbool == false ? Icons.edit : Icons
                                              .done),
                                        color: soyadbool == false
                                            ? Colors.black
                                            : Colors.blue,
                                        onPressed: () {
                                          /* setState(() {
                                          soyadbool==true?soyadbool=false:soyadbool==false?soyadbool=true:null;
                                        }); */
                                        },),
                                    ), */
                                ],
                              ),
                            ],
                          ),
                        ),

                        ///Fantezi Takım Adı
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                          child: Column(
                            children: [
                              Container(alignment: Alignment.centerLeft,
                                  child: Text('Fantezi Takım Adı: ',
                                    style: TextStyle(
                                        color: Colors.grey.shade700),)),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Container(
                                      width: genislik * .8,
                                      child: TextFormField(
                                        controller: ftactrl,
                                        onEditingComplete: () {
                                          setState(() {
                                            ftabool = true;
                                          });
                                        },
                                        onTap: () {
                                          setState(() {
                                            ftabool == true
                                                ? ftabool = false
                                                : null;
                                            ftabool == false
                                                ? adbool = true
                                                : null;
                                            ftabool == false
                                                ? soyadbool = true
                                                : null;
                                            ftabool == false
                                                ? emailbool = true
                                                : null;
                                            ftabool == false
                                                ? telnobool = true
                                                : null;
                                            ftabool == false
                                                ? adresbool = true
                                                : null;
                                          });
                                        },
                                        enabled: false,
                                        keyboardType: TextInputType.name,
                                        cursorColor: Colors.black,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(

                                          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                          //hintText: global.fantasyteamname,
                                            hintText: global.pFTA,
                                            hintStyle: TextStyle(
                                                color: Colors.black)
                                          //labelText: 'Fantasy Takım Adı*',labelStyle: TextStyle(color: Colors.white),
                                          // errorText: _validatefta?'Lütfen Fantezi takım adınızı giriniz':null,

                                        ),
                                      ),
                                    ),
                                  ),
                                  /*  Expanded(
                                      flex: 1,
                                      child: IconButton(icon: Icon(
                                          ftabool == false ? Icons.edit : Icons
                                              .done),
                                        color: ftabool == false
                                            ? Colors.black
                                            : Colors.blue,
                                        onPressed: () {},),
                                    ), */
                                ],
                              ),
                            ],
                          ),
                        ),

                        ///email
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),

                          child: Column(
                            children: [
                              Container(alignment: Alignment.centerLeft,
                                  child: Text('Email: ', style: TextStyle(
                                      color: Colors.grey.shade700),)),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Container(width: genislik * .8,
                                      child: TextFormField(

                                        //  controller: fantasytakimadictrl,
                                        enabled: !emailbool,
                                        //readOnly: emailbool,
                                        keyboardType: TextInputType.name,
                                        cursorColor: Colors.black,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(

                                          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                            hintText: global.Email,
                                            hintStyle: TextStyle(
                                                color: Colors.black)
                                          //labelText: 'Fantasy Takım Adı*',labelStyle: TextStyle(color: Colors.white),
                                          // errorText: _validatefta?'Lütfen Fantezi takım adınızı giriniz':null,

                                        ),
                                      ),
                                    ),
                                  ),
                                  /*  Expanded(
                                      flex: 1,
                                      child: IconButton(icon: Icon(
                                          emailbool == false ? Icons.edit : Icons
                                              .done),
                                        color: emailbool == false
                                            ? Colors.black
                                            : Colors.blue,
                                        onPressed: () {

                                        },),
                                    ),*/
                                ],
                              ),
                            ],
                          ),
                        ),

                        ///Beden
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),

                          child: Column(
                            children: [
                              Container(alignment: Alignment.centerLeft,
                                  child: Text('Beden: ', style: TextStyle(
                                      color: Colors.grey.shade700),)),

                              Container(
                                height: 60,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Expanded(
                                          flex: 10
                                          , child: InkWell(onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                  backgroundColor: Color(
                                                      0xFF3366FF),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.all(Radius
                                                          .circular(8.0))),
                                                  title: Container(
                                                      alignment: Alignment
                                                          .center,
                                                      child: Text('Beden',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .white),)),
                                                  content: Container(
                                                      height: 275,
                                                      decoration: BoxDecoration(
                                                        color: Color(
                                                            0xFF3366FF),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: <Widget>[

                                                          GestureDetector(
                                                            onTap: () async {
                                                              setState(() {
                                                                beden='S';
                                                              });
                                                              Navigator.pop(context);
                                                              //  Navigator.pushNamed(context, '/menu');
                                                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>StatisticsPage()));

                                                            },
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .center,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xFF00CCFF),
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15)
                                                              ),
                                                              width: 180,
                                                              height: 40,
                                                              child: Text(
                                                                "S",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    fontSize: 20),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 15,),
                                                          GestureDetector(
                                                            onTap: () async {
                                                              setState(() {
                                                                beden='M';
                                                              });
                                                              Navigator.pop(context);
                                                            },
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .center,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xFF00CCFF),
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15)
                                                              ),
                                                              width: 180,
                                                              height: 40,
                                                              child: Text(
                                                                "M",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    fontSize: 20),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 15,),

                                                          GestureDetector(
                                                            onTap: () async {
                                                              setState(() {
                                                                beden='L';
                                                              });
                                                              Navigator.pop(context);
                                                            },
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .center,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xFF00CCFF),
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15)
                                                              ),
                                                              width: 180,
                                                              height: 40,
                                                              child: Text(
                                                                "L",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    fontSize: 20),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 15,),
                                                          GestureDetector(
                                                            onTap: () async {
                                                              setState(() {
                                                                beden='XL';
                                                              });
                                                              Navigator.pop(context);
                                                            },
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .center,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xFF00CCFF),
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15)
                                                              ),
                                                              width: 180,
                                                              height: 40,
                                                              child: Text(
                                                                "XL",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    fontSize: 20),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 15,),
                                                          GestureDetector(
                                                            onTap: () async {
                                                              setState(() {
                                                                beden='XXL';
                                                              });
                                                              Navigator.pop(context);
                                                            },
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .center,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xFF00CCFF),
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15)
                                                              ),
                                                              width: 180,
                                                              height: 40,
                                                              child: Text(
                                                                "XXL",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    fontSize: 20),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 15,),

                                                        ],
                                                      )));
                                            }
                                        );
                                      }
                                          ,
                                          child: Text(beden=='S'?'S':beden=='M'?'M':beden=='L'?'L':beden=='XL'?'XL':beden=='XXL'?'XXL':global.pBeden==null||global.pBeden=='null'?'Beden bilginizi giriniz':global.pBeden, style: TextStyle(
                                              color: Colors.black),))),
                                      /*    Expanded(
                                          flex: 1,
                                          child: IconButton(icon: Icon(
                                              dogumcins == false
                                                  ? Icons.edit
                                                  : Icons.done),
                                            color: Colors.black,
                                            onPressed: () {

                                            },),
                                        ) */
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20)),),
                              ),
                            ],
                          ),
                        ),

                        ///Favori Takım
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),

                          child: Column(
                            children: [
                              Container(alignment: Alignment.centerLeft,
                                  child: Text('Favori Takım: ', style: TextStyle(
                                      color: Colors.grey.shade700),)),

                              Container(
                                height: 60,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Expanded(
                                          flex: 10
                                          , child: InkWell(onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context){
                                              return AlertDialog(backgroundColor: Color(0xFF3366FF),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.all(Radius.circular(16.0))),
                                                content: Container(
                                                  height: 279,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                          height: 250,
                                                          decoration: BoxDecoration(
                                                              color: Color(0xFF3366FF)
                                                          ),
                                                          child: SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.center,
                                                              children: <Widget>[

                                                                GestureDetector(
                                                                  onTap: () async{

                                                                    await setState(()  {
                                                                      favteamid=20;
                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "ADS",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: () async{


                                                                    await setState(()  {
                                                                      favteamid=18;
                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "ALT",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: () async{


                                                                    await setState(()  {
                                                                      favteamid=1;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "ALY",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: () async{


                                                                    await setState(()  {
                                                                      favteamid=13;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "ANT",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: () async{


                                                                    await setState(()  {
                                                                      favteamid=9;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "BFK",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),

                                                                GestureDetector(
                                                                  onTap: ()async {


                                                                    await setState(()  {
                                                                      favteamid=2;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "BJK",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),

                                                                GestureDetector(
                                                                  onTap: ()async {


                                                                    await setState(()  {
                                                                      favteamid=14;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "ÇRS",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: ()async {


                                                                    await setState(()  {
                                                                      favteamid=4;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "FB",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: ()async {


                                                                    await setState(()  {
                                                                      favteamid=3;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "FKG",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: ()async {


                                                                    await setState(()  {
                                                                      favteamid=6;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "GFK",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: ()async {


                                                                    await setState(()  {
                                                                      favteamid=7;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "GÖZ",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: ()async {


                                                                    await setState(()  {
                                                                      favteamid=19;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "GRS",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: ()async {


                                                                    await setState(()  {
                                                                      favteamid=5;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "GS",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),

                                                                GestureDetector(
                                                                  onTap: ()async {


                                                                    await setState(()  {
                                                                      favteamid=8;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "HAT",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: ()async {


                                                                    await setState(()  {
                                                                      favteamid=10;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "KAS",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: ()async {


                                                                    await setState(()  {
                                                                      favteamid=12;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "KON",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: ()async {


                                                                    await setState(()  {
                                                                      favteamid=11;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "KS",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: ()async {


                                                                    await setState(()  {
                                                                      favteamid=15;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "SS",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: ()async {


                                                                    await setState(()  {
                                                                      favteamid=16;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),width: 150,height: 30,
                                                                    child: Text(
                                                                      "TS",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 15,),
                                                                GestureDetector(
                                                                  onTap: ()async {


                                                                    await setState(()  {
                                                                      favteamid=17;

                                                                      //     global.selectIndex=1;
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Container(
                                                                    alignment: Alignment.center,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(0xFF00CCFF),
                                                                        borderRadius: BorderRadius.circular(15)
                                                                    ),
                                                                    width: 150,height: 30,
                                                                    child: Text(
                                                                      "YMS",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,fontSize: 20),
                                                                    ),
                                                                  ),
                                                                ),

                                                              ],
                                                            ),
                                                          )),
                                                      Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,size: 29,)
                                                    ],
                                                  ),
                                                ),

                                              ); }
                                        );
                                      }
                                          ,
                                          child: Text(global.pFavTakim==null?'':
                                          favteamid!=0?favteamid==1?'ALY':favteamid==2?'BJK':favteamid==3?'FKG':favteamid==4?'FB':
                                          favteamid==5?'GS':favteamid==6?'GFK':favteamid==7?'GÖZ':favteamid==8?'HAT':favteamid==9?'BFK':
                                          favteamid==10?'KAS':favteamid==11?'KS':favteamid==12?'KON':favteamid==13?'ANT':
                                          favteamid==14?'ÇRS':favteamid==15?'SS':favteamid==16?'TS':favteamid==17?'YMS':favteamid==18?'ALT':
                                          favteamid==19?'GRS':favteamid==20?'ADS':global.pFavTakim:global.pFavTakim, style: TextStyle(
                                              color: Colors.black),))),
                                      /* Expanded(
                                          flex: 1,
                                          child: IconButton(icon: Icon(
                                              dogumcins == false
                                                  ? Icons.edit
                                                  : Icons.done),
                                            color: Colors.black,
                                            onPressed: () {

                                            },),
                                        ) */
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20)),),
                              ),
                            ],
                          ),
                        ),

                        ///Cinsiyet
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),

                          child: Column(
                            children: [
                              Container(alignment: Alignment.centerLeft,
                                  child: Text('Cinsiyet: ', style: TextStyle(
                                      color: Colors.grey.shade700),)),

                              Container(
                                height: 60,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Expanded(
                                          flex: 10
                                          , child: InkWell(onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                  backgroundColor: Color(
                                                      0xFF3366FF),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.all(Radius
                                                          .circular(8.0))),
                                                  title: Container(
                                                      alignment: Alignment
                                                          .center,
                                                      child: Text('Cinsiyet',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .white),)),
                                                  content: Container(
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                        color: Color(
                                                            0xFF3366FF),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: <Widget>[

                                                          GestureDetector(
                                                            onTap: ()  {
                                                              setState(() {
                                                                cinsiyet=0;
                                                              });
                                                              Navigator.pop(context);
                                                              //  Navigator.pushNamed(context, '/menu');
                                                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>StatisticsPage()));

                                                            },
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .center,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xFF00CCFF),
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15)
                                                              ),
                                                              width: 180,
                                                              height: 40,
                                                              child: Text(
                                                                "Kadın",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    fontSize: 20),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 15,),
                                                          GestureDetector(
                                                            onTap: () async {
                                                              setState(() {
                                                                cinsiyet=1;
                                                              });
                                                              Navigator.pop(context);
                                                            },
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .center,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xFF00CCFF),
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15)
                                                              ),
                                                              width: 180,
                                                              height: 40,
                                                              child: Text(
                                                                "Erkek",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    fontSize: 20),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 15,),

                                                          GestureDetector(
                                                            onTap: () async {
                                                              setState(() {
                                                                cinsiyet=2;
                                                              });
                                                              Navigator.pop(context);
                                                            },
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .center,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xFF00CCFF),
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15)
                                                              ),
                                                              width: 180,
                                                              height: 40,
                                                              child: Text(
                                                                "Belirtilmemiş",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    fontSize: 20),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      )));
                                            }
                                        );
                                      }
                                          ,
                                          child: Text(cinsiyet==0?'Kadın':cinsiyet==1?'Erkek':cinsiyet==2?'Belirtilmemiş':global.pCinsiyet==0?'Kadın':global.pCinsiyet==1?'Erkek':global.pCinsiyet==2?'Belirtilmemiş':'Cinsiyetinizi seçiniz', style: TextStyle(
                                              color: Colors.black),))),
                                      /*     Expanded(
                                          flex: 1,
                                          child: IconButton(icon: Icon(
                                              dogumcins == false
                                                  ? Icons.edit
                                                  : Icons.done),
                                            color: Colors.black,
                                            onPressed: () {

                                            },),
                                        ) */
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20)),),
                              ),
                            ],
                          ),
                        ),

                        ///Dogum Tarihi
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),

                          child: Column(
                            children: [
                              Container(alignment: Alignment.centerLeft,
                                  child: Text('Doğum Tarihi: ',
                                    style: TextStyle(
                                        color: Colors.grey.shade700),)),
                              Container(
                                height: 60,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Expanded(flex: 10,
                                          child: InkWell(onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (
                                                    BuildContext context) {
                                                  return AlertDialog(backgroundColor: Color(0xFF3366FF),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.all(Radius.circular(8.0))),
                                                      title: Container(alignment: Alignment.center,
                                                          child: Text('Doğum Tarihi',style: TextStyle(color: Colors.white),)),
                                                      content:Container(
                                                        height: 134,
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Container(width: 80,child: TextFormField(
                                                                  keyboardType: TextInputType.datetime,
                                                                  inputFormatters: <TextInputFormatter>[
                                                                    FilteringTextInputFormatter.digitsOnly
                                                                  ],
                                                                  controller: gunctrl,
                                                                  cursorColor: Colors.white,
                                                                  style: TextStyle(color: Colors.white),
                                                                  decoration: InputDecoration(
                                                                    enabledBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        borderSide: BorderSide(color: Colors.white,width: 2)
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        borderSide: BorderSide(color: Colors.green.shade600,width: 2)
                                                                    ),
                                                                    labelText: 'Gün',labelStyle: TextStyle(color: Colors.white),
                                                                    errorText: _validatedogumgun?'Lütfen gün\'ü giriniz':null,

                                                                  ),
                                                                ),),
                                                                Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: Text('/',style: TextStyle(color: Colors.white,fontSize: 16),),
                                                                ),
                                                                Container(width: 80,child: TextFormField(
                                                                  keyboardType: TextInputType.datetime,
                                                                  inputFormatters: <TextInputFormatter>[
                                                                    FilteringTextInputFormatter.digitsOnly
                                                                  ],
                                                                  controller: ayctrl,
                                                                  cursorColor: Colors.white,
                                                                  style: TextStyle(color: Colors.white),
                                                                  decoration: InputDecoration(
                                                                    enabledBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        borderSide: BorderSide(color: Colors.white,width: 2)
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        borderSide: BorderSide(color: Colors.green.shade600,width: 2)
                                                                    ),
                                                                    // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                                                    labelText: 'Ay',labelStyle: TextStyle(color: Colors.white),
                                                                    errorText: _validatedogumay?'Lütfen ay\'ı giriniz':null,

                                                                  ),
                                                                ),),
                                                                Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: Text('/',style: TextStyle(color: Colors.white,fontSize: 16),),
                                                                ),
                                                                Container(width: 80,child: TextFormField(
                                                                  controller: yilctrl,
                                                                  inputFormatters: <TextInputFormatter>[
                                                                    FilteringTextInputFormatter.digitsOnly
                                                                  ],
                                                                  keyboardType: TextInputType.datetime,
                                                                  cursorColor: Colors.white,
                                                                  style: TextStyle(color: Colors.white),
                                                                  decoration: InputDecoration(
                                                                    enabledBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        borderSide: BorderSide(color: Colors.white,width: 2)
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        borderSide: BorderSide(color: Colors.green.shade600,width: 2)
                                                                    ),
                                                                    labelText: 'Yıl',labelStyle: TextStyle(color: Colors.white),
                                                                    errorText: _validatedogumyil?'Lütfen yılı\'ı giriniz':null,
                                                                  ),
                                                                ),),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(16.0),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    dogumyili= yilctrl.text+'-'+ayctrl.text+'-'+gunctrl.text;
                                                                  });
                                                                  Navigator.pop(context);
                                                                },
                                                                child: Container(alignment: Alignment.center,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(15),
                                                                    color: Colors.green,
                                                                  ),
                                                                  width: 70,height: 40,
                                                                  child: Text('Kaydet',style: TextStyle(color: Colors.white),),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ));
                                                }
                                            );
                                          },
                                              child: Text(dogumyili!='--'?dogumyili:global.BirthDate.substring(0,10)=='1900-01-01'?'Doğum Tarihini giriniz': global.BirthDate==null?'Doğum Tarihinizi giriniz.' :global.BirthDate.substring(0,10),
                                                style: TextStyle(
                                                    color: Colors.black),))),
                                      /*    Expanded(
                                          flex: 1,
                                          child: IconButton(icon: Icon(
                                              dogumcins == false
                                                  ? Icons.edit
                                                  : Icons.done),
                                            color: Colors.black,
                                            onPressed: () {

                                            },),
                                        ) */
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20))),
                              ),
                            ],
                          ),
                        ),

                        ///telefon no
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),

                          child: Column(
                            children: [
                              Container(alignment: Alignment.centerLeft,
                                  child: Text('Telefon Numarası: ',
                                    style: TextStyle(
                                        color: Colors.grey.shade700),)),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Container(
                                      width: genislik * .8,
                                      child: TextFormField(
                                         maxLength: 10 ,
                                        controller: telnoctrl,
                                        onEditingComplete: () {
                                          setState(() {
                                            telnobool = true;
                                          });
                                        },
                                        /*  onTap: () {
                                            setState(() {
                                              telnobool == true ?
                                              telnobool = false : null;
                                              telnobool == false
                                                  ? adbool = true
                                                  : null;
                                              telnobool == false ?
                                              soyadbool = true : null;
                                              telnobool == false
                                                  ? ftabool = true
                                                  : null;
                                              telnobool == false ?
                                              emailbool = true : null;
                                              telnobool == false ?
                                              adresbool = true : null;
                                            });
                                          }, */
                                        // readOnly: telnobool,
                                        // enabled: !telnobool,
                                        keyboardType: TextInputType.name,
                                        cursorColor: Colors.black,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(

                                          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                            hintText: telnoctrl.text.isNotEmpty?telnoctrl.text:global.Tel=='null'||global.Tel==null?'Telefon Numaranızı giriniz':global.Tel,
                                            hintStyle: TextStyle(
                                                color: Colors.black)
                                          //labelText: 'Fantasy Takım Adı*',labelStyle: TextStyle(color: Colors.white),
                                          // errorText: _validatefta?'Lütfen Fantezi takım adınızı giriniz':null,

                                        ),
                                      ),
                                    ),
                                  ),
                                  /*   Expanded(
                                      flex: 1,
                                      child: IconButton(icon: Icon(
                                          telnobool == false ? Icons.edit : Icons
                                              .done),
                                        color: telnobool == false
                                            ? Colors.black
                                            : Colors.blue,
                                        onPressed: () {

                                        },),
                                    ), */
                                ],
                              ),
                            ],
                          ),
                        ),

                        ///adres
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                          child: Column(
                            children: [
                              Container(alignment: Alignment.centerLeft,
                                  child: Text('Adres: ', style: TextStyle(
                                      color: Colors.grey.shade700),)),

                              Row(
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Container(
                                      width: genislik * .8,
                                      child: TextFormField(
                                        controller: adresctrl,
                                        onEditingComplete: () {
                                          setState(() {
                                            adresbool = true;
                                          });
                                        },
                                        onTap: () {
                                          setState(() {
                                            adresbool == true ?
                                            adresbool = false : null;
                                            adresbool == false
                                                ? adbool = true
                                                : null;
                                            adresbool == false ?
                                            soyadbool = true : null;
                                            adresbool == false
                                                ? ftabool = true
                                                : null;
                                            adresbool == false ?
                                            emailbool = true : null;
                                            adresbool == false ?
                                            telnobool = true : null;
                                          });
                                        },
                                        readOnly: adresbool,
                                        keyboardType: TextInputType.name,
                                        cursorColor: Colors.black,
                                        maxLines: 5,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(

                                          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                          hintText: adresctrl.text.isNotEmpty?adresctrl.text:global.pAdres=='null'||global.pAdres==null?'Hediye Adresi girilmemiştir': global.pAdres,
                                          hintStyle: TextStyle(
                                              color: Colors.black),
                                          //labelText: 'Fantasy Takım Adı*',labelStyle: TextStyle(color: Colors.white),
                                          // errorText: _validatefta?'Lütfen Fantezi takım adınızı giriniz':null,

                                        ),
                                      ),
                                    ),
                                  ),
                                  /* Expanded(flex: 1,
                                      child: IconButton(icon: Icon(
                                          adresbool == false ? Icons.edit : Icons
                                              .done),
                                        color: adresbool == false
                                            ? Colors.black
                                            : Colors.blue,
                                        onPressed: () {

                                        },),
                                    ), */
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text("*Buradaki bilgiler ödüllerin size ulaştırılması için gereklidir."),
                        Padding(
                          padding: const EdgeInsets.only(left:15.0,top:25,bottom:25,),
                          child: Container(alignment: Alignment.centerLeft,child: InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>KVKKWebPage()));},child: Text("*KVKK Aydınlatma Metni/Privacy Policy", style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue),))),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10),
                            child: Visibility(

                              ///false gizliyor
                              visible:
                              /* isimctrl.text.isEmpty&&soyisimctrl.text.isEmpty
                                    &&ftactrl.text.isEmpty&&telnoctrl.text.isEmpty
                                    &&adresctrl.text.isEmpty? */
                              // false  :
                              true,
                              child: InkWell(
                                onTap: () async{
                                  setState(() {
                                    isimctrl.text.length>0&&isimctrl.text.length<2 ?_validateisim=true:_validateisim=false;
                                  });
                                  setState(() {
                                    soyisimctrl.text.length>0&&soyisimctrl.text.length<2?_validatesoyisim=true:_validatesoyisim=false;
                                  });

                                  setState(() {
                                    telnoctrl.text.length>0&&telnoctrl.text.length!=10?_validatetelno=true:_validatetelno=false;
                                  });
                                  setState(() {
                                    ftactrl.text.length>0&&ftactrl.text.length<3?_validatefta=true:_validatefta=false;
                                  });
                                  setState(() {
                                    yilctrl.text.length>0&&int.parse(yilctrl.text)<1940?_validatedogumyil=true:_validatedogumyil=false;
                                  });
                                  setState(() {
                                    ayctrl.text.length>0&&int.parse(ayctrl.text)>=12?_validatedogumay=true:_validatedogumay=false;
                                  });
                                  setState(() {
                                    gunctrl.text.length>0&&int.parse(gunctrl.text)>=31?_validatedogumgun=true:_validatedogumgun=false;
                                  });

                                  if(_validateisim==true||_validatesoyisim==true||
                                      _validatetelno==true||_validatefta==true||
                                      _validatedogumyil==true||_validatedogumay||
                                      _validatedogumgun==true
                                  )
                                  {
                                    print('hataa');
                                  }
                                  else{

                                    await updateProfileInfo(
                                        isimctrl.text.isEmpty?global.pName:isimctrl.text,
                                        soyisimctrl.text.isEmpty?global.pSurname:soyisimctrl.text,
                                        beden==''?global.pBeden:beden ,
                                        adresctrl.text.isEmpty?global.pAdres:adresctrl.text ,
                                        cinsiyet==3?global.pCinsiyet:cinsiyet ,
                                        telnoctrl.text.isEmpty?global.Tel:telnoctrl.text,
                                        dogumyili=='--'?global.BirthDate==null?'1900-01-01':global.BirthDate:dogumyili,
                                        favteamid==0?global.pFavTakimId:favteamid
                                    );
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilEditPage()));
                                  }
                                },
                                child: Container(height: 70, width: 200,
                                  child: Align(child: Text('Kaydet',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),),),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          )
      ),
    );
  }

}
