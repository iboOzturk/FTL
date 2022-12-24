import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Variables/global.dart' as global;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Utils/utils.dart';
import '../../Services/api_service.dart';
import '../../widgets/elevatedbuton.dart';
import '../MenuPage.dart';
import '../fantezimenu.dart';
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}
bool checkNetwork;

class _WelcomePageState extends State<WelcomePage> {
  int gk=0;
  Giris _giris=Giris();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  TextEditingController isimctrl=TextEditingController();
  TextEditingController soyisimctrl=TextEditingController();
  TextEditingController emailctrl=TextEditingController();
  TextEditingController sifrectrl=TextEditingController();
  TextEditingController fantasytakimadictrl=TextEditingController();

  bool _validateisim=false;
  bool _validatesoyisim=false;
  bool _validatemail=false;
  bool _validatesifre=false;
  bool _validatefta=false;
  bool ema=false;

  int isimicon=0;
  int soyisimicon=0;
  int mailicon=0;
  int sifreicon=0;
  int ftaicon=0;


  DateTime backbuttonpressedTime;
  Giris giris=Giris();

  void waitLogin() async{
    await checkNetConnectivity();
    await getVersion();
    print('Android Verison: '+global.NowVersion);
    if(checkNetwork==false){
      _showDialog('Bağlantı Hatası', 'Lütfen internet bağlantınızı kontrol ediniz');
    }
    else if(global.NowVersion != global.androidVersiyon){
      _LoginshowDialog();
    }

  }
  void Login()async{
   await giris.LoginService2('bos', 'bos', global.androidId);
  }
  @override
  void initState() {
    Login();
    waitLogin();
   // giris.getId();
      giris.getToken();
    //giris.LoginService2('bos', 'bos', global.androidId);
    setState(() {
      global.telnobool=false;
      global.ftabool=false;
      global.mailbool=false;
    });
    super.initState();
  }
  int sayi=0;

  @override
  Widget build(BuildContext context) {
    double uzunluk=MediaQuery.of(context).size.height;
    double genislik=MediaQuery.of(context).size.width;
    Future<void> loginnes() async{
      if(_emailController.text.length>0&&_passwordController.text.length>0){
        await _giris.LoginService2(
            _emailController.text, _passwordController.text,global.androidId);
        debugPrint('kontrol: ' + _giris.loginkontrol.toString());
        var data = [];
        data.add(_giris.useremail);
        data.add(_giris.userid);

        if (_giris.loginkontrol != 0) {
          debugPrint('BAŞARILI');
          getBanner(_giris.userid);
          global.selectIndex = 2;
          //await getPoints2(global.userid);
          Navigator.pushNamed(context, '/menu', arguments: data);
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>YeniHomePage2(),settings: RouteSettings(arguments: data)));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 150,
                  child: Text('Kullanıcı adı veya Şifre hatalı'))));
          debugPrint('HATALI GİRis');
        }

        /* else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    title: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Uygulamayı güncelleyiniz',
                          style: TextStyle(color: Colors.white),
                        )),
                    content: Container(
                        height: 50,
                        decoration: BoxDecoration(color: Colors.red),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                SystemNavigator.pop();

                                launch(
                                    'https://play.google.com/store/apps/details?id=com.allr.fanteziturkiyelig');
                                //  Navigator.pushNamed(context, '/menu');
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>StatisticsPage()));
                              },
                              child: Text(
                                "Tamam",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        )));
              });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 150,
                  child: Text('Uygulamayı güncelleyiniz'))));
        }*/
      }
      else{
        print('email ve şifre girmedi');
      }
    }
    void kayitol(){
      setState(() {
        isimctrl.text.isEmpty||isimctrl.text.length<2 ?_validateisim=true:_validateisim=false;
      });
      setState(() {
        soyisimctrl.text.isEmpty||soyisimctrl.text.length<2?_validatesoyisim=true:_validatesoyisim=false;
      });
      setState(() {
        emailctrl.text.isEmpty?_validatemail=true:_validatemail=false;
      });
      setState(() {
        sifrectrl.text.isEmpty?_validatesifre=true:_validatesifre=false;
      });

      setState(() {
        fantasytakimadictrl.text.isEmpty||fantasytakimadictrl.text.length<3?_validatefta=true:_validatefta=false;
      });


      if(_validateisim==true||_validatesoyisim==true||
          _validatemail==true||_validatesifre==true||
          _validatefta==true||
          EmailValidator.validate(emailctrl.text)==false
      )
      {
        setState(() {
          ema=true;
        });
        print('hataa');
      }

      else{
        var data=[];
        data.add(isimctrl.text);
        data.add(soyisimctrl.text);
        data.add(emailctrl.text);
        data.add(sifrectrl.text);
        data.add(fantasytakimadictrl.text.isEmpty?'bos':fantasytakimadictrl.text);
        Navigator.pushNamed(context, '/kvkk',arguments: data);
      }
    }

    void girise() async{
      await checkNetConnectivity();
      await giris.LoginService2('bos','bos',global.androidId);
      if(checkNetwork==false){
        _showDialog('Bağlantı Hatası', 'Lütfen internet bağlantınızı kontrol ediniz');
      }
      else
        {

          Navigator.pushNamed(context, '/login',);
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>YeniHomePage2(),settings: RouteSettings(arguments: data)));
        }
       // global.userid>0?Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage())):
    }
    return WillPopScope(
       // onWillPop: () async => false,
        onWillPop: onWillPop,
      child:  Scaffold(
          //backgroundColor: Color(0xff5c5c5c),
          body:  global.NowVersion != global.AndroidVersion || global.userid==null?
          SingleChildScrollView(
            child: Form(
              autovalidate: ema,
              child: Container(alignment: Alignment.topCenter,
                width: genislik,height: uzunluk,
                decoration: BoxDecoration(
                   // image: DecorationImage(image: AssetImage('assets/images/loginback.png'),fit: BoxFit.fill)
                    image: DecorationImage(image: AssetImage('assets/images/FTLBackground.png'),fit: BoxFit.cover,)
                ),
                child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/images/FTLBallUp.png',
                              fit: BoxFit.contain,
                              height: 110,
                            )),
                        //  SizedBox(height: 25,),

                        Expanded(
                          flex: 7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              gk == 0 ? Image.asset('assets/images/FTLNewLogo.png',
                                      fit: BoxFit.cover, height: 200, width: 200,
                                    )
                                  : Image.asset('assets/images/FTLNewLogo.png',
                                      fit: BoxFit.cover, height: 85, width: 85,
                                    ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 60,
                                width: genislik * .65,
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(7)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            gk == 0
                                                ? null
                                                : setState(() {
                                                    gk = 0;
                                                  });
                                          },
                                          child: Container(
                                            height: 57,
                                            decoration: BoxDecoration(
                                                color: gk == 0
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            alignment: Alignment.center,
                                            child: AutoSizeText(
                                              'Giriş Yap',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19,
                                                color: gk == 1
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                              maxLines: 1,
                                              maxFontSize: 25,
                                              minFontSize: 19,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            gk == 1
                                                ? null
                                                : setState(() {
                                                    gk = 1;
                                                  });
                                          },
                                          child: Container(
                                            height: 57,
                                            decoration: BoxDecoration(
                                                color: gk == 1
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            alignment: Alignment.center,
                                            child: AutoSizeText(
                                              'Kayıt Ol',
                                              style: TextStyle(
                                                color: gk == 0
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19,
                                              ),
                                              maxLines: 1,
                                              maxFontSize: 25,
                                              minFontSize: 19,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              ///Giriş
                              Visibility(
                                visible: gk == 0 ? true : false,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: genislik * .65,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white60,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                            prefix: Icon(
                                              Icons.cancel,
                                              color: Colors.transparent,
                                            ),
                                            hintText: 'Email',
                                            hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: genislik * .65,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white60,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText: true,
                                        controller: _passwordController,
                                        decoration: InputDecoration(
                                            prefix: Icon(
                                              Icons.cancel,
                                              color: Colors.transparent,
                                            ),
                                            hintText: 'Şifre',
                                            hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              ///Kayıt Ol
                              Visibility(
                                visible: gk == 1 ? true : false,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: genislik * .65,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white60,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: TextFormField(
                                        controller: isimctrl,
                                        keyboardType: TextInputType.name,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            isimicon == 0
                                                ? setState(() {
                                                    isimicon = 1;
                                                  })
                                                : null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          //  prefix: Icon(Icons.cancel,color: Colors.transparent,),
                                          prefix: isimicon == 0
                                              ? Icon(
                                                  Icons.cancel,
                                                  color: Colors.transparent,
                                                )
                                              : Text('  İsim: ',
                                                  style:
                                                      TextStyle(fontSize: 14)),

                                          hintText: 'İsim',
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorText: _validateisim
                                              ? 'Lütfen adınızı giriniz'
                                              : null,
                                          errorStyle: TextStyle(
                                              height: 0, color: Colors.white),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              borderSide: BorderSide(
                                                  color: Colors.red.shade600,
                                                  width: 2)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: genislik * .65,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white60,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: TextFormField(
                                        keyboardType: TextInputType.name,
                                        controller: soyisimctrl,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            soyisimicon == 0
                                                ? setState(() {
                                                    soyisimicon = 1;
                                                  })
                                                : null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          //  prefix: Icon(Icons.cancel,color: Colors.transparent,),
                                          prefix: soyisimicon == 0
                                              ? Icon(
                                                  Icons.cancel,
                                                  color: Colors.transparent,
                                                )
                                              : Text('  Soyisim: ',
                                                  style:
                                                      TextStyle(fontSize: 14)),

                                          hintText: 'Soyisim',
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorText: _validatesoyisim
                                              ? 'Lütfen soyadınız giriniz'
                                              : null,
                                          errorStyle: TextStyle(
                                              height: 0, color: Colors.white),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              borderSide: BorderSide(
                                                  color: Colors.red.shade600,
                                                  width: 2)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: genislik * .65,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white60,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: TextFormField(
                                        maxLines: 1,
                                        controller: emailctrl,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) => EmailValidator
                                                .validate(value)
                                            ? null
                                            : 'Lütfen mail adresinizi giriniz',
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            mailicon == 0
                                                ? setState(() {
                                                    mailicon = 1;
                                                  })
                                                : null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          //  prefix: Icon(Icons.cancel,color: Colors.transparent,),
                                          prefix: mailicon == 0
                                              ? Icon(
                                                  Icons.cancel,
                                                  color: Colors.transparent,
                                                )
                                              : Text('  Email: ',
                                                  style:
                                                      TextStyle(fontSize: 14)),
                                          // labelText: 'Email',
                                          // labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19),
                                          hintText: 'Email',
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),

                                          enabledBorder: InputBorder.none,
                                          // focusedBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorStyle: TextStyle(
                                              height: 0, color: Colors.white),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              borderSide: BorderSide(
                                                  color: Colors.red.shade600,
                                                  width: 2)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: genislik * .65,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white60,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: TextFormField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        controller: sifrectrl,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            sifreicon == 0
                                                ? setState(() {
                                                    sifreicon = 1;
                                                  })
                                                : null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          prefix: sifreicon == 0
                                              ? Icon(
                                                  Icons.cancel,
                                                  color: Colors.transparent,
                                                )
                                              : Text('  Şifre: ',
                                                  style:
                                                      TextStyle(fontSize: 14)),
                                          // prefix: Icon(Icons.cancel,color: Colors.transparent,),
                                          hintText: 'Şifre',
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorText: _validatesifre
                                              ? 'Lütfen şifrenizi giriniz'
                                              : null,
                                          errorStyle: TextStyle(
                                              height: 0, color: Colors.white),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              borderSide: BorderSide(
                                                  color: Colors.red.shade600,
                                                  width: 2)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: genislik * .65,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white60,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: TextFormField(
                                        controller: fantasytakimadictrl,
                                        keyboardType: TextInputType.name,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            ftaicon == 0
                                                ? setState(() {
                                                    ftaicon = 1;
                                                  })
                                                : null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          prefix: ftaicon == 0
                                              ? Icon(
                                                  Icons.cancel,
                                                  color: Colors.transparent,
                                                )
                                              : Text(
                                                  '  Fantezi Takım Adı: ',
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                          // prefix: Icon(Icons.cancel,color: Colors.transparent,),
                                          hintText: 'Fantezi Takım Adı',
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorText: _validatefta
                                              ? 'Lütfen Fantezi takım adınızı giriniz'
                                              : null,
                                          errorStyle: TextStyle(
                                              height: 0, color: Colors.white),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              borderSide: BorderSide(
                                                  color: Colors.red.shade600,
                                                  width: 2)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  gk == 0 ? loginnes() : kayitol();
                                },
                                child: Container(
                                  height: 55,
                                  width: genislik * .45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Text(
                                    gk == 0 ? 'Giriş' : 'Kayıt Ol',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /*  InkWell(
                      onTap: () {
                        girise();
                      },
                      child: Container(
                        width: genislik-140,height: 50,decoration: BoxDecoration(
                        color: Colors.white,borderRadius: BorderRadius.circular(15),
                      ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.login),
                            SizedBox(width: 10,),
                            Text('Giriş Yap',style: GirisSiyah,textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),
                    InkWell(
                      onTap: () async{
                        await checkNetConnectivity();
                        await giris.LoginService2('bos','bos',global.androidId);

                        if(checkNetwork==false){
                          _showDialog('Bağlantı Hatası', 'Lütfen internet bağlantınızı kontrol ediniz');
                        }

                        else{
                          Navigator.pushNamed(context, '/register');
                        }
                      },
                      child: Container(
                        width: genislik-140,height: 50,decoration: BoxDecoration(
                        color: Colors.white,borderRadius: BorderRadius.circular(15),
                      ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person),
                            Text('Yeni Üyelik',style: GirisSiyah,textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),*/
                        //    SizedBox(height: 20,),
                        /*    Text('VEYA',style: TextStyle(color: Colors.white,fontSize: 20),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 72,right: 72),
                      child: ElevatedButton(onPressed: (){}, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.g_mobiledata,size: 30,),
                          Text('Google ile giriş yap'),
                        ],
                      ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),shadowColor: Colors.white,elevation: 10,
                            primary: Colors.white,onPrimary: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 72,right: 72),
                  child: ElevatedButton(onPressed: (){}, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook),
                      SizedBox(width: 10,),
                      Text('Facebook ile bağlan'),
                    ],
                  ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),shadowColor: Colors.white,elevation: 10,
                        primary: Colors.blue.shade700,onPrimary: Colors.black,
                    ),
                  ),
                ), */
                        //Spacer(),
                        Expanded(
                            flex: 1,
                            child: Image.asset('assets/images/FTLBallDown.png',
                                fit: BoxFit.cover, height: 110)),
                      ],
                    ),
                  ),
            ),
          ): global.userid>0?MenuPage():
          Container(alignment: Alignment.center,
            width: genislik,height: uzunluk,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/FTLBackground.png'),fit: BoxFit.fill)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/FTLBallUp.png',
                      fit: BoxFit.contain,
                      height: 110,
                    )),
                //  SizedBox(height: 25,),

                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      gk == 0
                          ? Image.asset(
                        'assets/images/FTLNewLogo.png',
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      )
                          : Image.asset(
                        'assets/images/FTLNewLogo.png',
                        fit: BoxFit.cover,
                        height: 85,
                        width: 85,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 60,
                        width: genislik * .65,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    gk == 0
                                        ? null
                                        : setState(() {
                                      gk = 0;
                                    });
                                  },
                                  child: Container(
                                    height: 57,
                                    decoration: BoxDecoration(
                                        color: gk == 0
                                            ? Colors.white
                                            : Colors.transparent,
                                        borderRadius:
                                        BorderRadius.circular(5)),
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      'Giriş Yap',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                        color: gk == 1
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      maxLines: 1,
                                      maxFontSize: 25,
                                      minFontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    gk == 1
                                        ? null
                                        : setState(() {
                                      gk = 1;
                                    });
                                  },
                                  child: Container(
                                    height: 57,
                                    decoration: BoxDecoration(
                                        color: gk == 1
                                            ? Colors.white
                                            : Colors.transparent,
                                        borderRadius:
                                        BorderRadius.circular(5)),
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      'Kayıt Ol',
                                      style: TextStyle(
                                        color: gk == 0
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                      ),
                                      maxLines: 1,
                                      maxFontSize: 25,
                                      minFontSize: 19,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///Giriş
                      Visibility(
                        visible: gk == 0 ? true : false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: genislik * .65,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius:
                                  BorderRadius.circular(7)),
                              child: TextFormField(
                                keyboardType:
                                TextInputType.emailAddress,
                                controller: _emailController,
                                decoration: InputDecoration(
                                    prefix: Icon(
                                      Icons.cancel,
                                      color: Colors.transparent,
                                    ),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: genislik * .65,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius:
                                  BorderRadius.circular(7)),
                              child: TextFormField(
                                keyboardType:
                                TextInputType.visiblePassword,
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    prefix: Icon(
                                      Icons.cancel,
                                      color: Colors.transparent,
                                    ),
                                    hintText: 'Şifre',
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///Kayıt Ol
                      Visibility(
                        visible: gk == 1 ? true : false,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: genislik * .65,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius:
                                  BorderRadius.circular(7)),
                              child: TextFormField(
                                controller: isimctrl,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    isimicon == 0
                                        ? setState(() {
                                      isimicon = 1;
                                    })
                                        : null;
                                  }
                                },
                                decoration: InputDecoration(
                                  //  prefix: Icon(Icons.cancel,color: Colors.transparent,),
                                  prefix: isimicon == 0
                                      ? Icon(
                                    Icons.cancel,
                                    color: Colors.transparent,
                                  )
                                      : Text('  İsim: ',
                                      style:
                                      TextStyle(fontSize: 14)),

                                  hintText: 'İsim',
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorText: _validateisim
                                      ? 'Lütfen adınızı giriniz'
                                      : null,
                                  errorStyle: TextStyle(
                                      height: 0, color: Colors.white),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                          color: Colors.red.shade600,
                                          width: 2)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: genislik * .65,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius:
                                  BorderRadius.circular(7)),
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                controller: soyisimctrl,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    soyisimicon == 0
                                        ? setState(() {
                                      soyisimicon = 1;
                                    })
                                        : null;
                                  }
                                },
                                decoration: InputDecoration(
                                  //  prefix: Icon(Icons.cancel,color: Colors.transparent,),
                                  prefix: soyisimicon == 0
                                      ? Icon(
                                    Icons.cancel,
                                    color: Colors.transparent,
                                  )
                                      : Text('  Soyisim: ',
                                      style:
                                      TextStyle(fontSize: 14)),

                                  hintText: 'Soyisim',
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorText: _validatesoyisim
                                      ? 'Lütfen soyadınız giriniz'
                                      : null,
                                  errorStyle: TextStyle(
                                      height: 0, color: Colors.white),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                          color: Colors.red.shade600,
                                          width: 2)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: genislik * .65,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius:
                                  BorderRadius.circular(7)),
                              child: TextFormField(
                                maxLines: 1,
                                controller: emailctrl,
                                keyboardType:
                                TextInputType.emailAddress,
                                validator: (value) => EmailValidator
                                    .validate(value)
                                    ? null
                                    : 'Lütfen mail adresinizi giriniz',
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    mailicon == 0
                                        ? setState(() {
                                      mailicon = 1;
                                    })
                                        : null;
                                  }
                                },
                                decoration: InputDecoration(
                                  //  prefix: Icon(Icons.cancel,color: Colors.transparent,),
                                  prefix: mailicon == 0
                                      ? Icon(
                                    Icons.cancel,
                                    color: Colors.transparent,
                                  )
                                      : Text('  Email: ',
                                      style:
                                      TextStyle(fontSize: 14)),
                                  // labelText: 'Email',
                                  // labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),

                                  enabledBorder: InputBorder.none,
                                  // focusedBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorStyle: TextStyle(
                                      height: 0, color: Colors.white),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                          color: Colors.red.shade600,
                                          width: 2)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: genislik * .65,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius:
                                  BorderRadius.circular(7)),
                              child: TextFormField(
                                keyboardType:
                                TextInputType.visiblePassword,
                                controller: sifrectrl,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    sifreicon == 0
                                        ? setState(() {
                                      sifreicon = 1;
                                    })
                                        : null;
                                  }
                                },
                                decoration: InputDecoration(
                                  prefix: sifreicon == 0
                                      ? Icon(
                                    Icons.cancel,
                                    color: Colors.transparent,
                                  )
                                      : Text('  Şifre: ',
                                      style:
                                      TextStyle(fontSize: 14)),
                                  // prefix: Icon(Icons.cancel,color: Colors.transparent,),
                                  hintText: 'Şifre',
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorText: _validatesifre
                                      ? 'Lütfen şifrenizi giriniz'
                                      : null,
                                  errorStyle: TextStyle(
                                      height: 0, color: Colors.white),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                          color: Colors.red.shade600,
                                          width: 2)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: genislik * .65,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius:
                                  BorderRadius.circular(7)),
                              child: TextFormField(
                                controller: fantasytakimadictrl,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    ftaicon == 0
                                        ? setState(() {
                                      ftaicon = 1;
                                    })
                                        : null;
                                  }
                                },
                                decoration: InputDecoration(
                                  prefix: ftaicon == 0
                                      ? Icon(
                                    Icons.cancel,
                                    color: Colors.transparent,
                                  )
                                      : Text(
                                    '  Fantezi Takım Adı: ',
                                    style:
                                    TextStyle(fontSize: 14),
                                  ),
                                  // prefix: Icon(Icons.cancel,color: Colors.transparent,),
                                  hintText: 'Fantezi Takım Adı',
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorText: _validatefta
                                      ? 'Lütfen Fantezi takım adınızı giriniz'
                                      : null,
                                  errorStyle: TextStyle(
                                      height: 0, color: Colors.white),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                          color: Colors.red.shade600,
                                          width: 2)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          gk == 0 ? loginnes() : kayitol();
                        },
                        child: Container(
                          height: 55,
                          width: genislik * .45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            gk == 0 ? 'Giriş' : 'Kayıt Ol',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /*  InkWell(
                      onTap: () {
                        girise();
                      },
                      child: Container(
                        width: genislik-140,height: 50,decoration: BoxDecoration(
                        color: Colors.white,borderRadius: BorderRadius.circular(15),
                      ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.login),
                            SizedBox(width: 10,),
                            Text('Giriş Yap',style: GirisSiyah,textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),
                    InkWell(
                      onTap: () async{
                        await checkNetConnectivity();
                        await giris.LoginService2('bos','bos',global.androidId);

                        if(checkNetwork==false){
                          _showDialog('Bağlantı Hatası', 'Lütfen internet bağlantınızı kontrol ediniz');
                        }

                        else{
                          Navigator.pushNamed(context, '/register');
                        }
                      },
                      child: Container(
                        width: genislik-140,height: 50,decoration: BoxDecoration(
                        color: Colors.white,borderRadius: BorderRadius.circular(15),
                      ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person),
                            Text('Yeni Üyelik',style: GirisSiyah,textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),*/
                //    SizedBox(height: 20,),
                /*    Text('VEYA',style: TextStyle(color: Colors.white,fontSize: 20),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 72,right: 72),
                      child: ElevatedButton(onPressed: (){}, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.g_mobiledata,size: 30,),
                          Text('Google ile giriş yap'),
                        ],
                      ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),shadowColor: Colors.white,elevation: 10,
                            primary: Colors.white,onPrimary: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 72,right: 72),
                  child: ElevatedButton(onPressed: (){}, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook),
                      SizedBox(width: 10,),
                      Text('Facebook ile bağlan'),
                    ],
                  ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),shadowColor: Colors.white,elevation: 10,
                        primary: Colors.blue.shade700,onPrimary: Colors.black,
                    ),
                  ),
                ), */
                //Spacer(),
                Expanded(
                    flex: 1,
                    child: Image.asset('assets/images/FTLBallDown.png',
                        fit: BoxFit.cover, height: 110)),
              ],
            ),
          ),
        ),
    );
  }
  Future<bool> onWillPop() async{
    DateTime currentTime=DateTime.now();
    bool backButton=backbuttonpressedTime==null||currentTime.difference(backbuttonpressedTime)>Duration(seconds: 3);
    if(backButton){
      backbuttonpressedTime=currentTime;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Uygulamayı kapatmak için bir kere daha geri tuşuna basın')));
      return false;
    }
    SystemNavigator.pop();
    return true;
  }
  checkNetConnectivity() async{
    var result=await Connectivity().checkConnectivity();
    if(result==ConnectivityResult.none){
      checkNetwork=false;
    //  _showDialog('net yok ', 'internetiniz yok');
    }
    else if(result==ConnectivityResult.wifi){
      checkNetwork=true;
      //_showDialog('wifi', 'wifi bağlı');
    }
    else if(result==ConnectivityResult.mobile){
      checkNetwork=true;

     // _showDialog('mobil veri', 'mobil veri bağlı');
    }
  }
  _showDialog(title,text){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(content: Text(text),title: Text(title),);
    });
  }
  _LoginshowDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              title: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Uygulamayı güncelleyiniz',
                    style: TextStyle(color: Colors.white),
                  )),
              content: Container(
                  height: 50,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          SystemNavigator.pop();

                          launch(
                              'https://play.google.com/store/apps/details?id=com.allr.fanteziturkiyelig');
                          //  Navigator.pushNamed(context, '/menu');
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>StatisticsPage()));
                        },
                        child: Text(
                          "Güncelle",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Navigator.pop(context);
                          //  Navigator.pushNamed(context, '/menu');
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>StatisticsPage()));
                        },
                        child: Text(
                          "Daha sonra",
                          style: TextStyle(
                              color: Colors.white,

                              fontSize: 20),
                        ),
                      ),
                    ],
                  )));
        });
  }
}
