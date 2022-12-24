import 'package:fantasysuperlig/Screens/Magaza/kupongecmispage.dart';
import 'package:fantasysuperlig/Screens/Magaza/magazapage.dart';
import 'package:fantasysuperlig/Screens/MenuPage.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Variables/global.dart' as global;
class KuponOlusturEnSofraPage extends StatefulWidget {
  @override
  _KuponOlusturEnSofraPageState createState() => _KuponOlusturEnSofraPageState();
}

class _KuponOlusturEnSofraPageState extends State<KuponOlusturEnSofraPage> {
  bool ontl=false;
  bool yirmitl=false;
  bool kirktl=false;
  int type;
  String indirimkuponu;

  @override
  void initState() {
    global.kupon='';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double genislik=MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            //color: Colors.pink,
              gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade900,Colors.green,Colors.green,Colors.pink.shade200
                  ],
                  stops: [0.3,0.2,0.7,0.3],
                  begin: Alignment.bottomLeft,end: Alignment.topRight
              )
          ),
          child: SafeArea(
            child: Column(
              children: [
                Container(alignment: Alignment.centerLeft,
                  width: genislik,height: 65,color: Colors.white24,
                  child: Row(
                    children: [
                      IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));

                        },
                      ),
                      Text('İndirim Kuponu',style: TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                FutureBuilder(
                    future: getCardMoney(),
                    builder:(BuildContext context,AsyncSnapshot snapshot){
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10,bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white,width: 2),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                              child: Container(width: genislik,height: 25,

                                child: Text('Sadakat sisteminizde bulunan indirim tutarı: '+global.indirimTutari.toString()+' ₺',style: TextStyle(
                                    fontSize: 16,color: Colors.white
                                ),),
                              ),
                            ),
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10,bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,width: 2),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                            child: Container(width: genislik,height: 25,

                              child: Text('Sadakat sisteminizde bulunan indirim tutarı: '+global.indirimTutari.toString()+' ₺',style: TextStyle(
                                  fontSize: 16,color: Colors.white
                              ),),
                            ),
                          ),
                        ),
                      ); }
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10,bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,width: 2),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                          child: Container(width: genislik,height: 25,

                            child: Text('İndirim Kuponu',style: TextStyle(
                                fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Checkbox(
                                      checkColor:Colors.black,
                                      activeColor: Colors.white,
                                      value: ontl,
                                      onChanged: (bool value){
                                        if(yirmitl==true||kirktl==true){
                                          setState(() {
                                            // this.erkek = false;
                                            this.yirmitl=false;
                                            this.kirktl=false;
                                            this.ontl = true;
                                          });
                                        }
                                        else{
                                          setState(() {
                                            this.ontl = value;
                                            this.type=4;
                                          });
                                        }
                                        print('10tl: '+ontl.toString());
                                        print('20tl: '+yirmitl.toString());
                                        print('40tl: '+kirktl.toString());
                                        print('indirim kuponu: '+indirimkuponu.toString());
                                      }),
                                  Text('10 TL indirim tutarı karşılığı \ntüm alışverişlerinizde %10 indirim',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                         /*   SizedBox(width: 10,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          value: yirmitl,
                                          checkColor:Colors.black,
                                          activeColor: Colors.white,
                                          onChanged: (bool value){
                                            if(ontl==true||kirktl==true){
                                              setState(() {
                                                //  this.kadin = false;
                                                this.yirmitl=true;
                                                this.kirktl=false;
                                                this.ontl = false;
                                              });
                                            }
                                            else{
                                              setState(() {
                                                this.yirmitl = value;
                                                this.type=2;
                                              });
                                            }
                                            print('20tl: '+yirmitl.toString());
                                            print('40tl: '+kirktl.toString());
                                            print('10tl: '+ontl.toString());
                                            print('indirim kuponu: '+indirimkuponu.toString());

                                          }),
                                      Text('20 TL',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                                Container(alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(right: 16),
                                  child: Text('100 TL ve üstü Alışverişte',textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          value: kirktl,
                                          checkColor:Colors.black,
                                          activeColor: Colors.white,
                                          onChanged: (bool value){
                                            if(yirmitl==true||ontl==true){
                                              setState(() {
                                                //this.belirtilmemis = false;
                                                this.yirmitl=false;
                                                this.kirktl=true;
                                                this.ontl = false;
                                              });
                                            }
                                            else{
                                              setState(() {
                                                this.kirktl = value;
                                                this.type=3;
                                              });
                                            }
                                            print('40tl: '+kirktl.toString());
                                            print('20tl: '+yirmitl.toString());
                                            print('10tl: '+ontl.toString());
                                            print('indirim kuponu: : '+indirimkuponu.toString());

                                          }),
                                      Text('30 TL',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Container(alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(right: 16),
                                  child: Text('150 TL ve üstü Alışverişte',textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),*/

                          ],
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10,bottom: 10),
                  child: InkWell(
                    onTap: ()async {

                      if(type!=null){
                        setState(() {
                          this.ontl=false;
                          this.yirmitl=false;
                          this.kirktl=false;
                        });
                        await getCoupon(3, type);
                        if (global.kupon == '0') {
                          setState(() {
                            this.type=null;

                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(backgroundColor: Colors.red,
                                  content: Text('Yetersiz İndirim Tutarı!',style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,fontSize: 19),),
                                );
                              });
                        }
                        else{
                          setState(() {
                            this.type=null;

                          });
                        }
                      }
                      else{
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(backgroundColor: Colors.amber,
                                content: Text('İndirim tutarını seçiniz!',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                              );
                            });
                      }

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.pink.shade700,width: 2),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                        child: Container(width: genislik,height: 25,
                          alignment: Alignment.center,
                          child: Text('İndirim Kuponunu Oluştur',style: TextStyle(
                              fontSize: 20,color: Colors.pink
                          ),),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: global.kupon==''||global.kupon=='0'?false:true,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10,bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 2),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                        child: Container(width: genislik,height: 25,

                          child: InkWell(
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
                              Clipboard.setData(ClipboardData(text: global.kupon));
                            },
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(global.kupon=='null'?'Kupun Kodu: '+'':'Kupun Kodu: '+global.kupon,style: TextStyle(
                                    fontSize: 20,color: Colors.white
                                ),),
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
                                  Clipboard.setData(ClipboardData(text: global.kupon));
                                }, icon: Icon(Icons.copy,color: Colors.white,))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(flex: 5,child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('*İndirim kuponlarınızı kupon geçmiş sayfasından görebilirsiniz',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                    )),
                    Expanded(flex: 1,
                      child: IconButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>KuponGesmisPage()));
                      }, icon: Icon(Icons.remove_red_eye,color: Colors.white,size: 30,)),
                    )
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
