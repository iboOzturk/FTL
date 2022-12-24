import 'package:fantasysuperlig/Screens/Profil/profiledit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Variables/global.dart' as global;
import '../SettingPage.dart';



class Deneme extends StatefulWidget {
  Deneme({Key key}) : super(key: key);

  @override
  _DenemeState createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {

  @override
  Widget build(BuildContext context) {
    double genislik=MediaQuery.of(context).size.width;
    double uzunluk=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));

        },),
        title: Text('Profil',
          style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,),
        body: profileView()// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget profileView() {
    double genislik=MediaQuery.of(context).size.width;
    double uzunluk=MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[

        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10,0 ,30),
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                child: ClipOval(child: Image.asset('assets/images/FTLlogo.png', height: 150, width: 150, fit: BoxFit.contain,),),
              ),
             /* Positioned(bottom: 1, right: 1 ,child: Container(
                height: 40, width: 40,
                child: Icon(Icons.add_a_photo, color: Colors.white,),
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              )) */
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0,0 ,20),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(global.userName+' '+global.userSurname),
              IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilEditPage()));
              }, icon: Icon(Icons.edit))
            ],
          ),
        ),
        Expanded(child: Container(alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)]
              )
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(width: genislik*.7,height: uzunluk*.15,color: Colors.yellow,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(flex: 1,child: Text('Ad: '+global.userName,)),
                        Expanded(flex: 1,child: Text('Soyad: '+global.userSurname,)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(flex: 1,child: Text('Email: '+global.email)),
                        Expanded(flex: 2,child: Text('Fantezi Takım Adı: '+global.fantasyteamname))
                      ],
                    )
                  ],
                ),),
              ),Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(width: genislik*.7,height: uzunluk*.15,color: Colors.green,),
              ),Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(width: genislik*.7,height: uzunluk*.15,color: Colors.lightBlueAccent,),
              )
           /*   Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Name', style: TextStyle(color: Colors.white70),),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Email', style: TextStyle(color: Colors.white70),),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Type something about yourself', style: TextStyle(color: Colors.white70),),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Phone number', style: TextStyle(color: Colors.white70),),
                    ),
                  ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container( height: 70, width: 200,
                    child: Align(child: Text('Save', style: TextStyle(color: Colors.white70, fontSize: 20),),),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),)
                    ),
                  ),
                ),
              ) */
            ],
          ),
        ))
      ],
    );
  }
}