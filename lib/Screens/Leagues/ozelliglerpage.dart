
import 'package:fantasysuperlig/Screens/Leagues/ozelligkodpage.dart';
import 'package:fantasysuperlig/Screens/Leagues/privateawardspage.dart';
import 'package:fantasysuperlig/Screens/Leagues/privateleaguepage.dart';
import 'package:fantasysuperlig/Screens/Magaza/kaptinkapitnpage.dart';
import 'package:fantasysuperlig/Screens/News/haberayrintipage.dart';
import 'package:fantasysuperlig/Screens/Oduller/newodullerpage.dart';
import 'package:fantasysuperlig/Screens/Oduller/odullerpage.dart';
import 'package:fantasysuperlig/Screens/Puanim/targetaylikpage.dart';
import 'package:fantasysuperlig/Screens/Puanim/targetpointpage.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../Variables/global.dart' as global;


class OzelLiglerPage extends StatefulWidget {
  @override
  _OzelLiglerPageState createState() => _OzelLiglerPageState();
}

class _OzelLiglerPageState extends State<OzelLiglerPage> {
  TextEditingController ozelligkodctrl=TextEditingController();
  bool enabled=true;
  //int sayac=0;
  // haberlerigetir haber=haberlerigetir();
  //liglerigetir lig=liglerigetir();
  ozelliglerigetir ozellig=ozelliglerigetir();
  @override
  void initState() {
    ozellig.ozelligler.clear();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    double genislik=MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        global.selectIndex=2;
        Navigator.pushNamed(context, '/menu');
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(icon:Icon(Icons.info),color: Colors.white,onPressed: () {
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(content: Text('Özel ligler, herkese açık ligler değildir. Kayıt olunabilmesi için katılım kodu girişi yapılması gerekir. Katılım kodlarının temini için özel liglere tıklayarak çıkan açıklamayı okuyunuz.'),);
              });
            },)
          ],
          leading: IconButton(onPressed: () {
            global.selectIndex=2;
            Navigator.pushNamed(context, '/menu');
          },icon: Icon(Icons.arrow_back),),
          centerTitle: true,title: Text('Özel Ligler'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/FTLBackground.png'),fit: BoxFit.fill),


            ),
          ),
          //backgroundColor:Color.fromARGB(255, 55, 0, 60 ) ,
        ),
        //backgroundColor: Color.fromARGB(255, 55, 0, 60 ),
        body: FutureBuilder(
            future: ozellig.ozelligler.length==0?ozellig.getOzelLigs():null,
            builder: (BuildContext context,AsyncSnapshot snapshot){


              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/FTLBackground.png'),fit: BoxFit.fill),

                ),
                child: ListView.builder(
                    itemCount: ozellig.ozelligler.length,
                    itemBuilder: (context,index){

                      var ozelligs=ozellig.ozelligler[index];


                      var data=[];
                      data.add(ozelligs.oid);
                      data.add(ozelligs.LeagueName);
                      data.add(ozelligs.Description);
                      return Column(
                        children: [
                          SizedBox(height: 20,),
                          AbsorbPointer(
                            absorbing: !enabled,
                            child: InkWell(

                               onTap: () async{

                                 setState(() {
                                   enabled=true;
                                 });

                                 getOzelState(global.userid, ozelligs.oid).then((value) {
                                  global.ozelligstate==0?
                                   //  Navigator.push(context, MaterialPageRoute(builder: (context)=>OzelLigKodPage(),))
                                      showDialog(context: context, builder: (BuildContext context){

                                        return AlertDialog(

                                          content: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(ozelligs.Description),
                                            Container(alignment: Alignment.center,height: 50,width: genislik-20,child: TextFormField(
                                              controller: ozelligkodctrl,textAlign: TextAlign.center,
                                              decoration: InputDecoration(hintText: 'Katılım kodunuzu giriniz',),
                                            ),),
                                            SizedBox(height: 10,),
                                            GestureDetector(
                                              onTap: () {
                                                  getOzelLigJoin(global.userid, ozelligs.oid, ozelligkodctrl.text).then((value) {
                                                    global.ozelligjoin==0?
                                                        showDialog(context: context, builder: (BuildContext context){
                                                          return AlertDialog(content: Text('hatalı kod'),);
                                                        }):Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivateLeaguePage(),settings: RouteSettings(arguments: data)));
                                                  });
                                              },
                                              child: Container(width: 60,height: 40,color: Colors.green,
                                              alignment: Alignment.center,
                                              child: Text('Gönder',style: TextStyle(color: Colors.white),),),
                                            )
                                          ],
                                        ),);
                                      })
                                      :
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivateLeaguePage(),settings: RouteSettings(arguments: data)));
                                });

                               },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  width: genislik*.87,height: 50,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: menuButton(genislik2: genislik*.80,genislik: genislik*.87,renk: Colors.orange.shade700,renk2: Colors.orange.shade900,text: ozelligs.LeagueName,textcolor: Colors.white,height: 50,height2: 55)),
                                      Positioned(left: 0,right:0,top: 0,bottom: 0,
                                          child: Container(alignment: Alignment.center,
                                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: IconButton(onPressed: () {

                                                    }, icon: Icon(Icons.info,color: Colors.transparent,)),
                                                  ),
                                                  Expanded(
                                                    flex: 5,
                                                    child: Text(ozelligs.LeagueName,textAlign: TextAlign.center,
                                                      style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  Expanded(flex: 2,
                                                    child: IconButton(onPressed: () {
                                                      getOzelLigDetay(ozelligs.oid).then((value) {
                                                        showDialog(context: context, builder: (BuildContext context){
                                                          return AlertDialog(
                                                            title: Text(ozelligs.Description),
                                                            content: Html(data: global.awards),);
                                                        });
                                                      });
                                                         /* Navigator.push(context,
                                                              MaterialPageRoute(builder:
                                                                  (context)=>PrivateAwardsPage(),
                                                                  settings: RouteSettings(arguments: data)
                                                              )
                                                          );*/
                                                    }, icon: Icon(Icons.info,color: Colors.white,)),
                                                  )
                                                ],
                                              )
                                          )
                                      )
                                    ],
                                  ))
                            /*  Container(height: 65,alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // Colors.blue.shade300,
                                  borderRadius: BorderRadius.circular(25),

                                ),

                                margin: EdgeInsets.only(left: 15,right: 15),
                                child: ListTile(
                                  leading: GestureDetector(
                                      onTap: () {
                                        showDialog(context: context, builder: (BuildContext context){
                                          return AlertDialog(content: Text(ozelligs.Description),);
                                        });
                                      },
                                      child: Icon(Icons.info,color: Colors.orange,)),
                                  title: Text(ozelligs.LeagueName,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18),
                                  ),
                                  trailing: Icon(Icons.remove_red_eye,color: Colors.green,),
                                ),
                              ), */
                            ),
                          ),

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
class MyCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double genislik=size.width;
    double uzunluk=size.height;
    double offset=10.0;
    Path path=Path();
    path.lineTo(offset, uzunluk);
    path.lineTo(genislik-offset, uzunluk);
    path.lineTo(genislik, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper  ) {
    return true;
    // TODO: implement shouldReclip
    // throw UnimplementedError();
  }

}
class MyCustomClipper2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/4, size.height
        - 40, size.width/2, size.height-20);
    path.quadraticBezierTo(3/4*size.width, size.height,
        size.width, size.height-30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper  ) {
    return true;
    // TODO: implement shouldReclip
    // throw UnimplementedError();
  }

}

class menuButton extends StatelessWidget{
  final double genislik;
  final double genislik2;
  final double height;
  final double height2;
  final Color renk;
  final Color renk2;
  final String text;
  final Color textcolor;
  menuButton({this.genislik,this.genislik2,this.height,this.height2,this.renk,this.renk2,this.text,this.textcolor});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper2(),
      child: Container(
        alignment: Alignment.center,
        width: genislik,height: height,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
              colors: [
                //Colors.black,
                //Colors.grey.shade800
                renk,
                renk2
              ],begin: Alignment.bottomCenter,end: Alignment.topCenter
          ),
          //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45))
        ),
      ),
    );
  }

}
