
import 'package:flutter/material.dart';
import '../MenuPage.dart';
class FTLOdullerPaqe extends StatefulWidget {
  const FTLOdullerPaqe({Key key}) : super(key: key);

  @override
  _FTLOdullerPaqeState createState() => _FTLOdullerPaqeState();
}

class _FTLOdullerPaqeState extends State<FTLOdullerPaqe> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));
      },
      child: Scaffold(appBar: AppBar(title: Text('FTL ödüller nasıl kazanılır?'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));
        },),
      ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: RichText(
                text: TextSpan(
                    text: '\n',
                    style: TextStyle(color: Colors.black, fontSize: 16)
                    ,children: [
                  TextSpan(
                    text:  'Haftalık Lig ödülleri ;\n\n'

                    ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:  'FTL strateji oyununda, ilgili fikstür haftasında, oyundan en çok puan toplayan ve sıralamaya giren ilk 10 oyuncu (ödül alacak kişi sayısı haftadan haftaya değiştirilebilir) haftalık ödüle hak kazanır.\n\n'

                    ,style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text:  'Aylık Lig ödülleri ;\n\n'

                    ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:  'FTL strateji oyununda, ilgili ay ya da dönem kapsamında (ilgili ay ya da döneme denk gelen fikstür haftası toplamı) , oyundan en çok puan toplayan ve sıralamaya giren ilk 20 oyuncu (ödül alacak kişi sayısı Ay’dan ay’a değiştirilebilir) haftalık ödüle hak kazanır.\n\n'

                    ,style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text:  'Sezonluk Lig ödülleri ;\n\n'

                    ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:  'Sezonluk Lig ödüllerinin kapsamı, ne olacağı henüz belirlenmemiştir. İleriki zamanlarda durumu açıklanacaktır.\n\n'

                    ,style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text:  'FTL sadakat sistemi ödülleri ;\n\n'

                    ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:  'Takımını oluşturup, FTL liglerinin herhangi birine dahil olan her oyuncunun, indirim tutarı kazandığı yapıdır.'
                        'Oyuncuların, her hafta kazandıkları puanların bir kısmı (normal haftalarda puanın %30’u, derbi haftalarında puanın %50’si – ileriki zamanlarda bu oranların değiştirilme hakkı ALL R Yazılımda bulunmaktadır.) indirim tutarı  olarak, oyuncuya aktarılır.\n\n'

                    ,style: TextStyle(color: Colors.black),
                  ),

                  TextSpan(
                    text:  'Oyunumuzun ödüllendirme mekanizmalarında, çekiliş bulunmamakta olup, yarışma da tüm sorumluluk ALL R Yazılım’a aittir.\n\n'

                    ,style: TextStyle(color: Colors.black),
                  ),

                  TextSpan(
                    text:  'Google, Apple ya da bir başka yapının herhangi bir ilgisi ya da sorumluluğu bulunmamaktadır.\n\n'

                    ,style: TextStyle(color: Colors.black),
                  ),
                ]
                )),
          ),
        ),
      ),
    );
  }
}
