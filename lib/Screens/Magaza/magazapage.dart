import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fantasysuperlig/Screens/Magaza/ensofrapage.dart';
import 'package:fantasysuperlig/Screens/Magaza/kaptinkapitnpage.dart';
import 'package:fantasysuperlig/Screens/Magaza/kupongecmispage.dart';
import 'package:fantasysuperlig/Screens/Magaza/kuponolusturkaptinpage.dart';
import 'package:fantasysuperlig/Screens/Magaza/kuponolusturpage.dart';
import 'package:fantasysuperlig/Screens/Magaza/sadakatgecmispage.dart';
import 'package:fantasysuperlig/Screens/Magaza/yubaticaretpage.dart';
import 'package:fantasysuperlig/Screens/bannerpage.dart';
///Admob
//import 'package:fantasysuperlig/Services/admobservice.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
///Admob
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:line_icons/line_icons.dart';
import 'package:unity_ads_plugin/unity_ads.dart';
import '../../Variables/global.dart' as global;
import 'kuponolusturensofrapage.dart';

class MagazaPage extends StatefulWidget {
  @override
  _MagazaPageState createState() => _MagazaPageState();
}

class _MagazaPageState extends State<MagazaPage> {
  @override


  Future<Null> _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    getCardMoney();
    // getCaptains(global.userid);
    setState(() {
    });
  }
  Future<void> bannergetir() async{
    await getBanner(global.userid);
  }
  void waitLogin() async{
    await checkNetConnectivity();

    if(global.checkNetwork==false){
      _showDialog('Bağlantı Hatası', 'Lütfen internet bağlantınızı kontrol ediniz');
    }

  }

  checkNetConnectivity() async{
    var result=await Connectivity().checkConnectivity();
    if(result==ConnectivityResult.none){
      //checkNetwork=false;
      global.checkNetwork=false;
      //  _showDialog('net yok ', 'internetiniz yok');
    }
    else if(result==ConnectivityResult.wifi){
      global.checkNetwork=true;
      // checkNetwork=true;
      //_showDialog('wifi', 'wifi bağlı');
    }
    else if(result==ConnectivityResult.mobile){
      //checkNetwork=true;
      global.checkNetwork=true;

      //_showDialog('mobil veri', 'mobil veri bağlı');
    }
  }
  _showDialog(title,text){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(content: Text(text),title: Text(title),);
    });
  }

  @override
  void initState() {
    UnityAds.init(gameId: '4376159');
    waitLogin();
    // TODO: implement initState
    getBannerAds();

    //bannergetir();
    super.initState();
  }

  @override
  void dispose() {
    ///admob
    UnityAds.init(gameId: '4376159');
    // admobhelper.getbannerad().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double genislik=MediaQuery.of(context).size.width;
    double uzunluk=MediaQuery.of(context).size.height;
    return global.BannerID==0||global.BannerID==null?
    Scaffold(
      body: FutureBuilder(
        future: getCardMoney(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: Container(
                width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
                //  color: Color.fromARGB(255, 35, 0, 36),
                color: Colors.grey.shade900,

                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/FTLNewLogoBeyaz.png'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
                      child: Text('Yükleniyor...',style: TextStyle(color: Colors.white,fontSize: 24),),
                    )
                  ],
                )));
          }
        return Container(alignment: Alignment.topCenter,
          width: genislik,height: uzunluk,
          decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/FTLBackground.png'),fit: BoxFit.fill),

          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(alignment: Alignment.centerRight,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(height: 2,width: genislik*.1,color: Colors.orange,),
                            InkWell(onTap: () {
                              //  Navigator.push(context, MaterialPageRoute(builder: (context )=>KuponGesmisPage()));
                              Navigator.push(context, MaterialPageRoute(builder: (context )=>SadakatGecmisPage()));
                            },
                                child: Text('  SADAKAT GEÇMİŞİ',style: TextStyle(fontSize: 19,color: Colors.white,fontFamily: 'BebasNeue'),)),
                          ],
                        ),
                        Image.asset('assets/images/FTLNewLogo.png',width: 70,height: 70,fit: BoxFit.contain,),
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(onTap: () {
                            //  Navigator.push(context, MaterialPageRoute(builder: (context )=>KuponGesmisPage()));
                              Navigator.push(context, MaterialPageRoute(builder: (context )=>KuponGesmisPage()));
                            },
                                child: Text('KUPON GEÇMİŞİ  ',style: TextStyle(fontSize: 19,color: Colors.white,fontFamily: 'BebasNeue'),)),
                            Container(height: 2,width: genislik*.1,color: Colors.orange,),

                          ],
                        ),
                      ]
                    ),
                  ),
                  SizedBox(height: 15,),
                  SizedBox(height: 15,),
                  ///kart
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/kart.png',),fit: BoxFit.contain,),
                      //color: Color(0xff3366ff),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    width: 321.6,
                    height: 225,


                  //  width: genislik-45,
                  //  height: uzunluk*.257,

                    child: Row(
                      children: [
                      Expanded(flex:1,child: Column(
                        children: [
                          Expanded(flex: 1,child: Container(color: Colors.transparent,)),
                          Expanded(flex: 1,child: Container(alignment: Alignment.center,
                            color: Colors.transparent,
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(global.userName.toUpperCase()+' '+global.userSurname.toUpperCase(),
                                maxLines: 1,minFontSize: 15,
                                style: TextStyle(fontFamily: 'BebasNeue',fontSize: 33,color: Colors.white),textAlign: TextAlign.left,),
                                AutoSizeText(global.cardNumber==null?'xxxxxxxxxx': global.cardNumber,
                                    textAlign: TextAlign.left,maxLines: 1,minFontSize: 15,
                                    style: TextStyle(fontFamily: 'BebasNeue',fontSize: 33,color: Colors.orange.shade700))
                              ],
                            ),)),
                        ],
                      )),
                      Padding(
                        padding:  EdgeInsets.only(top: (uzunluk*.257)/2.2),
                        child: Container(alignment: Alignment.bottomCenter,width: 2,height: (uzunluk*.257)/2.5,color: Colors.orange.shade700,),
                      ),
                      Expanded(flex:1,child: Column(
                        children: [
                          Expanded(flex: 1,child: Container(color: Colors.transparent,)),
                          Expanded(flex: 1,child: Container(alignment: Alignment.center,
                            color: Colors.transparent,
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText('İndİrİm Tutarı',maxLines: 1,minFontSize: 15,style: TextStyle(fontFamily: 'BebasNeue',fontSize: 26,color: Colors.white)),
                                Text(global.indirimTutari.toString()=='null'?'0 TL':global.indirimTutari.toString()+'TL',
                                    style: TextStyle(fontFamily: 'BebasNeue',fontSize: 26,color: Colors.orange.shade700))
                              ],
                            ),)),

                        ],
                      ))
                    ],)
                  ),
                  SizedBox(height: 25,),
                  Container(width: genislik,height: 2,color: Colors.white,),
                  Container(
                    width: 400,height: 100,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15)
                    ),

                    alignment:Alignment.center,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('FTL sadakat sistemi indirim tutarlarınızı anlaşmalı markalarda kullanabileceksiniz'
                        ,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400)
                        ),
                        InkWell(
                          onTap: (){
                            showDialog(context: context, builder: (BuildContext context){
                              return AlertDialog(title: Text('FTL Sadakat Sistemi'),
                                content: Container(
                                  height: 400,child: SingleChildScrollView(
                                  child: RichText(
                                      text: TextSpan(
                                          text: '\n',
                                          style: TextStyle(color: Colors.black)
                                          ,children: [
                                        TextSpan(
                                          text:  'İndirim tutarı nedir? Nasıl kazanılır?\n\n'

                                          ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:  'Oyuncuların, FTL strateji oyunundan, her hafta kazandıkları puanların, bir kısmının (normal fikstür haftalarında %30’u, derbi haftalarında %50’si), FTL sadakat sisteminde, oyuncuya özel, indirim tutarlarına dönüşmektedir.\n\n'

                                          ,style: TextStyle(color: Colors.black),
                                        ),
                                        TextSpan(
                                          text:  'İndirim kuponu nedir? Nasıl kazanılır?\n\n'

                                          ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:  'Oyuncular, kazandıkları indirim tutarlarını, FTL sadakat sistemi anlaşmalı online mağazalardan/markalardan yapmak istedikleri alışverişlerde kullanmak için indirim tutarlarını, indirim kuponlarına çevirebilirler.\n\n'

                                          ,style: TextStyle(color: Colors.black),
                                        ),
                                        TextSpan(
                                          text:  'İndirim kuponu nasıl alınır?\n\n'

                                          ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:  'Oyuncu, FTL uygulamasından, FTL sadakat sistemi menüsüne girer. Bu menüde yer alan anlaşmalı mağaza/mağazalardan istediğine girerek indirim tutarını, indirim kuponuna çevirir. Çevirdiği indirim kuponunu, yine FTL uygulamasında verilen online mağaza linklerine girerek alışverişlerinde kullanabilir. Oyuncu, indirim tutarı miktarı kadar ancak indirim kuponu alabilir.\n\n'

                                          ,style: TextStyle(color: Colors.black),
                                        ),

                                        TextSpan(
                                          text:  'Anlaşmalı mağazalarda/markalarda indirim kuponu nasıl kullanılır?\n\n'

                                          ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:  'Oyuncunun, indirim tutarını dönüştürdüğü indirim kuponunu, sadece FTL anlaşmalı online mağazalarda/markalarda kullanabilecektir. '

                                              'Oyunculara, FTL anlaşmalı online mağazalardan alışveriş yapabilmeleri için FTL uygulaması içinde, FTL sadakat menüsünde, giriş linki bulunmaktadır.'
                                              'Oyuncular, giriş yaptıktan sonra satın almak istediği ürünü sepete ekler, sepetteki ürünü satın al kararını verdiğinde, ilgili mağazanın ‘İndirim Kuponu’ giriş ekranlarına, önceden satın aldıkları FTL indirim kuponu kodunun girişini yaparak, satın aldığı üründe, indirim kuponu miktarı kadar indirim oluşur. Ve geriye kalan fiyatı, oyuncunun ödeme yapması ile satın alma gerçekleşir ve indirim kuponu kullanılmış olur.\n\n'

                                          ,style: TextStyle(color: Colors.black),
                                        ),

                                        TextSpan(
                                          text:  'FTL sadakat sisteminde anlaşmalı online mağazalarda/markalarda yapılan alışverişlerde kullanılan FTL indirim kuponları alışveriş iptal ya da iade olunduğu takdirde FTL indirim kuponları geçersiz hale gelir tekrar iade edilmez.\n\n'

                                          ,style: TextStyle(color: Colors.black),
                                        ),
                                      ]
                                      )),
                                ),
                                ),);
                            });
                          },
                          child: Text('İndirim Kuponu nedir? Nasıl oluşturulur?',
                            style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.w400,decoration: TextDecoration.underline),),
                        )
                     //   Text('ÇOK YAKINDA',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Container(width: genislik,height: 2,color: Colors.white,),

                  SizedBox(height: 15,),
                  InkWell(
                    onTap: () {
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(content: Container(
                          height: 115,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:  InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>KuponOlusturPage()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(227, 7, 249, 136 ),
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        FaIcon(LineIcons.alternateTicket),
                                        Text('Kupon Oluştur'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>YubaTicaretPage()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(
                                            227, 7, 249, 136),
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.shopping_basket),
                                        Text('Alışveriş Yap'),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),);
                      });
                    },
                    child: Container(
                      width: 400,height: 75,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                   //     image: DecorationImage(image: NetworkImage('https://www.kaptinkaptin.net/Uploads/EditorUploads/logo-ben-yaptim-2-400x250.jpg'),
                        image: DecorationImage(image: AssetImage('assets/images/yubabeyaz.png'),
                        fit: BoxFit.contain,alignment: Alignment.centerLeft,),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)
                      ),

                      alignment:Alignment.center,
                      child: Text('             yubaticaret.com'
                          ,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Visibility(
                    visible: true,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(context: context, builder: (BuildContext context){
                              return AlertDialog(content: Container(
                                height: 115,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:  InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>KuponOlusturEnSofraPage()));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(227, 7, 249, 136 ),
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              FaIcon(LineIcons.alternateTicket),
                                              Text('Kupon Oluştur'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EnSofraPage()));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  227, 7, 249, 136),
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.shopping_basket),
                                              Text('Alışveriş Yap'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),);
                            });
                          },
                          child: Container(
                            width: 400,height: 75,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                //     image: DecorationImage(image: NetworkImage('https://www.kaptinkaptin.net/Uploads/EditorUploads/logo-ben-yaptim-2-400x250.jpg'),
                                image: DecorationImage(image: AssetImage('assets/images/ensofra.png'),
                                  fit: BoxFit.contain,alignment: Alignment.centerLeft,),
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15)
                            ),

                            alignment:Alignment.center,
                            child: Text('             ensofra.com'
                                ,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Visibility(
                    visible: true,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(context: context, builder: (BuildContext context){
                              return AlertDialog(content: Container(
                                height: 115,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:  InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>KuponOlusturKaptinPage()));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(227, 7, 249, 136 ),
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              FaIcon(LineIcons.alternateTicket),
                                              Text('Kupon Oluştur'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>KaptinKaptinPage()));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  227, 7, 249, 136),
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.shopping_basket),
                                              Text('Alışveriş Yap'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),);
                            });
                          },
                          child: Container(
                            width: 400,height: 75,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                //     image: DecorationImage(image: NetworkImage('https://www.kaptinkaptin.net/Uploads/EditorUploads/logo-ben-yaptim-2-400x250.jpg'),
                                image: DecorationImage(image: NetworkImage('https://www.kaptinkaptin.net/Uploads/EditorUploads/logo-ben-yaptim-2-400x250.jpg'),
                                  fit: BoxFit.contain,alignment: Alignment.centerLeft,),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                            ),

                            alignment:Alignment.center,
                            child: Text('             kaptinkaptin.net'
                                ,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                 ///Unity
                  /* global.adsBannerState==0?Text(''):Visibility(
                    visible: global.bannerReaklamHakki==1?true:false,
                    child: UnityBannerAd(placementId: 'Android_Ad_Banner',),
                  ),
                    */
                  ///Admob
                  /* global.adsBannerState==0?Expanded(flex: 1,child: Text('')): Expanded(
                    flex: 6,
                    child: Visibility(
                      visible: global.bannerReaklamHakki==1?true:false,
                      child: Container(
                        height: 50,
                        child: AdWidget(
                          ad:AdmobHelper.getBannerAd()..load(),
                          key: UniqueKey(),
                        ),
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ); }
      ),
    ):BannerPage();
  }
}
