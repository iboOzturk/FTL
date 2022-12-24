import 'package:fantasysuperlig/Screens/bannerpage.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Services/api_service.dart';
import '../../Services/player_api.dart';
import '../../Variables/global.dart' as global;
class RegisterPage2 extends StatefulWidget {
  @override
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  int sayac=0;
  String isim;
  String soyisim;
  String email;
  String sifre;
  String fta;
  String cinsiyet;
  String dogumyili;
  String telefonno;
  String beden;
  String adres;
  int KVKK;
  int FTLSS;
  takimlarigetir takimlogo=takimlarigetir();
  Giris _giris=Giris();
int sayi=0;
  @override
  void initState() {
    //takimlogo.getTakims();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double genislik=MediaQuery.of(context).size.width;
    double uzunluk=MediaQuery.of(context).size.height;

    var data1=[];
    data1=ModalRoute.of(context).settings.arguments;
    isim=data1[0];
    soyisim=data1[1];
    email=data1[2];
    sifre=data1[3];
    fta=data1[4];
   // cinsiyet=data1[5];
   // dogumyili=data1[6];
   // telefonno=data1[7];
   // beden=data1[8];
   // adres=data1[9];
    KVKK=data1[5];
    FTLSS=data1[6];
    Future<void> loginnes() async{
      if(email.length>0&&sifre.length>0){
        await _giris.LoginService2(
            email, sifre,global.androidId);
        debugPrint('kontrol: ' + _giris.loginkontrol.toString());
        var data = [];
        data.add(_giris.useremail);
        data.add(_giris.userid);

          if (_giris.loginkontrol != 0) {
            debugPrint('BAŞARILI');
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
      //  Navigator.pop(context, '/kvkk');
        Navigator.pop(context, '/register');
        Navigator.pop(context, '/register');
        Navigator.pop(context, '/register');

      },
      child: Scaffold(
        appBar: AppBar(title: Text('Yeni Üyelik Oluştur'),
       // backgroundColor: Color.fromARGB(255, 35, 0, 36),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    const Color(0xFF3366FF),
                    const Color(0xFF00CCFF),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: () {
         // Navigator.pop(context, '/ftlsadakat');
          Navigator.pop(context, '/register');
          Navigator.pop(context, '/register');
          Navigator.pop(context, '/register');
        },),
        bottom: PreferredSize(  preferredSize: Size.fromHeight(25),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(alignment: Alignment.center,
              width: genislik,child: Text('Favori Takımını Seç',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          ),
        ),
        ),
        body: FutureBuilder(
          future: takimlogo.getTakims(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: Container(
                width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
                color: Color(0xFF3366FF),
                child: Image.asset('assets/images/FTLlogo.png')));
          }
          return sayac==1?Center(child: CircularProgressIndicator(),):Container(
            width:genislik ,
            child: ListView.builder(
              itemCount: 20,
            itemBuilder:(BuildContext context,int i){

             return Container(
               decoration: BoxDecoration(
                 border: Border(bottom: BorderSide()),
               ),
               child: ListTile(
                  title: Text(takimlogo.takimler[i].TakimAdi),

                //  leading: Image.network(takimlogo.takimler[i].TakimLogo,width: 50,height: 50,),
                 onTap: () async{

                    await Register(isim, soyisim, fta, email, sifre, takimlogo.takimler[i].TakimId, KVKK).whenComplete(() {
                      if(global.registerdurum==1){

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              'Girilen mail adresi sistemde kayıtlı',
                              style: TextStyle(color: Colors.black),
                            )
                        ));
                        /* setState(() {
                         global.mailbool=true;
                         global.ftabool=false;
                         global.telnobool=false;

                       }); */
                        Navigator.pop(context, '/register');
                        Navigator.pop(context, '/register');
                        Navigator.pop(context, '/register');
                      }
                      else if(global.registerdurum==2){

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              'Seçtiğiniz Fantezi takım adı kullanılmaktadır',
                              style: TextStyle(color: Colors.black),
                            )
                        ));
                        /* setState(() {
                        global.ftabool=true;
                        global.mailbool=false;
                        global.telnobool=false;

                      }); */
                        Navigator.pop(context, '/register');
                        Navigator.pop(context, '/register');
                        Navigator.pop(context, '/register');
                      }
                      else if(global.registerdurum==3){

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              'Girilen telefon numarası sistemde kayıtlı',
                              style: TextStyle(color: Colors.black),
                            )
                        ));
                        /*  setState(() {
                        global.telnobool=true;
                        global.ftabool=false;
                        global.mailbool=false;
                      }); */
                        Navigator.pop(context, '/register');
                        Navigator.pop(context, '/register');
                        Navigator.pop(context, '/register');
                      }
                      else
                        {
                          setState(() {
                            sayac++;
                          });
                          loginnes();

                        }
                    });

                    //Navigator.pushNamed(context, '/login');
                 },
                ),
             );
      }
),
          ); }
        ),
      ),
    );
  }
}
