import 'package:auto_size_text/auto_size_text.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SadakatGecmisPage extends StatefulWidget {
  @override
  _SadakatGecmisPageState createState() => _SadakatGecmisPageState();
}

class _SadakatGecmisPageState extends State<SadakatGecmisPage> {
  sadakatgecmisgetir sadakat=sadakatgecmisgetir();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sadakat Geçmiş'),),
      body: FutureBuilder(
        future:sadakat.getSadakatHistory(),
    builder: (BuildContext context,AsyncSnapshot snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return Container(color: Colors.white,child: Center(child: CircularProgressIndicator(color: Colors.black,),));
      }
        return Container(
          alignment: Alignment.center,decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: [
              Color(0xff3366ff),
              Color(0xff00ccff),
            ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp
          )
        ),
          width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
          child: ListView.builder(
               itemCount: sadakat.sGList.length,
               itemBuilder: (context,index){
                 var sadakats=sadakat.sGList[index];
                 return Padding(
                   padding: const EdgeInsets.only(left: 8.0,right: 8),
                   child: Card(
                     color: Colors.grey.shade900,
                     shadowColor: Colors.black,elevation: 11,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                     child: Padding(
                       padding: const EdgeInsets.all(6.0),
                       child: ListTile(
                         title: AutoSizeText(sadakats.description,style: TextStyle(color: Colors.white,fontSize: 22),
                          minFontSize: 16,maxFontSize: 32,maxLines: 1,
                         ),
                        // subtitle: Text(sadakats.date.substring(0,10)+' '+sadakats.date.substring(11,16),
                         subtitle: AutoSizeText(sadakats.date.substring(11,16)+' '+
                             sadakats.date.substring(8,10)+'.'+sadakats.date.substring(5,7)+'.'+sadakats.date.substring(0,4),
                         style: TextStyle(color: Colors.white70,fontSize: 18), minFontSize: 16,maxFontSize: 28,maxLines: 1,),
                         trailing: AutoSizeText(sadakats.amount>0?'+'+(sadakats.amount).toString()+' ₺':
                         (sadakats.amount).toString()+' ₺',style: TextStyle(color:sadakats.amount>0? Colors.green:Colors.red,fontSize: 22),
                           minFontSize: 16,maxFontSize: 28,maxLines: 1,),
                       ),
                     ) ,
                   ),
                 );
           }
          ),
        ); }
      ),
    );
  }
}
