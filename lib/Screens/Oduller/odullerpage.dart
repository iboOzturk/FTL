import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';

import '../../Variables/global.dart' as global;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class OdulPage extends StatefulWidget {
  @override
  _OdulPageState createState() => _OdulPageState();
}

class _OdulPageState extends State<OdulPage> {
 // int haftaid=1;
  //int ayid=1;

  String selectedValue;
  String selectedValueAy;
  List categoryItemList=List();
  List categoryItemListAy=List();

  ///---------------------------------
  String OdullerselectedValue;
  String OdullerselectedValueAy;
  List OdulcategoryItemList=List();
  List OdulcategoryItemListAy=List();
  ///-------------------------------
  List KazancategoryItemList=List();
  List KazancategoryItemListAy=List();
  List KazancategoryItemListSezon=List();


  Future getAllCategory()async{
    var url="https://ftl.allryazilim.com/api/GetOdulHaftalar";
    var response=await http.get(Uri.parse(url),
        headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
    );
    if(response.statusCode==200){
      print('api '+response.body);
      var jsonData=json.decode(response.body);
      setState(() {
        categoryItemList=jsonData;
      });
    }
    print(categoryItemList);
  }
  Future getAllCategoryAy()async{
    var url="https://ftl.allryazilim.com/api/GetOdulAylar";
    var response=await http.get(Uri.parse(url),
        headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
    );
    if(response.statusCode==200){
      print('api '+response.body);
      var jsonData=json.decode(response.body);
      setState(() {
        categoryItemListAy=jsonData;
      });
    }
    print(categoryItemListAy);
  }
  ///-------------------------------------
  Future getOdulHaftaCategory(int haftaid)async{
    //GetOdul?type=0&id=1"
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
  ///-------------------------------------
  Future getKazanHaftaCategory(int haftaid)async{
    //GetOdul?type=0&id=1"
    var url="https://ftl.allryazilim.com/api/GetOdulSiralama?type=0&id=$haftaid";
    var response=await http.get(Uri.parse(url),
        headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
    );

    if(response.statusCode==200){
      print('api '+response.body);
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
    // TODO: implement initState
    super.initState();
    OdullerselectedValue='Hafta '+global.CurrentWeek.toString();
    selectedValue='Hafta '+global.CurrentWeek.toString();
    getAllCategory();
    getAllCategoryAy();
    getOdulHaftaCategory(global.CurrentWeek);
    getOdulAyCategory(1);
    getKazanHaftaCategory(global.CurrentWeek);
    getKazanAyCategory(1);
    getKazanSezonCategory();
  }
  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              Navigator.pushNamed(context, '/menu');
            }, icon: Icon(Icons.arrow_back_ios),),
            title: Text('Ödüller'),
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff5808e5),
            bottom: TabBar(
              indicatorColor: Colors.deepOrange,
              tabs: [
                Tab(text: 'ÖDÜLLER'),
                Tab(text: 'KAZANANLAR'),
              ],
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(0, 3))],
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[Color(0xFF3366FF), Color(0xFF00CCFF)])),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Color(0xFF3366FF)
             /* gradient: new LinearGradient(
                  colors: [
                    const Color(0xFF3366FF),
                    const Color(0xFF00CCFF),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),*/

              //image: DecorationImage(image: AssetImage('assets/images/ptb.jpeg'),fit: BoxFit.cover)
            ),
            child: TabBarView(
              children: [
                /// 1. TABBAR İÇİ
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: DefaultTabController(
                          length: 3, // length of tabs
                          initialIndex: 0,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                  child: TabBar(
                                    indicator: BoxDecoration(

                                      borderRadius: BorderRadius.circular(
                                        15.0,
                                      ),
                                      color: Colors.deepOrange,
                                    ),

                                    labelColor: Colors.white,
                                    unselectedLabelColor: Colors.white,
                                    tabs: [
                                      Tab(text: 'Haftalık',),
                                      Tab(text: 'Aylık'),
                                      Tab(text: 'Sezonluk'),
                                    ],
                                  ),
                                ),
                                Container(
                                    height: MediaQuery.of(context).size.height, //height of TabBarView
                                    child: TabBarView(children: <Widget>[
                                      ///hafta
                                      Container(alignment: Alignment.center,
                                        //padding: EdgeInsets.only(top:25, left:15, right:10,),
                                        child: Column(
                                            children:[
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
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
                                                    getOdulHaftaCategory(int.parse(value.toString().substring(6,7))).whenComplete(() {
                                                      setState(() {
                                                        OdullerselectedValue=value;
                                                      });
                                                    });

                                                  },
                                                ),
                                              ),

                                              Html(data: OdulcategoryItemList.isEmpty?'':
                                              OdulcategoryItemList[0]['haftaadi']==OdullerselectedValue?
                                              OdulcategoryItemList[0]['oduller']:''),

                                             /* Text(OdulcategoryItemList.isEmpty?'':
                                              OdulcategoryItemList[0]['haftaadi']==OdullerselectedValue?
                                              OdulcategoryItemList[0]['oduller']:'',style: TextStyle(fontSize: 19,color: Colors.white),),*/

                                            /*  Text('İlk 10 – ödül ; FTL kuruluş anısı Mug (Kulplu bardak)',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500)), */
                                            ]
                                        ),
                                      ),
                                      ///ay
                                      Container(
                                        padding: EdgeInsets.only(top:25, left:15, right:10,),
                                        child: Column(
                                            children:[
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
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
                                                    getOdulAyCategory(int.parse(value.toString().substring(0,1))).whenComplete(() {
                                                      setState(() {
                                                        OdullerselectedValueAy=value;
                                                      });
                                                    });
                                                  },
                                                ),
                                              ),
                                              Html(data: OdulcategoryItemListAy.isEmpty?'':
                                              OdulcategoryItemListAy[0]['ayadi']==OdullerselectedValueAy?
                                              OdulcategoryItemListAy[0]['oduller']:''),
                                          /*    Text(OdulcategoryItemListAy.isEmpty?'':
                                              OdulcategoryItemListAy[0]['ayadi']==OdullerselectedValueAy?
                                              OdulcategoryItemListAy[0]['oduller']:'',style: TextStyle(fontSize: 19,color: Colors.white)), */

                                           /*   Text('İlk 10 – ödül ; Taraftar olduğunuz takımın yeni sezon forması'
                                                'Sonraki ilk 10 – ödül ; Fantasy SL Mug (Kulplu bardak)',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500)),*/
                                            ]
                                        ),
                                      ),
                                      ///sezon
                                      Container(
                                        padding: EdgeInsets.only(top:25, left:15, right:10,),
                                        child: Column(
                                            children:[ Text('Sürpriz büyük ödüller daha sonra açıklanacak.',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500)),
                                            ]
                                        ),
                                      ),
                                    ]))
                              ])),
                    ),
                  ),
                ),

                /// 2. TABBAR İÇİ
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: DefaultTabController(
                        length: 3, // length of tabs
                        initialIndex: 0,
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(

                                child: TabBar(
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      15.0,
                                    ),
                                    color: Colors.deepOrange,
                                  ),
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.white,
                                  tabs: [
                                    Tab(text: 'Haftalık'),
                                    Tab(text: 'Aylık'),
                                    Tab(text: 'Sezonluk'),
                                  ],
                                ),
                              ),
                              Container(

                                  height: MediaQuery.of(context).size.height-222,
                                  //height of TabBarView
                                  child: TabBarView(
                                      children: <Widget>[
                                    ///hafta
                                    Container(
                                      child: Column(

                                          children:[
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
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
                                                    getKazanHaftaCategory(int.parse(value.toString().substring(6,7))).whenComplete(() {
                                                      setState(() {
                                                        selectedValue=value;
                                                      });
                                                    });

                                                  },
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
                                                           Container(height: 50,alignment: Alignment.center,
                                                             decoration: BoxDecoration(
                                                               color: index==0?Color.fromARGB(255, 255, 215, 0):
                                                               index==1?Color.fromARGB(255, 192, 192, 192):
                                                               index==2?Color.fromARGB(255, 205, 127 , 20):
                                                               global.fantasyteamname==kazanansH['FantasyName']?Colors.white.withOpacity(0.7):
                                                               Colors.white.withOpacity(0.4)  ,
                                                               // Colors.blue.shade300,
                                                               borderRadius: BorderRadius.circular(25),

                                                             ),

                                                             margin: EdgeInsets.only(left: 15,right: 15),
                                                             child: ListTile(
                                                               leading: Text((index+1).toString(),
                                                                 style: TextStyle(fontSize: 28,color:index==0||global.fantasyteamname==kazanansH['FantasyName']?Colors.black: Colors.white,fontWeight: FontWeight.w900),
                                                               ),
                                                               title: Row(
                                                                 children: [
                                                                   Container(width: 1.25,height:70,color: Color(0xFF3366FF),),
                                                                   // SizedBox(width: 50,),
                                                                   Expanded(flex: 16,child: CircleAvatar(backgroundColor: Colors.green,child: Icon(Icons.person,color: Colors.white,),)),

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
                                                           SizedBox(height: 10   ,),
                                                         ],
                                                       );
                                                     }
                                                ),
                                              ),
                                            )
                                          ]
                                      ),
                                    ),
                                    ///ay
                                    Container(
                                      child: Column(
                                          children:[
                                            Expanded(flex: 1,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
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
                                                    getKazanAyCategory(int.parse(value.toString().substring(0,1))).whenComplete(() {
                                                      setState(() {
                                                        selectedValueAy=value;
                                                      });
                                                    });
                                                  },
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
                                                          Container(height: 50,alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                              color: index==0?Color.fromARGB(255, 255, 215, 0):
                                                              index==1?Color.fromARGB(255, 192, 192, 192):
                                                              index==2?Color.fromARGB(255, 205, 127 , 20):
                                                              global.fantasyteamname==kazanansH['FantasyName']?Colors.white.withOpacity(0.7):
                                                              Colors.white.withOpacity(0.4)  ,
                                                              // Colors.blue.shade300,
                                                              borderRadius: BorderRadius.circular(25),

                                                            ),

                                                            margin: EdgeInsets.only(left: 15,right: 15),
                                                            child: ListTile(
                                                              leading: Text((index+1).toString(),
                                                                style: TextStyle(fontSize: 28,color:index==0||global.fantasyteamname==kazanansH['FantasyName']?Colors.black: Colors.white,fontWeight: FontWeight.w900),
                                                              ),
                                                              title: Row(
                                                                children: [
                                                                  Container(width: 1.25,height:70,color: Color(0xFF3366FF),),
                                                                  // SizedBox(width: 50,),
                                                                  Expanded(flex: 16,child: CircleAvatar(backgroundColor: Colors.green,child: Icon(Icons.person,color: Colors.white,),)),

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
                                                          SizedBox(height: 10   ,),
                                                        ],
                                                      );
                                                    }
                                                ),
                                              ),
                                            )

                                          ]
                                      ),
                                    ),
                                    ///sezon
                                    Container(
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
                                                        Container(height: 50,alignment: Alignment.center,
                                                          decoration: BoxDecoration(
                                                            color: index==0?Color.fromARGB(255, 255, 215, 0):
                                                            index==1?Color.fromARGB(255, 192, 192, 192):
                                                            index==2?Color.fromARGB(255, 205, 127 , 20):
                                                            global.fantasyteamname==kazanansH['FantasyName']?Colors.white.withOpacity(0.7):
                                                            Colors.white.withOpacity(0.4)  ,
                                                            // Colors.blue.shade300,
                                                            borderRadius: BorderRadius.circular(25),

                                                          ),

                                                          margin: EdgeInsets.only(left: 15,right: 15),
                                                          child: ListTile(
                                                            leading: Text((index+1).toString(),
                                                              style: TextStyle(fontSize: 28,color:index==0||global.fantasyteamname==kazanansH['FantasyName']?Colors.black: Colors.white,fontWeight: FontWeight.w900),
                                                            ),
                                                            title: Row(
                                                              children: [
                                                                Container(width: 1.25,height:70,color: Color(0xFF3366FF),),
                                                                // SizedBox(width: 50,),
                                                                Expanded(flex: 16,child: CircleAvatar(backgroundColor: Colors.green,child: Icon(Icons.person,color: Colors.white,),)),

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
                                                        SizedBox(height: 10   ,),
                                                      ],
                                                    );
                                                  }
                                              ),
                                            ),

                                          ]
                                      ),
                                    ),
                                  ]))
                            ])),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
