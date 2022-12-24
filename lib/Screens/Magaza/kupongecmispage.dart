import 'package:fantasysuperlig/Screens/Magaza/magazapage.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../MenuPage.dart';
class KuponGesmisPage extends StatefulWidget {
  @override
  _KuponGesmisPageState createState() => _KuponGesmisPageState();
}

class _KuponGesmisPageState extends State<KuponGesmisPage> {
  kuponlarigetir kupon=kuponlarigetir();
  @override
  Widget build(BuildContext context) {
    double uzunluk=MediaQuery.of(context).size.height;
    double genislik=MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));

      },
      child: FutureBuilder(
        future: kupon.getCouponHistory(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));


            },),
            title: Text('İndirim kupon geçmişi'),backgroundColor: Colors.grey.shade900,
          ),
          body: kupon.kuponlar.length==0? Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade900,child: Text('Kuponunuz Yok...',style: TextStyle(color: Colors.white),),
          )
              :Container(alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
            color: Colors.grey.shade900,
            child: ListView.builder(
               itemCount: kupon.kuponlar.length,
               itemBuilder: (context,index){
                 var kupons=kupon.kuponlar[index];
                 return Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15,),
                  Stack(
                    children: [
                      Container(alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10,right: 10),
                       width: MediaQuery.of(context).size.width,height: 130,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(25)
                      ),child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,top: 8.0,left: 14,right: 2),
                              child: RichText(
                                  text: TextSpan(
                                      text: 'Site\n'
                                      ,style: TextStyle(color: Colors.black45,fontSize: uzunluk/76)
                                      ,children: [
                                    TextSpan(
                                      text:  kupons.siteid==1?'KAPTINKAPTIN.NET':kupons.siteid==2?'YUBA Ticaret':kupons.siteid==3?'EnSofra':''
                                      ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: uzunluk/50),
                                    ),
                                  ]
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                  text: TextSpan(
                                    //fontSize: 12
                                      text: 'Oluşturulma Tarihi\n'
                                      ,style: TextStyle(color: Colors.black45,fontSize: uzunluk/76)
                                      ,children: [
                                    TextSpan(
                                      //fontSize: 16,
                                      text:  kupons.creationdate.substring(0,10)+' '+kupons.creationdate.substring(11,16)
                                      ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: uzunluk/50),
                                    ),
                                  ]
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                  text: TextSpan(
                                      text: 'İndirim tutarı\n'
                                      ,style: TextStyle(color: Colors.black45,fontSize: uzunluk/76)
                                      ,children: [
                                    TextSpan(
                                      text:  kupons.type==1?'10 TL':kupons.type==2?'20 TL':kupons.type==3?'30 TL':
                                      kupons.type==4?'%10 indirim':
                                      kupons.type==5?'10 TL':kupons.type==6?'20 TL':kupons.type==7?'40 TL':''
                                      ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: uzunluk/50),
                                    ),
                                  ]
                                  )),
                            )
                          ],
                    ),

                          InkWell(
                            onTap: () {
                              var fToast=FToast();
                              fToast.init(context);
                              fToast.showToast(
                                  toastDuration: Duration(milliseconds: 1000),gravity: ToastGravity.BOTTOM_RIGHT,
                                  child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 24,
                                    vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.check),
                                    SizedBox(width: 15,),
                                    Text('Panoya kopyalandı')
                                  ],
                                ),
                              ));

                              Clipboard.setData(ClipboardData(text:kupons.coupecode ));

                            },
                            child: Column(
                              children: [
                                Container(alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 40,right: 40),
                                  width: MediaQuery.of(context).size.width,height: 40,
                                  decoration: BoxDecoration(
                                    color:kupons.state==2?Colors.red: Color.fromARGB(227, 7, 249, 136 ),
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(kupons.coupecode,style: TextStyle(fontSize: uzunluk/41,fontWeight: FontWeight.bold),),
                                      IconButton(onPressed: () {
                                        var fToast=FToast();
                                        fToast.init(context);
                                        fToast.showToast(
                                            toastDuration: Duration(milliseconds: 1000),gravity: ToastGravity.BOTTOM_RIGHT,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 24,
                                                  vertical: 12),
                                              decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  borderRadius: BorderRadius.circular(25)
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.check),
                                                  SizedBox(width: 15,),
                                                  Text('Panoya kopyalandı')
                                                ],
                                              ),
                                            ));

                                        Clipboard.setData(ClipboardData(text:kupons.coupecode ));
                                      }, icon: Icon(Icons.copy,color: Colors.black,))
                                    ],
                                  ),
                                ),
                                Visibility(
                 visible: kupons.state==2?true:false
                 ,child: Text('Kullanıldı'))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                      Padding(
                        padding:  EdgeInsets.only(top: 55.0,right: genislik- 27),
                        child: CircleAvatar(maxRadius: 15,backgroundColor: Colors.grey.shade900,),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: genislik-27,top: 55.0),
                        child: CircleAvatar(maxRadius: 15,backgroundColor: Colors.grey.shade900,),
                      ),
                    ]
                  )
                ],
              ); }
            ),
          ),
        ); }
      ),
    );
  }
}
