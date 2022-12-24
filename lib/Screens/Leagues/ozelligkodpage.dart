import 'package:fantasysuperlig/Screens/Leagues/ozelliggecis.dart';
import 'package:fantasysuperlig/Screens/Leagues/ozelliglerpage.dart';
import 'package:fantasysuperlig/Screens/Leagues/privateleaguepage.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import '../../Variables/global.dart' as global;
class OzelLigKodPage extends StatefulWidget {
  @override
  _OzelLigKodPageState createState() => _OzelLigKodPageState();
}

class _OzelLigKodPageState extends State<OzelLigKodPage> {

  TextEditingController _ozelligkodctrl=TextEditingController();
  int oid=1;
  String ligname='sa';
  String aciklama='asd';
  @override
  Widget build(BuildContext context) {
   // var data1=[];
   // data1=ModalRoute.of(context).settings.arguments;
   // oid=data1[0];
   // ligname=data1[1];
   // aciklama=data1[2];
    double uzunluk=MediaQuery.of(context).size.height;
    double genislik=MediaQuery.of(context).size.width;
    var data=[];
    data.add(oid);
    data.add(ligname);
    return WillPopScope(
      onWillPop: () {

        Navigator.push(context, MaterialPageRoute(builder: (context)=>OzelLigSplashScreen()));
      },
      child: Scaffold(
        appBar: AppBar(title: Text(ligname),
        leading: IconButton(icon: Icon(Icons.arrow_back,),onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder: (context)=>OzelLigSplashScreen() ));
        },),),
        body: Container(
          width: genislik,height: uzunluk,color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(aciklama),
              Container(alignment: Alignment.center,height: 50,width: genislik*.7,child: TextFormField(
                controller: _ozelligkodctrl,textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: 'Katılım kodunuzu giriniz',),
              ),),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () async{
                  await getOzelLigJoin(global.userid, oid, _ozelligkodctrl.text).then((value) {
                    global.ozelligjoin==0?
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(content: Text('hatalı kod'),);
                    }):Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>PrivateLeaguePage(),
                            settings: RouteSettings(arguments: data)
                        )
                    );
                  });
                },
                child: Container(width: 60,height: 40,color: Colors.green,
                  alignment: Alignment.center,
                  child: Text('Katıl',style: TextStyle(color: Colors.white),),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
