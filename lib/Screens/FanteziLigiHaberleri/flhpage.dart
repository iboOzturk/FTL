import 'package:fantasysuperlig/Screens/MenuPage.dart';
import 'package:flutter/material.dart';
class FanteziLigiHaberPage extends StatefulWidget {
  @override
  _FanteziLigiHaberPageState createState() => _FanteziLigiHaberPageState();
}

class _FanteziLigiHaberPageState extends State<FanteziLigiHaberPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamed(context, '/menu');
      },
      child: Scaffold(
          appBar: AppBar(centerTitle: true,title: Text('Fantezi Ligi Haberleri'),
            leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: () {
            Navigator.pushNamed(context, '/menu');
          },),),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Text('FTL ekibinin tercihi ;'),
                Row(
                  children: [
                    Expanded(flex: 1,child: Image.asset('assets/images/ftlekip1.jpg',height: 325,)),
                    Expanded(flex: 1,child: Image.asset('assets/images/ftlekip2.jpg',height: 325)),
                  ],
                ),
                Text('FTL takımımızın ilk haftaya 3-5-2 ile başlamasına karar verdik. İlk hafta itibariyle Orta saha oyuncularımızı kalabalık tuttuk.\n\n'
                    'Kalecimiz Altay (5,5M) geçen yıl performansı ve hırsı ile bu yıl bu fiyatın üzerinde performans göstereceğini düşünmekteyiz. 4-5 hafta sonra takımınızın değerini arttıracak bir performans görebiliriz.'
                    'Yedek kalecimiz için bütçemizi bir miktar azaltmaya karar verdik. Konyaspor defansına güveniyoruz ve tercihimiz Sehic (5M).\n\n'
                    'Defansımızı 3 futbolcu ile minimumda tutmaya çalıştık. İlk hafta gollü geçebilir. Defans için en yüksek bütçeyi  R.Donk (6,5M) için harcadık. R.Donk aynı zamanda da gole yakın bir defans futbolcusu, atacağı goller ile bize ekstra puanlar kazandırabilir. Welinton (6M) ile takımının az gol yemesini de hesaplayarak, tercih ettiğimiz diğer bir defans.'
                    'Fikstür sonrası Guilherme(5,5M), Uğur(6M), Katranis(5,5M) arasında bir tercih yapacağız.\n\n'
                    'Takım kaptanımızı, geçen yıl ki 7 gol, 5 asist performansı ile  Nwakaeme(8,5M) olarak belirledik. Edin Visca(7,5M) geçen yıl ki 5 gol, 8 asist performası ile takımımıza aldığımız diğer bir orta saha futbolcumuz. Arda Turan(6M), bizce bu bütçenin üzerinde olmalıydı ama geçen yıl ki 4 gol, 2 asist performansı sebebiyle bu fiyat açılmış. Bu yıl 4-5 haftada bu değerin üzerinde fiyatlanabilir, takımımıza aldık. Thiam(7,5M), bu yıl ki performansını daha yukarda beklediğimiz diğer bir futbolcumuz. Kenan Özer (7M), takımının orta sahasında önemli bir değer, kendisine güvendik ve takımımıza aldık.\n\n'
                    'Yedek kaptanımızı, forvetten seçtik. Şampiyon takımın golcüsü Aboubakar(10M), 15 gol, 5 asist performansa sahip. İleriki maçlarda kaptan olarak da seçebiliriz. Babacar(7,5M), 8 gol, 1 asist performansa sahipti. Bu yıl daha yüksek bir performans bekliyoruz. Yedek forvet oyuncumuz için, yüksek bedeller ödemek istemedik, Podolski(6M), bu bedeli ile takımızda gözlemleyeceğimiz bir forvet, biz bu yıl kendisinden bol gol bekliyoruz. İlk 2-3 hafta performansı bizi yanıltırsa transfer edebiliriz.\n\n'
                    'Bizim ana çatı takımımız oluştu, fikstür zorluğuna göre takımımızda birkaç revizyon yapabiliriz. Haftalık free transfer hakkımızı iyi kullanmak için birkaç hafta ileriyi düşünerek takım yapmak önemli. Transfer puanlarımızı da doğru kullanarak haftalık, aylık ve sezonluk lig’de ilk 10 sırayı zorlamak isityoruz.\n\n'
                    'Herkese bol şans.',style: TextStyle(fontSize: 18,),
              ),
                SizedBox(height: 60,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
