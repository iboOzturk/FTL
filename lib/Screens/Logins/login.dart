import 'package:fantasysuperlig/Screens/Logins/forgotpasswordpage.dart';
import 'package:fantasysuperlig/Screens/Logins/welcome.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Utils/utils.dart';
import '../../Services/api_service.dart';
import '../../Variables/global.dart' as global;
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool sifrebool=false;

  Giris _giris=Giris();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  @override
  void initState() {
    _giris.getId();
    getPoints;
    setState(() {
      sifrebool=true;
    });
    super.initState();
  }

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
    return WillPopScope(
      onWillPop: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage() ));
      },
      child: Scaffold(
        //backgroundColor: Color(0xff5c5c5c),
        body: SingleChildScrollView(
          child: Container(alignment: Alignment.center,
            width: genislik,height: uzunluk,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/loginback.png'),fit: BoxFit.fill)
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/FTLlogo.png'),
                //Text('Giriş',style: BuyukSiyahBaslik,),
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.only(right: 20,left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(
                            color: Colors.white,
                            blurRadius: 20,
                            offset: Offset(0, 7)
                        )]
                    ),
                    child: Column(
                      children: <Widget>[
                        /* TextFormField(
                          autofocus: global.mailbool,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                         // validator: (value)=>EmailValidator.validate(value)?null:'Lütfen mail adresinizi giriniz',
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.black,width: 2)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.lightBlueAccent,width: 2)
                            ),
                            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                            hintText: 'Email',hintStyle: TextStyle(color: Colors.black),
                            //   errorText: _validatemail?'Lütfen mail adresinizi giriniz':null,

                          ),
                        ), */
                        /*  Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.black))
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.black))
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordController,
                            style: TextStyle(color: Colors.black),
                            obscureText: sifrebool,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon:sifrebool==false?Icon(Icons.remove_red_eye,color: Colors.blue,):Icon(Icons.remove_red_eye_outlined,color: Colors.red,),
                                  onPressed: () {
                                    setState(() {
                                      sifrebool==false?sifrebool=true:sifrebool=false;
                                    });
                                  },
                                ),
                                hintText: "Şifre",
                                hintStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none

                            ),
                          ),
                        ), */
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: EdgeInsets.only(right: 20,left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(
                            color: Colors.white,
                            blurRadius: 20,
                            offset: Offset(0, 7)
                        )]
                    ),
                    child: Column(
                      children: <Widget>[
                        /*   TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.emailAddress,
                          // validator: (value)=>EmailValidator.validate(value)?null:'Lütfen mail adresinizi giriniz',
                          cursorColor: Colors.black,
                          obscureText: true,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.black,width: 2)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.lightBlueAccent,width: 2)
                            ),
                            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                            hintText: 'Şifre',hintStyle: TextStyle(color: Colors.black),
                            //   errorText: _validatemail?'Lütfen mail adresinizi giriniz':null,

                          ),
                        ), */
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))

                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft:  Radius.circular(25))
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordController,
                            style: TextStyle(color: Colors.black),
                            obscureText: sifrebool,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon:sifrebool==false?Icon(Icons.remove_red_eye,color: Colors.blue,):Icon(Icons.remove_red_eye_outlined,color: Colors.red,),
                                  onPressed: () {
                                    setState(() {
                                      sifrebool==false?sifrebool=true:sifrebool=false;
                                    });
                                  },
                                ),
                                hintText: "Şifre",
                                hintStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),

                Padding(
                  padding: EdgeInsets.only(right: 50,left: 20),
                  child: Container(width: genislik,height: 20,alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassPage()));
                        },
                        child: Stack(
                          children: <Widget>[
                            // Stroked text as border.
                            Text(
                              'Şifremi unuttum',
                              style: TextStyle(
                                fontSize: 16,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 3
                                  ..color = Colors.black.withOpacity(0.4),
                              ),
                            ),
                            // Solid text as fill.
                            Text(
                              'Şifremi unuttum',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
                SizedBox(height: 15,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red.shade700,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.only(left: 100,right: 100,top: 15,bottom: 15)
                  ),
                  child: Text('Giriş Yap'),
                  onPressed: (){
                    loginnes();
                    //Navigator.pushNamed(context, '/menu');
                  },
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
