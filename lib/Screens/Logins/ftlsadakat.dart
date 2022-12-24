import 'package:flutter/material.dart';

class FTLSadakatPage extends StatefulWidget {
  @override
  _FTLSadakatPageState createState() => _FTLSadakatPageState();
}

class _FTLSadakatPageState extends State<FTLSadakatPage> {
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
  int ftlssid;
  bool FTLSS=false;
  bool FTLOK=false;
  //int kvkkid;
  //bool KVKK=false;
  @override
  Widget build(BuildContext context) {
    double genislik=MediaQuery.of(context).size.width;

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
   // KVKK==true? kvkkid=1:kvkkid=0;
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, '/register');
      },
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 63, 0, 64),
        appBar: AppBar(
          //backgroundColor: Color.fromARGB(255, 63, 0, 64),
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
            centerTitle: true,
            title: Text('FTL Sadakat Sistemi'),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                Navigator.pop(context, '/register');
              },
            )),
        body: Container(alignment: Alignment.center,
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
          child: Column(
            children: <Widget>[
            //  SizedBox(height: 20,),
              Expanded(flex: 6,
                child: Container(alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 1.08,
                 // height: MediaQuery.of(context).size.height / 1.4025,
                  height: MediaQuery.of(context).size.height / 2.8025,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(8.0) ,
                      child: Text('Fantezi Türkiye Lig (FTL) Sadakat Sistemi'
                       ' GENEL KULLANIM ŞART VE KOŞULLARI \n\n'
                          '1. Fantezi Türkiye Lig (Bundan böyle FTL olarak anılacaktır.) sadakat sistemi, ALL R Yazılım Danışmanlık Ticaret Limited Şirketi’ne (bundan böyle ALL R Yazılım olarak anılacaktır.) ait bir sistem olup, FTL uygulama oyuncuları, kullanıcı olarak sistemden faydalanır. \n\n'
                          '2. FTL sadakat sistemine giriş için FTL oyuncusu olmak yeterlidir. ALL R Yazılım, FTL sadakat sistemine giriş için, oyuncularından hiçbir şekilde ücret talep etmeyecektir.\n\n'
                          '3. FTL sadakat sistemi indirim tutarlarının, nerelerde kullanılabileceği ile kullanılacak marka ya da şirketlerin giriş linklerini, FTL uygulamasından oyuncular ulaşabileceklerdir.\n\n'
                          '4. FTL uygulaması ile FTL oyununu oynayan oyuncuların, oyundan kazandıkları puanlarının bir kısmı FTL sadakat sistemine, indirim tutarı olarak aktarılır. FTL sadakat sistemine aktarılacak indirim tutarlarının miktarını ve kullanım süresini ALL R Yazılım belirler.\n\n'
                          '5. FTL sadakat sistemi indirim tutarları, sadece ALL R Yazılım tarafından anlaşmalı markalarda ya da mağazalarda ve/veya online alışverişlerde geçerlidir. İndirim tutarları hiçbir şekilde nakite çevrilemez, sadece mal ve/veya hizmet alımlarında indirim olarak kullanılır.\n\n'
                          '6. FTL sadakat sistemi indirim tutarlarının, kullanım miktarları, markadan markaya, üründen ürüne, hizmetten hizmete farklılıklar gösterebilir. ALL R Yazılım, bu konuda tek belirleyici şirkettir.\n\n'
                          '7. ALL R Yazılım, gerekli gördüğü taktirde, FTL sadakat sistemini tamamen ya da kısmen ya da oyuncuya göre iptal edebilir. İndirim tutarlarını tamamen kaldırabilir ya da yok sayabilir\n\n'
                          '8. FTL sadakat sistemi indirim tutarı kullanılarak satın alınan bir ürün ve/veya hizmet için satın alımı yapılan, ALL R Yazılım anlaşmalı şirketin/mağazanın genel kullanım ve ürün iade şartları geçerli olacaktır. ALL R Yazılım, satın alınacak ürün ve/veya hizmetler ile ilgili hiçbir mesuliyet kabul etmez.\n\n'
                          '9. ALL R Yazılım, burada geçen FTL sadakat sistemi genel kullanım şart ve koşullarını dilediği zaman değiştirme ve/veya yeni maddeler ekleme hakkını saklı tutar.\n\n'
                         ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),


                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(flex: 6,
                child: Container(alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 1.08,
                  // height: MediaQuery.of(context).size.height / 1.4025,
                  height: MediaQuery.of(context).size.height / 2.8025,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(8.0) ,
                      child: Text('FTL ödüller nasıl kazanılır?\n\n'
                          ' Haftalık Lig ödülleri ; \n\n'
                          'FTL strateji oyununda, ilgili fikstür haftasında, oyundan en çok puan toplayan ve sıralamaya giren ilk 10 oyuncu (ödül alacak kişi sayısı haftadan haftaya değiştirilebilir) haftalık ödüle hak kazanır.\n\n'
                          'Aylık Lig ödülleri ;\n\n'
                          'FTL strateji oyununda, ilgili ay ya da dönem kapsamında (ilgili ay ya da döneme denk gelen fikstür haftası toplamı) , oyundan en çok puan toplayan ve sıralamaya giren ilk 20 oyuncu (ödül alacak kişi sayısı ay’dan ay’a değiştirilebilir) haftalık ödüle hak kazanır.\n\n'
                          'Sezonluk Lig ödülleri ;\n\n'
                          'FTL sadakat sistemi ödülleri ;\n\n'
                          'Takımını oluşturup, FTL liglerinin herhangi birine dahil olan her oyuncunun, indirim tutarı kazandığı yapıdır. '
                          'Oyuncuların, her hafta kazandıkları puanların bir kısmı (normal haftalarda puanın %30’u, derbi haftalarında puanın %50’si – ileriki zamanlarda bu oranların değiştirilme hakkı ALL R Yazılımda bulunmaktadır.) indirim tutarı  olarak, oyuncuya aktarılır.\n\n'
                          'Oyunumuzun ödüllendirme mekanizmalarında, çekiliş bulunmamakta olup, yarışma da tüm sorumluluk ALL R Yazılım’a aittir.\n\n'
                          'Google, Apple ya da bir başka yapının herhangi bir ilgisi ya da sorumluluğu bulunmamaktadır.\n\n'
                        ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),


                      ),
                    ),
                  ),
                ),
              ),
              Expanded(flex: 1,
                child: Row(
                  children: [
                    Checkbox(
                        value: FTLSS,
                        checkColor: Color.fromARGB(255, 63, 0, 64),
                        activeColor:  Colors.white,
                        onChanged: (bool value){

                          setState(() {
                            this.FTLSS = value;
                          });

                          print('KVKK: '+FTLSS.toString());

                        }),
                    Container(
                      width: genislik-60,
                      child: Text(
                        'FTL Sadakat Sistemi ile ilgili bilgilendirme yazısını okudum ve anladım',
                        textAlign: TextAlign.left,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
                          color: Colors.white),
                      ),
                    ),

                  ],
                ),
              ),
              Expanded(flex: 1,
                child: Row(
                  children: [
                    Checkbox(
                        value: FTLOK,
                        checkColor: Color.fromARGB(255, 63, 0, 64),
                        activeColor:  Colors.white,
                        onChanged: (bool value){

                          setState(() {
                            this.FTLOK = value;
                          });

                          print('KVKK: '+FTLOK.toString());

                        }),
                    Container(
                      width: genislik-60,
                      child: Text(
                        'FTL Ödül Koşulları ile ilgili bilgilendirme yazısını okudum ve anladım',
                        textAlign: TextAlign.left,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
                          color: Colors.white),
                      ),
                    ),

                  ],
                ),
              ),
              RaisedButton( child: Text('Devam'),color: Colors.white,elevation: 10,
                  onPressed: (){

                    if(FTLSS==false||FTLOK==false){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.white,
                          content: Text(
                            'FTL Sadakat Sistemi ve FTL Ödül Koşullarını okuduğunuzu ve anladığınızı onaylamanız gerekiyor.',
                            style: TextStyle(color: Colors.black),
                          )
                      )
                      );
                    }
                    else{
                      var data=[];
                      data.add(isim);
                      data.add(soyisim);
                      data.add(email);
                      data.add(sifre);
                      data.add(fta);
                     // data.add(cinsiyet);
                     // data.add(dogumyili);
                     // data.add(telefonno);
                     // data.add(beden);
                     // data.add(adres);
                      data.add(KVKK);
                      data.add(ftlssid);
                      Navigator.pushNamed(context, '/register2',arguments: data);

                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
