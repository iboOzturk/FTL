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
                      child: Text('Fantezi T??rkiye Lig (FTL) Sadakat Sistemi'
                       ' GENEL KULLANIM ??ART VE KO??ULLARI \n\n'
                          '1. Fantezi T??rkiye Lig (Bundan b??yle FTL olarak an??lacakt??r.) sadakat sistemi, ALL R Yaz??l??m Dan????manl??k Ticaret Limited ??irketi???ne (bundan b??yle ALL R Yaz??l??m olarak an??lacakt??r.) ait bir sistem olup, FTL uygulama oyuncular??, kullan??c?? olarak sistemden faydalan??r. \n\n'
                          '2. FTL sadakat sistemine giri?? i??in FTL oyuncusu olmak yeterlidir. ALL R Yaz??l??m, FTL sadakat sistemine giri?? i??in, oyuncular??ndan hi??bir ??ekilde ??cret talep etmeyecektir.\n\n'
                          '3. FTL sadakat sistemi indirim tutarlar??n??n, nerelerde kullan??labilece??i ile kullan??lacak marka ya da ??irketlerin giri?? linklerini, FTL uygulamas??ndan oyuncular ula??abileceklerdir.\n\n'
                          '4. FTL uygulamas?? ile FTL oyununu oynayan oyuncular??n, oyundan kazand??klar?? puanlar??n??n bir k??sm?? FTL sadakat sistemine, indirim tutar?? olarak aktar??l??r. FTL sadakat sistemine aktar??lacak indirim tutarlar??n??n miktar??n?? ve kullan??m s??resini ALL R Yaz??l??m belirler.\n\n'
                          '5. FTL sadakat sistemi indirim tutarlar??, sadece ALL R Yaz??l??m taraf??ndan anla??mal?? markalarda ya da ma??azalarda ve/veya online al????veri??lerde ge??erlidir. ??ndirim tutarlar?? hi??bir ??ekilde nakite ??evrilemez, sadece mal ve/veya hizmet al??mlar??nda indirim olarak kullan??l??r.\n\n'
                          '6. FTL sadakat sistemi indirim tutarlar??n??n, kullan??m miktarlar??, markadan markaya, ??r??nden ??r??ne, hizmetten hizmete farkl??l??klar g??sterebilir. ALL R Yaz??l??m, bu konuda tek belirleyici ??irkettir.\n\n'
                          '7. ALL R Yaz??l??m, gerekli g??rd?????? taktirde, FTL sadakat sistemini tamamen ya da k??smen ya da oyuncuya g??re iptal edebilir. ??ndirim tutarlar??n?? tamamen kald??rabilir ya da yok sayabilir\n\n'
                          '8. FTL sadakat sistemi indirim tutar?? kullan??larak sat??n al??nan bir ??r??n ve/veya hizmet i??in sat??n al??m?? yap??lan, ALL R Yaz??l??m anla??mal?? ??irketin/ma??azan??n genel kullan??m ve ??r??n iade ??artlar?? ge??erli olacakt??r. ALL R Yaz??l??m, sat??n al??nacak ??r??n ve/veya hizmetler ile ilgili hi??bir mesuliyet kabul etmez.\n\n'
                          '9. ALL R Yaz??l??m, burada ge??en FTL sadakat sistemi genel kullan??m ??art ve ko??ullar??n?? diledi??i zaman de??i??tirme ve/veya yeni maddeler ekleme hakk??n?? sakl?? tutar.\n\n'
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
                      child: Text('FTL ??d??ller nas??l kazan??l??r?\n\n'
                          ' Haftal??k Lig ??d??lleri ; \n\n'
                          'FTL strateji oyununda, ilgili fikst??r haftas??nda, oyundan en ??ok puan toplayan ve s??ralamaya giren ilk 10 oyuncu (??d??l alacak ki??i say??s?? haftadan haftaya de??i??tirilebilir) haftal??k ??d??le hak kazan??r.\n\n'
                          'Ayl??k Lig ??d??lleri ;\n\n'
                          'FTL strateji oyununda, ilgili ay ya da d??nem kapsam??nda (ilgili ay ya da d??neme denk gelen fikst??r haftas?? toplam??) , oyundan en ??ok puan toplayan ve s??ralamaya giren ilk 20 oyuncu (??d??l alacak ki??i say??s?? ay???dan ay???a de??i??tirilebilir) haftal??k ??d??le hak kazan??r.\n\n'
                          'Sezonluk Lig ??d??lleri ;\n\n'
                          'FTL sadakat sistemi ??d??lleri ;\n\n'
                          'Tak??m??n?? olu??turup, FTL liglerinin herhangi birine dahil olan her oyuncunun, indirim tutar?? kazand?????? yap??d??r. '
                          'Oyuncular??n, her hafta kazand??klar?? puanlar??n bir k??sm?? (normal haftalarda puan??n %30???u, derbi haftalar??nda puan??n %50???si ??? ileriki zamanlarda bu oranlar??n de??i??tirilme hakk?? ALL R Yaz??l??mda bulunmaktad??r.) indirim tutar??  olarak, oyuncuya aktar??l??r.\n\n'
                          'Oyunumuzun ??d??llendirme mekanizmalar??nda, ??ekili?? bulunmamakta olup, yar????ma da t??m sorumluluk ALL R Yaz??l??m???a aittir.\n\n'
                          'Google, Apple ya da bir ba??ka yap??n??n herhangi bir ilgisi ya da sorumlulu??u bulunmamaktad??r.\n\n'
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
                        'FTL Sadakat Sistemi ile ilgili bilgilendirme yaz??s??n?? okudum ve anlad??m',
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
                        'FTL ??d??l Ko??ullar?? ile ilgili bilgilendirme yaz??s??n?? okudum ve anlad??m',
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
                            'FTL Sadakat Sistemi ve FTL ??d??l Ko??ullar??n?? okudu??unuzu ve anlad??????n??z?? onaylaman??z gerekiyor.',
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
