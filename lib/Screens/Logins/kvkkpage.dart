import 'package:flutter/material.dart';

class KVKKPage extends StatefulWidget {
  @override
  _KVKKPageState createState() => _KVKKPageState();
}

class _KVKKPageState extends State<KVKKPage> {
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
  int kvkkid;
  bool KVKK=false;
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
  //  adres=data1[9];
    KVKK==true? kvkkid=1:kvkkid=0;
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
            title: Text('KVKK sözleşmesi'),
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
              SizedBox(height: 20,),
              Container(alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 1.08,
                height: MediaQuery.of(context).size.height / 1.4025,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8.0) ,
                    child: Text('KİŞİSEL VERİLERİN KORUNMASI, GİZLİLİK \n\n'
                        'ALL R YAZILIM DANIŞMANLIK TİCARET LİMİTED ŞİRKETİ (ALL R Yazılım) \n\n'
                        'KİŞİSEL VERİLERİN KORUNMASI HAKKINDA BİLGİLENDİRME METNİ\n\n'
                        'FANTEZİ TÜRKİYE LİG - FTL uygulaması ile, şirketimizle paylaştığınız kişisel verilerinizin gizliliğini ve güvenliğini önemsiyoruz. Bu kapsamda, Kişisel Verilerin Korunması Kanunun (“kanun”) ve ilgili mevzuattan kaynaklanan haklarınıza ilişkin olarak sizleri bilgilendirmek isteriz. Kanun uyarınca, aşağıda belirtilen işleme amacı ile bağlantılı olarak kullanıcıların Şirketimiz ile paylaşmış olduğu kişisel veriler işbu Kişisel Verilerin Korunması, Gizlilikte belirtilen amaç çerçevesinde, depolanacak, muhafaza edilecek, değiştirilecek, yeniden düzenlenecek, grup ve partner şirketleri, program ortakları ve ilgili paydaşlar ile paylaşılacak, kanun’un öngördüğü koşullarda yurtdışında üçüncü kişi ve kurumlara aktarılacak, devredilecek, erişime açılacak, sınıflandırılacak ve Kanunda veya ilgili mevzuatta sayılan veya daha sonra ortaya çıkan düzenlemelere uygun şekilde işlenebilecektir.\n\n'
                        '1. Kişisel Verinin Tanımı\n\n'
                        'Kişisel veri, bireylerin kimliklerini belirli hale getirmeye elverişli her türlü bilgi olarak tanımlanabilir. Bu bağlamda başta kimlik bilgileri, adres, telefon, mail ve beden bilgileri gibi kişinin ailevi, sosyal ve ekonomik bilgileri de kişisel veri niteliğindedir.\n\n'
                        'ALL R Yazılım, FANTEZİ TÜRKİYE LİG - FTL Programı kapsamında adınızı, soyadınızı, sosyal medya hesap bilgilerinizi, mail adresinizi, telefon numaranızı, beden bilgilerinizi, sosyal medya hesapları ile bağlantı sağlandığı takdirde ilgili mecrada kullanıcı tarafından paylaşılmış olan veriler, kullanıcı trafik bilgileri, kullanım alışkanlıkları oyun kapsamında kullanıcı olarak oluşturduğunuz verilerinizi, kazanılan ödüllerinizi, puanlarınızı ve oyunun içerisinde satış yapılması halinde ödeme bilgilerini işleyebilmektedir. ALL R Yazılım, işlemiş olduğumuz kişisel verileriniz bakımından Kanun kapsamında “veri sorumlusu” sıfatını taşımaktadır.\n\n'
                        '2. Kişisel Verilerin İşlenme Amacı\n\n'
                        'Yukarıda saydığımız ALL R Yazılım tarafından işlenen kişisel verileriniz;\n\n'
                        '•	Şirketimiz tarafından ve tayin ettiği hizmet sağlayıcılar ile sizlere Fantezi Türkiye Lig - FTL programına ilişkin hizmetleri sunabilmek,\n'
                    '•	Şirketimiz tarafından sunulan oyun ve diğer hizmetleri geliştirmek,\n'
                       ' •	Beğeni ve ihtiyaçları tespit ederek değişiklikler yapmak,\n'
                        '•	Grup ve partner şirketlerinin ve program ortaklarının kampanya ve diğer hizmetlerden bilgilendirmek,\n'
                        '•	Hizmet güvenlik ve kalitesini korumak,\n'
                      '  •	Şirketimizin pazarlama stratejilerini belirlemek ve uygulamak,\n'
                       ' •	Satış, pazarlama ve ticari iletişim yapılabilmesi,\n'
                        '•	Satış sonrası hizmetler verilebilmesi,\n'
                      '  •	Müşteri ve kullanıcı alışkanlıkları ile ilgili, istatistiksel çalışmalar yapmak,\n'
                       ' •	Kullanıcı ile sözleşme akdetmek,\n'
                       ' •	Pazar araştırması yapılabilmesi amaçlarıyla sınırlı olarak işlenebilmektedir.\n\n'
                        '3. Kişisel Veri Toplamanın Yöntemi ve Hukuki Sebebi\n\n'
                        'Kişisel verileriniz kanunda belirtilen hükümlere uyumlu olarak internet sitesi, mobil uygulamalar, mobil web siteler aracılığıyla veya program ortaklarının veri tabanı aktarması neticesinde  toplanabilmektedir.\n\n'
                        'Şayet daha önceden Şirketimiz tarafından alınmış rıza ve izniniz mevcut değilse; yukarıda belirtilen ve Kanun’un 5/2 maddesinde yer alan hukuka uygunluk sebeplerinden birine girmeyen kişisel verileriniz için yasal zorunluluk gereği rızanı alınarak işlenebilmektedir. Bunun yanı sıra, 2. fıkra altında düzenlenmiş olan “Kanunlarda açıkça öngörülmesi”, “Bir sözleşmenin kurulması veya ifasıyla doğrudan doğruya ilgili olması kaydıyla, sözleşmenin taraflarına ait kişisel verilerin işlenmesinin gerekli olması” ve “İlgili kişinin temel hak ve özgürlüklerine zarar vermemek kaydıyla, veri sorumlusunun meşru menfaatleri için veri işlenmesinin zorunlu olması” hukuki sebeplerine dayanarak işlenebilmektedir.\n\n'
                        '4. Kişisel Verilerin Muhafazası, İşlenen Kişisel Verilerin Kimlere ve Hangi Amaçla Aktarılabileceği\n\n'
                        'İşlenen kişisel verileriniz;\n\n'
                        '•	Ürün ve hizmet sunulabilmesi,\n'
                       '•Altyapı ve diğer destek hizmet alınması,\n'
                       '•	Sunulan oyun ve hizmetlerin geliştirilmesi,\n'
                       '•	İşbirlikleri, ödül programları ve iş stratejilerin oluşturulması,\n'
                        '•	Yasal mevzuat gereği, idari ya da resmi makamlara bilgi verilmesinin zorunlu olması,\n'
                        '•	ALL R Yazılım’ın özel inceleme, denetim veya birleşme ve devralma incelemesine konu olması, hissedar yapısının değişmesi veya oyunun başka bir firmaya devredilmesi,\n'
                        '•	Ticari faaliyetlerin talepler doğrultusunda yürütülmesi gibi amaçlarla şirketimizce, ana hissedarlarımıza ve grup şirketlerimize, yurt içi/yurt dışı iştiraklerimize ya da sözleşme ilişkisi bulunan yurt içi/yurt dışı çözüm ortaklarımıza sadece kanunda belirtilen amaçlar ve sınırlar doğrultusunda aktarılabilecektir.\n\n'
                        'Kişisel verilerin aktarılmasında, kanundan doğan istisnalar saklı kalmak üzere kişisel veri sahibinin açık rızası aranmakta, kişisel veri sahibinin açık rızası olmayan veriler aktarılmamaktadır.\n\n'
                        'Şirketimiz tarafından işlenen kişisel veriler, sadece işleme amaçları için kullanılmakta olup, işleme amacıyla bağlantılı gerekli süre boyunca muhafaza edilmektedir.\n\n'
                        '5. Kişisel Verilerinizin Silinmesi, Yok Edilmesi veya Anonimleştirilmesi \n\n'
                        'Bilgilendirme Metninin 2. bölümünde belirtilen amaçlar doğrultusunda işlenen kişisel verileriniz; kişisel verilerin işlenme amacı ortadan kalktığında ve her şartta ilgili mevzuatın belirlediği saklama sürelerinin tamamlanması akabinde Şirketimiz tarafından silinmekte, erişimi kısıtlanmakta, yok edilmekte veya anonim hale getirilmektedir. Kişisel Veriler birden fazla sebep ile işlendiği veya farklı kanunlarda düzenlenen hükümlere tabi olduğu durumlarda söz konusu verinin işlenmesini gerektiren tüm nedenler ortadan kalktığında ve ilgili kanunda belirtilen azami süre nispetinde saklanır.\n\n'
                        '6. Kişisel Veri Sahibinin Hakları\n\n'
                        'Kanunda Kişisel veri sahiplerinin hakları özetle aşağıdaki şekilde ifade edilmektedir:\n\n'
                        '•	Kişisel veri işlenip işlenmediğini öğrenme,\n'
                    '•	Kişisel verileri işlenmişse buna ilişkin bilgi talep etme,\n'
                        '•	Kişisel verilerin işlenme amacını ve bunların amacına uygun kullanılıp kullanılmadığını öğrenme,\n'
                        '•	Yurt içinde veya yurt dışında kişisel verilerin aktarıldığı üçüncü kişileri bilme,\n'
                        '•	Kişisel verilerin eksik veya yanlış işlenmiş olması hâlinde bunların düzeltilmesini isteme ve bu kapsamda yapılan işlemin kişisel verilerin aktarıldığı üçüncü kişilere bildirilmesini isteme,\n'
                        '•	Kanun’a ve ilgili diğer mevzuat hükümlerine uygun olarak işlenmiş olmasına rağmen, işlenmesini gerektiren sebeplerin ortadan kalkması hâlinde kişisel verilerin silinmesini veya yok edilmesini isteme ve bu kapsamda yapılan işlemin kişisel verilerin aktarıldığı üçüncü kişilere bildirilmesini isteme,\n'
                        '•	İşlenen verilerin münhasıran otomatik sistemler vasıtasıyla analiz edilmesi suretiyle kişinin kendisi aleyhine bir sonucun ortaya çıkmasına itiraz etme,\n'
                        '•	Kişisel verilerin kanuna aykırı olarak işlenmesi sebebiyle zarara uğraması halinde zararın giderilmesini talep etme.\n\n'
                        '7. İletişim\n\n'
                        'Kanunda belirtilen haklarınızı kullanmak ile ilgili talebinizi, yazılı veya Kişisel Verileri Koruma Kurulu’nun belirlediği diğer yöntemlerle şirketimize iletebilirsiniz.\n\n'
                        'Kişisel veri sahibinin, Kanun’un 11. Maddesinde belirttiğimiz haklarından faydalanabilmesi için Başvuru Tebliği gereğince taleplerini;\n\n'
                        '1- Kimlik tespitini sağlayacak bir belge ile birlikte, talebini içeren dilekçenin ıslak imzalı bir kopyasını “Güzeltepe Mah. Abdin Daver Sok. Sefer Apt. No:7 İç kapı:9 Çankaya - ANKARA” adresine şahsen ibraz etmek suretiyle,\n\n'
                        '2- Kişisel Veri Sahibi tarafından daha önce ALL R Yazılım’a bildirilmiş ve Fantezi Türkiye Lig - FTL sisteminde kayıtlı bulunan e-posta ile ftl@gmail.com adresine yapabilir.\n\n'
                        'TİCARİ İLETİŞİM VE TİCARİ ELEKTRONİK İLETİ\n\n'
                        'İşbu Ticari İletişim ve Ticari Elektronik İleti İzni’ni kabul etmekle, bizimle paylaşılmasına rıza göstermiş olduğunuz kişisel verilerinizin, tarafınıza çeşitli avantajların sağlanıp sunulabilmesi ve size özel reklam, satış, pazarlama, anket ve benzer amaçlı her türlü fiziksel ve elektronik iletişim yapılması ve diğer iletişim mesajlarının gönderilmesi amacıyla; toplanmasına, saklanmasına, işlenmesine, kullanılmasına, aktarımına izin vermiş bulunmaktasınız. Bu kişisel verileriniz, aynı amaçlara yönelik olarak; ALL R Yazılım Danışmanlık Ticaret Limited Şirketi (ALL R Yazılım), tüm iştirakleri ve bağlı ortaklıkları ile sözleşme ilişkisi içinde olduğumuz yurt içi ve/veya yurt dışındaki 3. taraflarla paylaşılacaktır. Bunun yanında, bu bilgiler sadece size sağlanacak hizmetlerin kusursuz sunulabilmesi, ALL R Yazılım’ın bağlı olduğu grup şirketleri ve program ortaklarının sağladığı hizmet ve avantajlardan yararlanabilmeniz, telefon, sms, e-posta ve diğer elektronik iletişim yollarıyla bildirimlerimizin zamanında ulaştırılabilmesi amacıyla, sözleşme ilişkisi içinde olduğumuz, veri koruması ve güvenliği konusunda bizimle hukuken ve teknik olarak aynı sorumlulukları taşıyan, ilgili Mevzuat hükümlerine riayet eden 3. kişilerle, yalnızca ihtiyaç durumunda ve gerekli ölçüde paylaşılacaktır. ALL R Yazılım, söz konusu kişisel verilerin 6698 sayılı Kişisel Verilerin Korunması Kanunu uyarınca güvenli şekilde saklanması, yetkisiz erişimlerin ve hukuka aykırı veri işlemelerin önlenmesi için gereken her türlü tedbiri alacaktır. Ticari Elektronik İletişim izninizi geri almak istediğiniz takdirde, dilediğiniz zaman, izni verdiğiniz yöntemle (sms, e-posta, web sitesi ve diğer usuller) bu talebinizi ALL R Yazılım’a iletebilirsiniz. Bildiriminiz usulünce tarafımıza iletildikten sonra sadece ALL R Yazılım’a ilişkin bilgilendirme ve gönderiler sizlerle paylaşılacaktır.\n\n'
                        'İletişim bilgileri: ALL R YAZILIM DANIŞMANLIK TİCARET LİMİTED ŞİRKETİ\n\n'
                        'Adres: Güzeltepe Mah. Abidin Daver Sok. Sefer Apt. No:7 İç kapı:9 Çankaya - ANKARA\n\n'
                        'Telefon: 05417477193\n\n',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),


                        ),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      value: KVKK,
                      checkColor: Color.fromARGB(255, 63, 0, 64),
                      activeColor:  Colors.white,
                      onChanged: (bool value){

                        setState(() {
                          this.KVKK = value;
                        });

                        print('KVKK: '+KVKK.toString());

                      }),
                  Container(
                    width: genislik-60,
                    child: Text(
                      'KVKK ile ilgili bilgilendirme ve onay metnini okudum ve kabul ediyorum',
                      textAlign: TextAlign.left,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
                        color: Colors.white),
                    ),
                  ),

                ],
              ),
              RaisedButton( child: Text('Devam'),color: Colors.white,elevation: 10,
                  onPressed: (){

                   if(KVKK==false){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.white,
                              content: Text(
                                  'KVKK sözleşmesini okuyup onaylamanız gerekiyor',
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
                   //   data.add(cinsiyet);
                   //   data.add(dogumyili);
                   //   data.add(telefonno);
                   //   data.add(beden);
                   //   data.add(adres);
                        data.add(kvkkid);
                       Navigator.pushNamed(context, '/ftlsadakat',arguments: data);

                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
