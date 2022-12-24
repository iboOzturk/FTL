library fantasysuperlig.global;

import 'package:fantasysuperlig/Services/api_service.dart';

///menu
int selectIndex=2;

int tamam=0;

bool checkNetwork;
String androidVersiyon;
String iosVersiyon;

///Haber Detay
int HaberID;
String DetayBody;
String DetayURL;

///Profil
String pName;
String pSurname;
int pCinsiyet;
String pBeden;
String pFTA;
String pAdres;
String BirthDate;
String Tel;
String Email;
String pFavTakim;
int pFavTakimId;

///Kupon
String kupon='';

///Puanlar
String point;
String avgpoint;
String maxpoint;
String transferpoint;
String weekPoint;
String SeasonPoint;
String TeamValue;
String PointButce;
int WeekState;
String WeekOpeningTime;
int CurrentWeek;
int HaftalikSira;
int AylikSira;
int SezonlukLig;
int Expense1;
String HaftalikLigAdi;
String AylikLigAdi;
String SezonlukLigAdi;
String HLAciklama;
String ALAciklama;
String SLAciklama;
int OzelLig2Durum;
int OzelLig1Durum;
String OzelLig1Adi;
String OzelLig1Aciklama;
String OzelLig2Adi;
String OzelLig2Aciklama;
int CanliMac;


///Puanım haftalık puan
int OldPoint;
int OldAvgPoint;
int OldMaxPoint;

///Banner
int BannerID=0;
int BannerState;
String BannerURL;

///ozel lig state
int ozelligstate;
int ozelligjoin;
String awards;


///Reklam video
int reklamhakki=0;
int kalansure1;
int kalansure2;
int kalansure3;

///Reklam banner
int bannerReaklamHakki;

///giriş değişkenleri
int userid;
int otheruserid;
String androidId;
String email;
String fantasyteamname;
String userName;
String userSurname;
String AndroidVersion;
String IOSVersion;
int adsBannerState;
int adsRewardState;
String accesstoken;
String tokentype;
bool mailbool=false;
bool ftabool=false;
bool telnobool=false;

int goster=0;

String NowVersion="1.0.14";

///İnternet bağlantı
bool wifibaglanti=false;
bool netbaglanti=true;

///Mağaza
String cardNumber;
double indirimTutari;

///Bütçe ve transfer puanı
double Butce;
int TransferPuan;
int FreeTransfer;
int Expense;

///Takım değişkenleri
int gelenOyuncuSayisi=0;

int TeamID;
int UserID;
int haftaID;
int teamhaftaID;
int captain;
//int spareCaptain;
int kaleci0;  String kaleci0PlayerShortName; String kaleci0Kits; String kaleci0Position;  int kaleci0PlayerID; String kaleci0Value; bool kaleci0vis=false; String kaleci0Pos;String kaleci0emp; int kaleci0Puan; String K0takimKisa; int K0injury; int K0leave; String K0Desp; int K0isplay;
int kaleci1;  String kaleci1PlayerShortName; String kaleci1Kits; String kaleci1Position;  int kaleci1PlayerID; String kaleci1Value; bool kaleci1vis=false; String kaleci1Pos;String kaleci1emp; int kaleci1Puan; String K1takimKisa; int K1injury; int K1leave; String K1Desp; int K1isplay;
int defans0;  String defans0PlayerShortName;  String defans0Kits; String defans0Position;int defans0PlayerID;  String defans0Value; bool defans0vis=false; String defans0Pos;String defans0emp; int defans0Puan; String D0takimKisa; int D0injury; int D0leave; String D0Desp; int D0isplay;
int defans1;   String defans1PlayerShortName; String defans1Kits; String defans1Position;int defans1PlayerID;String defans1Value;   bool defans1vis=false; String defans1Pos;String defans1emp; int defans1Puan; String D1takimKisa; int D1injury; int D1leave; String D1Desp; int D1isplay;
int defans2;   String defans2PlayerShortName; String defans2Kits; String defans2Position;int defans2PlayerID;String defans2Value;   bool defans2vis=false; String defans2Pos;String defans2emp; int defans2Puan; String D2takimKisa; int D2injury; int D2leave; String D2Desp; int D2isplay;
int defans3;   String defans3PlayerShortName; String defans3Kits; String defans3Position;int defans3PlayerID;String defans3Value;   bool defans3vis=false; String defans3Pos;String defans3emp; int defans3Puan; String D3takimKisa; int D3injury; int D3leave; String D3Desp; int D3isplay;
int defans4;   String defans4PlayerShortName; String defans4Kits; String defans4Position;int defans4PlayerID;String defans4Value;   bool defans4vis=false; String defans4Pos;String defans4emp; int defans4Puan; String D4takimKisa; int D4injury; int D4leave; String D4Desp; int D4isplay;
int ortasaha0;  String ortasaha0PlayerShortName; String ortasaha0Kits; String ortasaha0Position;int ortasaha0PlayerID;String ortasaha0Value; bool ortasaha0vis=false;String ortasaha0Pos;String ortasaha0emp; int ortasaha0Puan; String OS0takimKisa; int OS0injury; int OS0leave; String OS0Desp; int OS0isplay;
int ortasaha1;  String ortasaha1PlayerShortName; String ortasaha1Kits; String ortasaha1Position;int ortasaha1PlayerID;String ortasaha1Value; bool ortasaha1vis=false;String ortasaha1Pos;String ortasaha1emp; int ortasaha1Puan; String OS1takimKisa; int OS1injury; int OS1leave; String OS1Desp; int OS1isplay;
int ortasaha2;  String ortasaha2PlayerShortName; String ortasaha2Kits; String ortasaha2Position;int ortasaha2PlayerID;String ortasaha2Value; bool ortasaha2vis=false;String ortasaha2Pos;String ortasaha2emp; int ortasaha2Puan; String OS2takimKisa; int OS2injury; int OS2leave; String OS2Desp; int OS2isplay;
int ortasaha3;  String ortasaha3PlayerShortName; String ortasaha3Kits; String ortasaha3Position;int ortasaha3PlayerID;String ortasaha3Value; bool ortasaha3vis=false;String ortasaha3Pos;String ortasaha3emp; int ortasaha3Puan; String OS3takimKisa; int OS3injury; int OS3leave; String OS3Desp; int OS3isplay;
int ortasaha4;  String ortasaha4PlayerShortName; String ortasaha4Kits; String ortasaha4Position;int ortasaha4PlayerID;String ortasaha4Value; bool ortasaha4vis=false;String ortasaha4Pos;String ortasaha4emp; int ortasaha4Puan; String OS4takimKisa; int OS4injury; int OS4leave; String OS4Desp; int OS4isplay;
int forvet0;  String forvet0PlayerShortName; String forvet0Kits; String forvet0Position;int forvet0PlayerID; String forvet0Value; bool forvet0vis=false; String forvet0Pos; String forvet0emp; int forvet0Puan; String F0takimKisa; int F0injury; int F0leave; String F0Desp; int F0isplay;
int forvet1;  String forvet1PlayerShortName; String forvet1Kits; String forvet1Position;int forvet1PlayerID; String forvet1Value; bool forvet1vis=false; String forvet1Pos; String forvet1emp; int forvet1Puan; String F1takimKisa; int F1injury; int F1leave; String F1Desp; int F1isplay;
int forvet2;  String forvet2PlayerShortName; String forvet2Kits; String forvet2Position;int forvet2PlayerID; String forvet2Value; bool forvet2vis=false; String forvet2Pos; String forvet2emp; int forvet2Puan; String F2takimKisa; int F2injury; int F2leave; String F2Desp; int F2isplay;

int yedek0; String yedek0PlayerShortName; String yedek0Kits; String yedek0Position; int yedek0PlayerID; String yedek0Value; bool yedek0vis=false; String yedek0Pos; String yedek0emp;  int yedek0Puan; String Y0takimKisa; int Y0injury; int Y0leave; String Y0Desp; int Y0isplay;
int yedek1; String yedek1PlayerShortName; String yedek1Kits; String yedek1Position; int yedek1PlayerID; String yedek1Value; bool yedek1vis=false; String yedek1Pos; String yedek1emp;  int yedek1Puan; String Y1takimKisa; int Y1injury; int Y1leave; String Y1Desp; int Y1isplay;
int yedek2; String yedek2PlayerShortName; String yedek2Kits; String yedek2Position; int yedek2PlayerID; String yedek2Value; bool yedek2vis=false; String yedek2Pos; String yedek2emp;  int yedek2Puan; String Y2takimKisa; int Y2injury; int Y2leave; String Y2Desp; int Y2isplay;

int defanssayisi=0;
int ortasahasayisi=0;
int forvetsayisi=0;

List<MyTeam> takimim=[];

int hatamsj;
int registerdurum;
