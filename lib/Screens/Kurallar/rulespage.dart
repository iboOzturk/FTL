import 'package:fantasysuperlig/Screens/YoutubeKanal/youtubekanalpage.dart';
import 'package:fantasysuperlig/Services/admobservice.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Variables/global.dart' as global;
class RulesPage extends StatefulWidget {
  @override
  _RulesPageState createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kurallar'),
        //backgroundColor:  Color.fromARGB(255, 55, 0, 60 ),
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
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height ,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('FTL Hakkında daha fazla bilgi'),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          launch(
                              'https://www.youtube.com/channel/UCXOXifxk4TLg4Jy4JWfavRg');
                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>YoutubeKanalPage()));
                        },
                        child: CircleAvatar(backgroundColor: Colors.red,
                          child: FaIcon(LineIcons.youtube,color: Colors.white,),),
                      ),
                      Text('Youtube')
                    ],
                  ),
                  Text('FTL Hakkında daha fazla ',style: TextStyle(color: Colors.transparent),),

                ],
              ),
              SizedBox(height: 10,),
              Container(alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15,top: 10,bottom: 10,right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  //color: Color.fromARGB(255, 55, 0, 60 ),
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
                  width: MediaQuery.of(context).size.width-30,
                  child: Text('1-İlk takımı oluşturmak\n\n'
                      'Takıma futbolcu seçimi\n\n'
                      'FTL oyununa katılmak için takımınıza 15 futbolcu seçmeniz gerekmektedir.\n\n'
                      '• 2 Kaleci\n'
                      '• 5 Savunma\n'
                      '• 5 Orta Saha\n'
                      '• 3 Forvet\n\n'
                      'Bütçe\n\n'
                      'Seçtiğiniz futbolcuların toplam değeri 100M bütçenizi aşmamalıdır.\n\n'
                      'Takımdaki Futbolcuları\n\n'
                      'Aynı spor kulübü takımından en fazla 3 futbolcu, kendi takımınıza dahil edebilirsiniz.',
                  textAlign: TextAlign.left,style: TextStyle(fontSize: 15,color: Colors.white),),
                ),
              SizedBox(height: 10,),
              global.adsBannerState==0?Text(''): Visibility(
                visible: global.bannerReaklamHakki==1?true:false,
                child: Container(
                  height: 50,
                  child: AdWidget(
                    ad:AdmobHelper.getBannerAd()..load(),
                    key: UniqueKey(),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15,top: 10,bottom: 10,right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  //color: Color.fromARGB(255, 55, 0, 60 ),
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
                width: MediaQuery.of(context).size.width-30,
                child: Text('2-FTL takımınızı yönetmek\n\n'
                    'İlk 11 oyuncunuzu seçin\n\n'
                    'Seçtiğiniz 15 futbolcudan, 11’ini ana kadronuza yerleştirin.'
                    ' Süper Lig’deki futbolcu performansına göre kazanacağınız puanlar,'
                    ' ana kadroya seçtiğiniz 11 futbolcuya göre belirlenecektir. Eğer ilgili'
                    ' haftada ilk 11 futbolcunuzdan oynamayan olursa, yedek sıranıza göre '
                    '(öncelik en soldaki yedek) yedekleriniz ilk 11’e otomatik olarak devreye'
                    ' girecektir.\n\n'
                    'Fantasy takımınız 1 kaleci, 3 savunma, 3 orta saha ve 1 forvet futbolcudan az olamaz.\n\n'
                   // 'Kaptan ve Yedek Kaptan seçimi\n\n'
                    'Kaptan seçimi\n\n'
                   // 'İlk 11’de bir futbolcunuzu kaptan, bir futbolcunuzu yedek kaptan'
                    'İlk 11’de bir futbolcunuzu kaptan'
                    ' seçmelisiniz. Kaptan seçtiğiniz futbolcu haftalık performansından'
                    //' takımınıza 2 kat puan kazandıracaktır. Kaptan futbolcunuz ilgili'
                   // ' haftada oynamaz ise yedek kaptanınız devreye girecektir.'
                    ' takımınıza 2 kat puan kazandıracaktır.'
                   // ' Eğer her ikisi de ilgili haftada oynamaz ise hiçbir futbolcunuzun'
                    ' Eğer her kaptan ilgili haftada oynamaz ise hiçbir futbolcunuzun'
                    ' puanı 2 kat olmayacaktır.\n\n'
                  //  'Her hafta yeni bir futbolcunuzu kaptan ve yedek kaptan olarak seçebilirsiniz.\n\n'
                    'Her hafta yeni bir futbolcunuzu kaptan olarak seçebilirsiniz.\n\n'
                    'Yedek futbolcu değişimi\n\n'
                    'İlgili haftada, ilk 11’de yer alan bir futbolcu 1 dakikadan az oyunda kalır'
                    ' ya da hiç oynamaz ise yedek oyuncu ya da oyuncular otomatik olarak devreye '
                    'girer.\n\n'
                    '• Kaleci oynamaz ise yedek kaleci devreye girer.\n\n'
                    '• Öncelikle yedekte olan ve en sol da yer'
                    ' alan futbolcu ilk yedek olarak kabul edilir.\n\n'
                    '• Yedekten girecek olan oyuncu, 1 kaleci,'
                    ' en az 3 savunma, en az 3 orta saha, en az 1 forvet'
                    ' futbolcu kuralını bozmamalıdır. '
                    '(örnek ; ilk 11’de 3 savunma futbolcusu yer almakta ve '
                    'bir tanesi ilgili haftada oynamadı, yedekten gelen oyuncu, '
                    'en solda yer alan savunma oyuncusu olacaktır)',
                  textAlign: TextAlign.left,style: TextStyle(fontSize: 15,color: Colors.white),),
              ),
              SizedBox(height: 10,),
              Container(alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15,top: 10,bottom: 10,right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  //color: Color.fromARGB(255, 55, 0, 60 ),
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
                width: MediaQuery.of(context).size.width-30,
                child: Text('3–FTL oyunu\n\n'
                    'Her fantasy takımı sezon boyunca devam edecek olan 3 adet lige dahil olur.\n\n'
                    '• Haftalık Lig\n'
                    '• Aylık Lig\n'
                    '• Sezon Lig\n'
                    'Lig sıralamaları, FTL takımlarda yer alan futbolcuların, Süper Lig maçlarında gösterdiği performansa göre, toplanan puanlardan, transfer harcamaları düşüldükten sonra oluşmaktadır.'
                  ,
                  textAlign: TextAlign.left,style: TextStyle(fontSize: 15,color: Colors.white),),
              ),
              SizedBox(height: 10,),
              Container(alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15,top: 10,bottom: 10,right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  //color: Color.fromARGB(255, 55, 0, 60 ),
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
                width: MediaQuery.of(context).size.width-30,
                child: Text('4–Transferler\n\n'
                    'İlk FTL takımınızı oluşturduktan sonra transfer pazarından,'
                    ' bütçeniz çerçevesinde istediğiniz futbolcuyu alıp, satabilirsiniz\n\n'
                    'Bedelsiz transfer\n\n'
                    'Her FTL takımının, her oyun haftasında (fixture de) 1 adet bedelsiz'
                    ' transfer hakkı bulunmaktadır. Her hafta, 1’den fazla yapılacak her '
                    'transferde fantasy takım, toplam puanından 4 puan kaybedecektir. Kaybedilen'
                    ' 4 puan, fantasy takımın, fantasy ligdeki ilgili haftadaki puanını, ilgili'
                    ' ay’daki puanını ve genel puanını ve doğal olarak da lig sıralamasındaki'
                    ' yerini etkileyecektir\n\n'
                    'Transfer Puan\n\n'
                    'FTL takım sahibi, ilgili haftada, 1’den '
                    'fazla yapacağı transferlerde puan kayıbı yaşamak istemez'
                    ' ise ‘transfer puana’ sahip olmak durumundadır. ‘Transfer Puan’ '
                    'günlük yayınlanan reklamları izleyerek ya da direkt ‘transfer puan’'
                    ' satın alarak kazanılabilmektedir.\n\n'
                    'Futbolcu fiyatlarıt\n\n'
                    'Futbolcuların, sezon boyunca, transfer pazarındaki popüleritelerine'
                    ' (seçim yüzdelerine) ve performanslarına göre fiyatları değişkenlik'
                    ' gösterecektir. Bu değişkenliğe paralel fantasy takımların toplam'
                    ' bütçeleri, sezon içerisinde, başlangıçtaki 100M bütçe altına ya da'
                    ' üstüne çıkabilir. Performansı yüksek olacak oyuncu tercihlerinin'
                    ' önceden yapılması, fantasy takımlarının bütçesinin yukarı yönde '
                    'arttıracaktır. \n\n'
                    ,
                  textAlign: TextAlign.left,style: TextStyle(fontSize: 15,color: Colors.white),),
              ),
              SizedBox(height: 10,),
              Container(alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15,top: 10,bottom: 10,right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  //color: Color.fromARGB(255, 55, 0, 60 ),
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
                width: MediaQuery.of(context).size.width-30,
                child: Text('5–Zaman sınırı\n\n'
                    'FTL takımınızda yapılacak tüm değişiklikler '
                    '(Kaptan seçimleri, transferler, transfer puan kullanımları, '
                    'yedek değişimleri vs.) süper lig fikstür’de, ilgili haftanın, '
                    'ilk maçının başlamasına 2 saat kala sona erer.\n\n'
                    'İlgili haftanın ilk maçının başlamasından 1 saat sonra, fantasy'
                    ' takım sahipleri, bir sonraki haftanın tüm değişikliklerinin yapılmasına '
                    'başlayabilecektir.\n\n'
                    ,
                  textAlign: TextAlign.left,style: TextStyle(fontSize: 15,color: Colors.white),),
              ),
              SizedBox(height: 10,),
              Container(alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15,top: 10,bottom: 10,right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  //color: Color.fromARGB(255, 55, 0, 60 ),
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
                width: MediaQuery.of(context).size.width-30,
                child: Column(
                  children: [
                    Text('6–Puanlama\n\n'
                        'FTL takımlarının futbolcularının, sezon boyunca hangi aksiyondan,'
                        ' ne kadar puan kazanacağı ya da kaybedeceği bilgisi aşağıdadır.\n\n'
                        ,
                      textAlign: TextAlign.left,style: TextStyle(fontSize: 15,color: Colors.white),),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Aksiyon',style: TextStyle(fontSize: 15,color: Colors.white)),
                        SizedBox(width: 62,),
                        Text('Puan',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('60 dakikaya kadar maçta kalan futbolcu',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('1',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('60 dakika üstü maçta kalan futbolcu',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('1',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Kaleci ya da savunma futbolcusunun attığı her gol',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('7',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Orta saha futbolcusunun attığı her gol',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('6',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Forvet futbolcusunun attığı her gol',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('5',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Kaleci ya da savunma futbolcusunun her gol asisti',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('4',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),

                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Orta saha ya da forvet futbolcusunun her gol asisti',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('3',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Maç sonunda gol yemeyen kaleci ',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('5',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Maç sonunda gol yemeyen savunma',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('4',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Maç sonunda gol yemeyen orta saha',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('2',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Maç sonunda gol yemeyen forvet',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('1',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Kalecinin her 3 kurtarışı',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('1',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Kalecinin penaltı kurtarışı',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('5',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Penaltı kaçıran futbolcu',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('-3',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Maçın en iyi 3 oyuncusu (Bonus Puan)',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('1',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Her yenilen 2 gol için kaleci ve savunma',style: TextStyle(fontSize: 15,color: Colors.white),),

                        Text('-1',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Her sarı kart',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('-1',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Her kırmızı kart',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('-3',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Kendi kalesine gol atan futbolcu',style: TextStyle(fontSize: 15,color: Colors.white)),

                        Text('-3',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],
                    ),
                    Text('\nGol yemeyen futbolcuların puanı\n\n'
                        '60 dakika altı maçta kalan futbolcular,'
                        ' hiçbir şekilde gol yememe puanlarını alamazlar.\n\n'
                        '60 dakika üstü maçta oynayan futbolcular, '
                        'maç sonuna kadar maçta kalmamış ise oyundan alındığı'
                        ' dakika itibariyle takımları gol yememişse, gol yememe puanını alırlar.'
                        'Oyundan çıkarıldıktan sonra takımları gol '
                        'yese bile onların gol yememe puanı bu durumdan etkilenmezler\n\n'
                        'Maçta kırmızı kart gören futbolcular, gol yememe puanından faydalanamazlar.\n\n'
                        'Penaltı\n\n'
                        'Penaltı yapılan futbolcu asist yapmış kabul edilir. Penaltı yapılan futbolcu '
                        'ile penaltıyı gole çeviren futbolcu aynı kişi ise sadece gol atmış gibi puanlama '
                        'yapılır, asist puanı yazılmaz.\n\n'
                        'Penaltı, kaleci müdahalesi olmadan, kale dışına '
                        'vurulur ise kaleci kurtardı kabul edilmez\n\n'
                        'Bonus puan\n\n'
                        'Maç boyunca gösterilen futbolcu performanslarına göre maçın en yüksek '
                        'performansa sahip futbolcuları sıra ile 3-2-1 puan ile ödüllendirilir.\n\n'
                        'Aynı maçta, bir futbolcudan fazla 3 puan, 2 puan '
                        'ya da 1 puan alan futbolcular olabilir.\n\n',style: TextStyle(fontSize: 15,color: Colors.white),)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  //color: Color.fromARGB(255, 55, 0, 60 ),
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
                padding: EdgeInsets.only(left: 15,top: 10,bottom: 10,right: 15),
                width: MediaQuery.of(context).size.width-30,
                child: Text('7–Lig ödüllendirme sistemi\n\n'
                    'Haftalık Lig\n\n'
                    'Her FTL takımı, otomatik olarak haftalık ligde yer alır. '
                    'Her hafta toplanan puanlar (transfer harcamaları düşüldükten sonra)'
                    ' puan büyüklüklerine göre sıralanır.\n\n'
                    'Haftalık Lig ödülünü almaya hak kazanan ve aynı puana sahip 1’den '
                    'fazla FTL takımı var ise öncelikle aylık lig puanları karşılaştırılır'
                    ' yine puanları aynı ise sezon lig puanları karşılaştırılır, yine aynı puan'
                    ' ise transfer puan harcaması düşük olan sıralamada öne geçer. Orada da eşitlik '
                    'var ise FTL kayıt zamanlarına bakılacak, zaman olarak önce kayıt '
                    'yaptıran ödüle hak kazanacaktır.\n\n'
                    'Aylık Lig\n\n'
                    'Her FTL takımı, otomatik olarak aylık ligde yer alır. İlgili ay içerisinde (süper lig fikstürüne göre) süper lig maçlarından toplanan puanlar (transfer harcamaları düşüldükten sonra) puan büyüklüklerine göre sıralanır.\n\n'
                    'Ayın son günü bile olsa, haftalık maçlarının ilkinin başlaması, bu haftaki tüm maçları aynı aya dahil edilmesini sağlayacaktır. (Örnek ayın 30’unda ilk maç ancak diğerleri diğer ayın 1’inde, bu durumda ayın 30’unda ilk maç başladığı için, aylık lig puanlamasıda diğer aya yansıtılmayacaktır.)\n\n'
                    'Aylık Lig ödülünü almaya hak kazanan aynı puana sahip 1’den fazla FTL takımı var ise öncelikle sezon lig puanına bakılır, orada da eşitlik var ise transfer puan harcaması düşük olan sıralamada öne geçer. Orada da eşitlik var ise FTL oyun kayıt zamanlarına bakılacak, zaman olarak önce kayıt yaptıran ödüle hak kazanacaktır.\n\n'
                    'Sezon Ligi\n\n'
                    'Her FTL takımı, otomatik olarak aylık ligde yer alır. İlgili ay içerisinde (süper lig fikstürüne göre) süper lig maçlarından toplanan puanlar (transfer harcamaları düşüldükten sonra) puan büyüklüklerine göre sıralanır.\n\n'
                    'Sezon Ligi ödülünü almaya hak kazanan aynı puana sahip 1’den fazla FTL takımı var ise öncelikle transfer puan harcaması düşük olan sıralamada öne geçer. Orada da eşitlik var ise FTL oyun kayıt zamanlarına bakılacak, zaman olarak önce kayıt yaptıran ödüle hak kazanacaktır.\n\n'
                    'ALL R Yazılım, tüm oyun kurallarını, dilediği zaman değiştirme hakkını saklı tutar. Herhangi bir kural değişikliği söz konusu olduğunda, yapılabilecek tüm değişiklikler, kayıtlı oyuncularımıza bilgilendirme olarak, FTL uygulaması üzerinden geçilecektir.',
                  textAlign: TextAlign.left,style: TextStyle(fontSize: 15,color: Colors.white),),
              ),
              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}
