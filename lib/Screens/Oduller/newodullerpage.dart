import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import '../../Variables/global.dart' as global;
class NewOdullerPage extends StatefulWidget {
  @override
  _NewOdullerPageState createState() => _NewOdullerPageState();
}

class _NewOdullerPageState extends State<NewOdullerPage> {
  int odulkazanan=0;
  int odulsecilen=0;
  int kazanansecilen=0;
  String OdullerselectedValue;
  List OdulcategoryItemList=List();
  List categoryItemList=List();

  String OdullerselectedValueAy;
  List categoryItemListAy=List();
  List OdulcategoryItemListAy=List();

  String selectedValue;
  List KazancategoryItemList=List();

  String selectedValueAy;
  List KazancategoryItemListAy=List();

  List KazancategoryItemListSezon=List();



  Future getAllCategory()async{
    var url="https://ftl.allryazilim.com/api/GetOdulHaftalar";
    var response=await http.get(Uri.parse(url),
        headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
    );
    if(response.statusCode==200){
      print('Kazananlar api '+response.body);
      var jsonData=json.decode(response.body);
      setState(() {
        categoryItemList=jsonData;
      });
    }
    print(categoryItemList);
  }
  Future getOdulHaftaCategory(int haftaid)async{

    var url="https://ftl.allryazilim.com/api/GetOdul?type=0&id=$haftaid";
    var response=await http.get(Uri.parse(url),
        headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
    );
    if(response.statusCode==200){
      print('api '+response.body);
      var jsonData=json.decode(response.body);
      setState(() {
        OdulcategoryItemList=jsonData;
      });
    }
    print(OdulcategoryItemList);
  }

  Future getOdulAyCategory(int ayid)async{
    //GetOdul?type=0&id=1"
    var url="https://ftl.allryazilim.com/api/GetOdul?type=1&id=$ayid";
    var response=await http.get(Uri.parse(url),
        headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
    );
    if(response.statusCode==200){
      print('api '+response.body);
      var jsonData=json.decode(response.body);
      setState(() {
        OdulcategoryItemListAy=jsonData;
      });
    }
    print(OdulcategoryItemListAy);
  }
  Future getAllCategoryAy()async{
    var url="https://ftl.allryazilim.com/api/GetOdulAylar";
    var response=await http.get(Uri.parse(url),
        headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
    );
    if(response.statusCode==200){
      print('--------------------------- api '+response.body);
      var jsonData=json.decode(response.body);
      setState(() {
        categoryItemListAy=jsonData;
      });
    }
    print(categoryItemListAy);
  }

  Future getKazanHaftaCategory(int haftaid)async{
    //GetOdul?type=0&id=1"
    var url="https://ftl.allryazilim.com/api/GetOdulSiralama?type=0&id=$haftaid";
    var response=await http.get(Uri.parse(url),
        headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
    );

    if(response.statusCode==200){
      print('-----------HAFTA : $haftaid');
      print(' KAasfaASfasfasfsafasfasfas---------------------------- api '+response.body);
      var jsonData=json.decode(response.body);
      setState(() {
        KazancategoryItemList=jsonData;
      });
    }
    print(KazancategoryItemList);
  }
  Future getKazanAyCategory(int ayid)async{
    //GetOdul?type=0&id=1"
    var url="https://ftl.allryazilim.com/api/GetOdulSiralama?type=1&id=$ayid";
    var response=await http.get(Uri.parse(url),
        headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
    );
    if(response.statusCode==200){
      print('api '+response.body);
      var jsonData=json.decode(response.body);
      setState(() {
        KazancategoryItemListAy=jsonData;
      });
    }
    print(KazancategoryItemListAy);
  }
  Future getKazanSezonCategory()async{
    //GetOdul?type=0&id=1"
    var url="https://ftl.allryazilim.com/api/GetOdulSiralama?type=2&id=1";
    var response=await http.get(Uri.parse(url),
        headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
    );
    if(response.statusCode==200){
      print('api '+response.body);
      var jsonData=json.decode(response.body);
      setState(() {
        KazancategoryItemListSezon=jsonData;
      });
    }
    print(KazancategoryItemListSezon);
  }
  @override
  void initState() {

    super.initState();
    OdullerselectedValue='Hafta '+global.CurrentWeek.toString();
    selectedValue='Hafta '+global.CurrentWeek.toString();
    getAllCategory();
    getOdulHaftaCategory(global.CurrentWeek);
    getKazanHaftaCategory(global.CurrentWeek);
    getAllCategoryAy();
    getOdulAyCategory(1);
    getKazanAyCategory(1);
    getKazanSezonCategory();
  }
  @override
  Widget build(BuildContext context) {
    double genislik=MediaQuery.of(context).size.width;
    double uzunluk=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: genislik,height: uzunluk,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/FTLBackground.png'),
                fit: BoxFit.cover)
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            primary: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:<Widget> [
                ///LOGO
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: () {
                          Navigator.pushNamed(context, '/menu');
                        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/menu');
                            },
                            child: Text('Geri dön',style: TextStyle(color: Colors.white),))
                      ],
                    ),
                    Image.asset('assets/images/FTLNewLogo.png',fit: BoxFit.cover,width: 75,height: 75,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: () {

                        }, icon: Icon(Icons.arrow_back,color: Colors.transparent,)),
                        Text('Geri dön',style: TextStyle(color: Colors.transparent),)

                      ],
                    ),
                  ],
                ),

                ///Ödüller Yazısı
           odulkazanan==0?     Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: genislik*.80,height: 113,alignment: Alignment.center,
                          child: Container(alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            width: genislik*.70,height: 50,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey.shade400,
                                    Colors.grey.shade700,
                                    Colors.grey.shade300
                                  ],begin: Alignment.centerLeft,end: Alignment.centerRight,
                                  stops: [
                                    0.2,0.27,0.7
                                  ]
                              ),
                              //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45))
                            ),
                            child: Container(alignment: Alignment.center,width: genislik*.65,height: 45,decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Colors.green.shade700
                                  ],begin: Alignment.bottomCenter,end: Alignment.topCenter
                              ),
                            )
                              ,child: Text('ÖDÜLLER',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 38,color: Colors.white),),),
                          ),
                        ),
                        Positioned(bottom: 0,left: -5,top: 10,child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap:() {
                                  if(odulkazanan==1){
                                    setState(() {
                                      odulkazanan=0;
                                    });
                                  }
                                },
                                child: Stack(
                                  children: [
                                    Image.asset('assets/images/futboltop.png',height: 85,width: 85,fit: BoxFit.cover,),
                                    Positioned(top: 0,bottom: 0,left: -7,right: 0,child: Stack(
                                      children: [
                                        Positioned(top: 0,bottom: 0,left: 0,right: 0,
                                            child: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,size: 101,)),

                                        Icon(Icons.arrow_back_ios_sharp,color: Colors.white,size: 95,),
                                      ],
                                    ))
                                  ],
                                )),
                            Text('Ödüller',style: TextStyle(color: Colors.white))
                          ],
                        )),
                        Positioned(bottom: 0,right: -5,top: 10,child: Column(
                          children: [
                            GestureDetector(
                            onTap: () {
                              if(odulkazanan==0){
                                setState(() {
                                  odulkazanan=1;
                                });
                              }
                            },child: Stack(
                              children: [
                                Image.asset('assets/images/futboltop.png',height: 85,width: 85,fit: BoxFit.cover,),
                                Positioned(top: 0,bottom: 0,left: 0,right: -7,child: Stack(
                                  children: [
                                    Positioned(top: 0,bottom: 0,left: 0,right: 0,
                                        child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 101,)),

                                    Icon(Icons.arrow_forward_ios,color: Colors.white,size: 95,),
                                  ],
                                ))
                              ],
                            )),
                            Text('Kazananlar',style: TextStyle(color: Colors.white),)
                          ],
                        )),

                      ],
                    ),
                    SizedBox(height: 15,),
                    ///Haftalık, aylık ve sezonluk yazısı
                    Container(
                      width: genislik-15,height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,border: Border.all(color: Colors.white,width: 2)
                      ),
                      child: Row(
                        children: [
                          ///Haftalık
                          Expanded(flex: 1,child: GestureDetector(
                            onTap: () {
                              if(odulsecilen!=0){
                                setState(() {
                                  odulsecilen=0;
                                });
                              }
                            },
                            child: Container(alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: odulsecilen!=0?Colors.transparent:Colors.green.shade700,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15))

                                ),
                                child: Text('HAFTALIK',textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 19,color: Colors.white),
                                )),
                          )
                          ),
                          Container(width: 2,height: 50,color: Colors.white,),
                         ///Aylık
                          Expanded(flex: 1,child: GestureDetector(
                            onTap: () {
                              if(odulsecilen!=1){
                                setState(() {
                                  odulsecilen=1;
                                });
                              }
                            },
                            child: Container(alignment: Alignment.center,color: odulsecilen!=1?Colors.transparent:Colors.green.shade700,
                                child: Text('AYLIK',textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 19,color: Colors.white),)),
                          )
                          ),
                          Container(width: 2,height: 50,color: Colors.white,),
                          ///Sezonluk
                          Expanded(flex: 1,child: GestureDetector(
                            onTap: () {
                              if(odulsecilen!=2){
                                setState(() {
                                  odulsecilen=2;
                                });
                              }
                            },
                            child: Container(alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: odulsecilen!=2?Colors.transparent:Colors.green.shade700,
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))
                                ),
                                child: Text('SEZONLUK',textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 19,color: Colors.white),)),
                          )
                          ),
                        ],
                      ),
                    ),
                    odulsecilen==2?SizedBox(height: 25,):SizedBox(),
                    odulsecilen==0? Container(
               padding: EdgeInsets.only(top:15, left:15, right:10,),
                       alignment: Alignment.center,
                     child: Column(
                          children:[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(alignment: Alignment.center,
                                width: 180,
                                decoration: BoxDecoration(
                                  color: Colors.green.shade700,
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: DropdownButton(
                                  dropdownColor: Colors.black,
                                  style: TextStyle(color: Colors.white,fontSize: 19),
                                  hint: Text('Hafta seçiniz..',style: TextStyle(color: Colors.white),),
                                  value: OdullerselectedValue,
                                  items: categoryItemList.map((category) {
                                    return DropdownMenuItem(
                                        value: category['haftaadi'],
                                        child: Text(category['haftaadi'],
                                        )
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    getOdulHaftaCategory(int.parse(value.toString().substring(6,8))).whenComplete(() {
                                      setState(() {
                                        OdullerselectedValue=value;
                                      });
                                    });

                                  },
                                ),
                              ),
                            ),

                            Html(data: OdulcategoryItemList.isEmpty?'':
                            OdulcategoryItemList[0]['haftaadi']==OdullerselectedValue?
                            OdulcategoryItemList[0]['oduller']:''),


                          ]
                      ),
               ):
                    odulsecilen==1?Container(

                     padding: EdgeInsets.only(top:15, left:15, right:10,),
                     child: Column(
                         children:[
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Container(
                               alignment: Alignment.center,
                               width: 180,
                               decoration: BoxDecoration(
                                   color: Colors.green.shade700,
                                   borderRadius: BorderRadius.circular(15)
                               ),
                               child: DropdownButton(
                                 dropdownColor: Colors.black,
                                 style: TextStyle(color: Colors.white,fontSize: 19),
                                 hint: Text('Ay seçiniz..',style: TextStyle(color: Colors.white,fontSize: 19)),
                                 value: OdullerselectedValueAy,
                                 items: categoryItemListAy.map((category) {
                                   return DropdownMenuItem(
                                       value: category['ayadi'],
                                       child: Text(category['ayadi'])
                                   );
                                 }).toList(),
                                 onChanged: (value) {
                                   getOdulAyCategory(int.parse(value.toString().substring(0,2))).whenComplete(() {
                                     setState(() {
                                       OdullerselectedValueAy=value;
                                     });
                                   });
                                 },
                               ),
                             ),
                           ),
                           Html(data: OdulcategoryItemListAy.isEmpty?'':
                           OdulcategoryItemListAy[0]['ayadi']==OdullerselectedValueAy?
                           OdulcategoryItemListAy[0]['oduller']:''),

                         ]
                     ),
               ):
               Text('Sürpriz büyük ödüller daha sonra açıklanacak.',
                       style: TextStyle(color: Colors.white, fontSize: 18,
                           fontWeight: FontWeight.w500)),
                    SizedBox(height: 15,),
                  ],
                ):

                ///KAZANANLAR
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: genislik*.80,height: 113,alignment: Alignment.center,
                          child: Container(alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            width: genislik*.70,height: 50,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.grey.shade400,
                                    Colors.grey.shade700,
                                    Colors.grey.shade300
                                  ],begin: Alignment.centerLeft,end: Alignment.centerRight,
                                  stops: [
                                    0.2,0.27,0.7
                                  ]
                              ),
                              //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45))
                            ),
                            child: Container(alignment: Alignment.center,width: genislik*.65,height: 45,decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Colors.green.shade700
                                  ],begin: Alignment.bottomCenter,end: Alignment.topCenter
                              ),
                            )
                              ,child: Text('Kazananlar',style: TextStyle(fontFamily: 'BebasNeue',fontWeight: FontWeight.normal,fontSize: 38,color: Colors.white),),),
                          ),
                        ),
                        Positioned(bottom: 0,left: -5,top: 10,child: Column(
                          children: [
                            GestureDetector(
                                onTap:() {
                                  if(odulkazanan==1){
                                    setState(() {
                                      odulkazanan=0;
                                    });
                                  }
                                },
                                child: Stack(
                                  children: [
                                    Image.asset('assets/images/futboltop.png',height: 85,width: 85,fit: BoxFit.cover,),
                                    Positioned(top: 0,bottom: 0,left: -7,right: 0,child: Stack(
                                      children: [
                                        Positioned(top: 0,bottom: 0,left: 0,right: 0,
                                            child: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,size: 101,)),

                                        Icon(Icons.arrow_back_ios_sharp,color: Colors.white,size: 95,),
                                      ],
                                    ))
                                  ],
                                )),
                            Text('Ödüller',style: TextStyle(color: Colors.white),)

                          ],
                        )),
                        Positioned(bottom: 0,right: -5,top: 10,child: Column(
                          children: [
                            GestureDetector(
                                onTap:() {
                                  if(odulkazanan==0){
                                    setState(() {
                                      odulkazanan=1;
                                    });
                                  }
                                },
                                child: Stack(
                                  children: [

                                    Image.asset('assets/images/futboltop.png',height: 85,width: 85,fit: BoxFit.cover,),
                                    Positioned(top: 0,bottom: 0,left: 0,right: -7,child: Stack(
                                      children: [
                                        Positioned(top: 0,bottom: 0,left: 0,right: 0,
                                            child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 101,)),

                                        Icon(Icons.arrow_forward_ios,color: Colors.white,size: 95,),
                                      ],
                                    ))
                                  ],
                                )),
                            Text('Kazananlar',style: TextStyle(color: Colors.white),)

                          ],
                        )),

                      ],
                    ),
                    SizedBox(height: 15,),
                    ///Haftalık, aylık ve sezonluk yazıları
                    Container(
                      width: genislik-15,height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                          color: Colors.transparent,border: Border.all(color: Colors.white,width: 2)
                      ),
                      child: Row(
                        children: [
                          ///Haftalık
                          Expanded(flex: 1,child: GestureDetector(
                            onTap: () {
                              if(kazanansecilen!=0){
                                setState(() {
                                  kazanansecilen=0;
                                });
                              }
                            },
                            child: Container(alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: kazanansecilen!=0?Colors.transparent:Colors.green.shade700,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15))
                                ),
                                child: Text('HAFTALIK',textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 19,color: Colors.white),
                                )),
                          )
                          ),
                          Container(width: 2,height: 50,color: Colors.white,),
                          ///Aylık
                          Expanded(flex: 1,child: GestureDetector(
                            onTap: () {
                              if(kazanansecilen!=1){
                                setState(() {
                                  kazanansecilen=1;
                                });
                              }
                            },
                            child: Container(alignment: Alignment.center,color: kazanansecilen!=1?Colors.transparent:Colors.green.shade700,
                                child: Text('AYLIK',textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 19,color: Colors.white),)),
                          )
                          ),
                          Container(width: 2,height: 50,color: Colors.white,),
                          ///Sezonluk
                          Expanded(flex: 1,child: GestureDetector(
                            onTap: () {
                              if(kazanansecilen!=2){
                                setState(() {
                                  kazanansecilen=2;
                                });
                              }
                            },
                            child: Container(alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: kazanansecilen!=2?Colors.transparent:Colors.green.shade700,
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))

                                ),
                                child: Text('SEZONLUK',textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 19,color: Colors.white),)),
                          )
                          ),
                        ],
                      ),
                    ),
                    kazanansecilen==0?Container(
                      height: MediaQuery.of(context).size.height-222,

                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:[
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: Colors.green.shade700,
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: DropdownButton(
                                    dropdownColor: Colors.black,
                                    style: TextStyle(color: Colors.white,fontSize: 19),
                                    hint: Text('Hafta seçiniz..',style: TextStyle(color: Colors.white,fontSize: 19)),
                                    value: selectedValue,
                                    items: categoryItemList.map((category) {
                                      return DropdownMenuItem(
                                          value: category['haftaadi'],
                                          child: Text(category['haftaadi'])
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      getKazanHaftaCategory(int.parse(value.toString().substring(6,8))).whenComplete(() {
                                        setState(() {
                                          selectedValue=value;
                                        });
                                      });

                                    },
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 9,
                              child: Visibility(
                                visible: selectedValue==null?false:true,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: KazancategoryItemList.length,
                                    itemBuilder: (context,index) {
                                      var kazanansH = KazancategoryItemList[index];
                                      //  return Text(kazanansH['FantasyName']);
                                      return Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(height: 75,alignment: Alignment.center,
                                                child: Container(height: 50,alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: index==0?Color.fromARGB(255, 255, 215, 0):
                                                    index==1?Color.fromARGB(255, 192, 192, 192):
                                                    index==2?Color.fromARGB(255, 205, 127 , 20):
                                                    global.fantasyteamname==kazanansH['FantasyName']?Colors.white.withOpacity(0.7):
                                                    Colors.white.withOpacity(0.4)  ,
                                                    // Colors.blue.shade300,
                                                    borderRadius: BorderRadius.circular(25),

                                                  ),

                                                  margin: EdgeInsets.only(left: 30,right: 15),
                                                  child: ListTile(
                                                   /* leading: Text((index+1).toString(),
                                                      style: TextStyle(fontSize: 28,color:index==0||global.fantasyteamname==kazanansH['FantasyName']?Colors.black: Colors.white,fontWeight: FontWeight.w900),
                                                    ),*/
                                                    title: Row(
                                                      children: [
                                                        Container(width: 1.25,height:70,color: Color(0xFF3366FF),),
                                                        // SizedBox(width: 50,),
                                                        Expanded(flex: 16,child: CircleAvatar(backgroundColor: Colors.transparent,child: Icon(Icons.person,color: Colors.white,),)),

                                                        // SizedBox(width: 10,),
                                                        Expanded(flex: 46,
                                                          child: Text(kazanansH['FantasyName'],
                                                            style: TextStyle(color: index==0||global.fantasyteamname==kazanansH['FantasyName']?Colors.black:Colors.white,fontWeight: FontWeight.w700,fontSize: 20),
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
                                                      child: Text(kazanansH['Points'].toString(),
                                                        style: TextStyle(color:index==0||global.fantasyteamname==kazanansH['FantasyName']?Colors.black: Colors.white,fontWeight: FontWeight.w900,fontSize: 22), ),
                                                    ),
                                                    //isThreeLine: true,
                                                    //subtitle: Text(trend.subtitle,style: TextStyle(color: Colors.black)),
                                                  ),
                                                ),
                                              ),
                                              Positioned(top: 0,bottom: 0,left: 30,
                                                  child: CircleAvatar(child: Text((index+1).toString(),
                                                    style: TextStyle(fontSize: 28,
                                                        color:index==0||index==1||index==2?Colors.white
                                                            : Colors.black,
                                                        fontWeight: FontWeight.w900),
                                                  ),radius: 35,backgroundColor:
                                                  index==0||index==1||index==2? Colors.green:
                                                    Colors.white,)
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10   ,),
                                        ],
                                      );
                                    }
                                ),
                              ),
                            )
                          ]
                      ),
                    ):
                    kazanansecilen==1?Container(
                      height: MediaQuery.of(context).size.height-222,

                      child: Column(
                          children:[
                            Expanded(flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: Colors.green.shade700,
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: DropdownButton(
                                    dropdownColor: Colors.black,
                                    style: TextStyle(color: Colors.white,fontSize: 19),
                                    hint: Text('Ay seçiniz..',style: TextStyle(color: Colors.white,fontSize: 19)),
                                    value: selectedValueAy,
                                    items: categoryItemListAy.map((category) {

                                      return DropdownMenuItem(
                                          value: category['ayadi'],
                                          child: Text(category['ayadi'])
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      getKazanAyCategory(int.parse(value.toString().substring(0,2))).whenComplete(() {
                                        setState(() {
                                          selectedValueAy=value;
                                        });
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            // Text(selectedValueAy==null?'':selectedValueAy),
                            Expanded(flex: 9,
                              child: Visibility(
                                visible: selectedValueAy==null?false:true,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: KazancategoryItemListAy.length,
                                    itemBuilder: (context,index) {
                                      var kazanansH = KazancategoryItemListAy[index];
                                      //  return Text(kazanansH['FantasyName']);
                                      return Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(height: 75,alignment: Alignment.center,
                                                child: Container(height: 50,alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: index==0?Color.fromARGB(255, 255, 215, 0):
                                                    index==1?Color.fromARGB(255, 192, 192, 192):
                                                    index==2?Color.fromARGB(255, 205, 127 , 20):
                                                    global.fantasyteamname==kazanansH['FantasyName']?Colors.white.withOpacity(0.7):
                                                    Colors.white.withOpacity(0.4)  ,
                                                    // Colors.blue.shade300,
                                                    borderRadius: BorderRadius.circular(25),

                                                  ),

                                                  margin: EdgeInsets.only(left: 30,right: 15),
                                                  child: ListTile(
                                                   /* leading: Text((index+1).toString(),
                                                      style: TextStyle(fontSize: 28,color:index==0||global.fantasyteamname==kazanansH['FantasyName']?Colors.black: Colors.white,fontWeight: FontWeight.w900),
                                                    ),*/
                                                    title: Row(
                                                      children: [
                                                        Container(width: 1.25,height:70,color: Color(0xFF3366FF),),
                                                        // SizedBox(width: 50,),
                                                        Expanded(flex: 16,child: CircleAvatar(backgroundColor: Colors.transparent,child: Icon(Icons.person,color: Colors.white,),)),

                                                        // SizedBox(width: 10,),
                                                        Expanded(flex: 46,
                                                          child: Text(kazanansH['FantasyName'],
                                                            style: TextStyle(color: index==0||global.fantasyteamname==kazanansH['FantasyName']?Colors.black:Colors.white,fontWeight: FontWeight.w700,fontSize: 20),
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
                                                      child: Text(kazanansH['Points'].toString(),
                                                        style: TextStyle(color:index==0||global.fantasyteamname==kazanansH['FantasyName']?Colors.black: Colors.white,fontWeight: FontWeight.w900,fontSize: 22), ),
                                                    ),
                                                    //isThreeLine: true,
                                                    //subtitle: Text(trend.subtitle,style: TextStyle(color: Colors.black)),
                                                  ),
                                                ),
                                              ),
                                              Positioned(top: 0,bottom: 0,left: 30,
                                                  child: CircleAvatar(child: Text((index+1).toString(),
                                                    style: TextStyle(fontSize: 28,
                                                        color:index==0||index==1||index==2?Colors.white
                                                            : Colors.black,
                                                        fontWeight: FontWeight.w900),
                                                  ),radius: 35,backgroundColor:
                                                  index==0||index==1||index==2? Colors.green:
                                                  Colors.white,)
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10   ,),
                                        ],
                                      );
                                    }
                                ),
                              ),
                            )

                          ]
                      ),
                    ):
                    kazanansecilen==2?Container(
                      height: MediaQuery.of(context).size.height-222,

                      child: Column(
                          children:[
                            Expanded(flex: 1,child: Text('İlk 10\n'
                                'Sezon sonuna kadar sıralamada değişiklik olabilir',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,)),
                            Expanded(flex: 9,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: KazancategoryItemListSezon.length,
                                  itemBuilder: (context,index) {
                                    var kazanansH = KazancategoryItemListSezon[index];
                                    //  return Text(kazanansH['FantasyName']);
                                    return Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(height: 75,alignment: Alignment.center,
                                              child: Container(height: 50,alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: index==0?Color.fromARGB(255, 255, 215, 0):
                                                  index==1?Color.fromARGB(255, 192, 192, 192):
                                                  index==2?Color.fromARGB(255, 205, 127 , 20):
                                                  global.fantasyteamname==kazanansH['FantasyName']?Colors.white.withOpacity(0.7):
                                                  Colors.white.withOpacity(0.4)  ,
                                                  // Colors.blue.shade300,
                                                  borderRadius: BorderRadius.circular(25),

                                                ),

                                                margin: EdgeInsets.only(left: 30,right: 15),
                                                child: ListTile(
                                               /*   leading: Text((index+1).toString(),
                                                    style: TextStyle(fontSize: 28,color:index==0||global.fantasyteamname==kazanansH['FantasyName']?Colors.black: Colors.white,fontWeight: FontWeight.w900),
                                                  ),*/
                                                  title: Row(
                                                    children: [
                                                      Container(width: 1.25,height:70,color: Color(0xFF3366FF),),
                                                      // SizedBox(width: 50,),
                                                      Expanded(flex: 16,child: CircleAvatar(backgroundColor: Colors.transparent,child: Icon(Icons.person,color: Colors.white,),)),

                                                      // SizedBox(width: 10,),
                                                      Expanded(flex: 46,
                                                        child: Text(kazanansH['FantasyName'],
                                                          style: TextStyle(color: index==0||global.fantasyteamname==kazanansH['FantasyName']?Colors.black:Colors.white,fontWeight: FontWeight.w700,fontSize: 20),
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
                                                    child: Text(kazanansH['Points'].toString(),
                                                      style: TextStyle(color:index==0||global.fantasyteamname==kazanansH['FantasyName']?Colors.black: Colors.white,fontWeight: FontWeight.w900,fontSize: 22), ),
                                                  ),
                                                  //isThreeLine: true,
                                                  //subtitle: Text(trend.subtitle,style: TextStyle(color: Colors.black)),
                                                ),
                                              ),
                                            ),
                                            Positioned(top: 0,bottom: 0,left: 30,
                                                child: CircleAvatar(child: Text((index+1).toString(),
                                                  style: TextStyle(fontSize: 28,
                                                      color:index==0||index==1||index==2?Colors.white
                                                          : Colors.black,
                                                      fontWeight: FontWeight.w900),
                                                ),radius: 35,backgroundColor:
                                                index==0||index==1||index==2? Colors.green:
                                                Colors.white,)
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10   ,),
                                      ],
                                    );
                                  }
                              ),
                            ),

                          ]
                      ),
                    ):

                    SizedBox(),
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
