import 'dart:async';
import 'dart:convert';

import 'package:fantasysuperlig/Screens/MenuPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import '../Variables/global.dart' as global;


///Asıl api
String url='APILINK';

/*
* orta saha=2
* kaleci=0
* savunma=1
* forvet=3 */
class Player{
  int PlayerID;
  int TeamID;
  String PlayerName;
  String PlayerShortName;
  String Position;
  double Value1;
  String Kits;
  String TakimKisatlma;
  String Form;
  int WeekPoints;
  int SeasonPoints;
  double ElectionRate;
  int Injury;
  int Leave;
  String Description;

  Player(
      this.PlayerID,this.TeamID,this.PlayerName,this.PlayerShortName,
      this.Position,this.Value1,this.Kits,this.TakimKisatlma,this.Form,this.WeekPoints,this.SeasonPoints,this.ElectionRate,
      this.Injury,this.Leave,this.Description
      );
}

Future getCaptains() async{
  var data=await http.get(Uri.parse(url+'GetCaptain?userid=${global.userid}'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  var jsonData=json.decode(data.body);
  global.captain=jsonData[0]['Captain'];
  print('kaptan: '+global.captain.toString());
 // global.spareCaptain=jsonData[0]['SpareCaptain'];
}
Future getCaptains2(int userid,int haftaid) async{

  var data=await http.get(Uri.parse(url+'GetCaptain2?userid=$userid&haftaid=$haftaid'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  var jsonData=json.decode(data.body);
  global.captain=jsonData[0]['Captain'];
  print('kaptan: '+global.captain.toString());
}
Future selectCaptains(int captainid,int playerid) async{
  ///api/SelectCaptain?userid=4&captainid=1&playerid=3232 kaptansa 0 yedek kaptansa 1
  var data=await http.get(Uri.parse(url+'SelectCaptain?userid=${global.userid}&captainid=$captainid&playerid=$playerid'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  print(data.body);

}

Future playerChange(String neresi,int playerid)async{
  var data =await http.get(Uri.parse(url+'PlayerChange?n=$neresi&uid=${global.userid}&pid=$playerid'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  print(neresi+' '+playerid.toString()+' '+global.userid.toString());
  print('PlayerChange Sonucu: '+data.body);
  global.hatamsj=int.parse(data.body);
  //return data;
}
Future playerChange2(String neresi,int playerid)async{
  var data =await http.get(Uri.parse(url+'PlayerChange2?n=$neresi&uid=${global.userid}&pid=$playerid'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  print(neresi+' '+playerid.toString()+' '+global.userid.toString());
  print('PlayerChange Sonucu: '+data.body);
  global.hatamsj=int.parse(data.body);
  //return data;
}
Future substituteChange(int GirecekPID,int CikacakPID) async{
  ///PlayerSubstitute?uid=4&gid=1179&cid=1149
  var data=await http.get(Uri.parse(url+'PlayerSubstitute?uid=${global.userid}&gid=$GirecekPID&cid=$CikacakPID'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  print('yedek sonucu: '+data.body);
  print('girecek: '+GirecekPID.toString());
  print('çıkacak: '+CikacakPID.toString());

}
Future subsKaleciChange(int GirecekPID,int CikacakPID) async{
 // api/PlayerSubstituteGK?uid=4&gid=1215&cid=1492
  var data=await http.get(Uri.parse(url+'PlayerSubstituteGK?uid=${global.userid}&gid=$GirecekPID&cid=$CikacakPID'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  print('kaleci yedek sonucu: '+data.body);
}
Future getCardMoney()async{
  final ref = await http.get(
      Uri.parse(url + 'GetSadakatInfo?uid=${global.userid}'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken});
  if (ref.statusCode == 200) {
    print('Kart detaylariii: ' + ref.body);
    var jsonData = json.decode(ref.body);

  global.cardNumber=jsonData[0]['CardNumber'];
  global.indirimTutari=jsonData[0]['IndirimTutari'];

  }
}

Future getToken() async {
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  var request = http.Request('POST', Uri.parse('TOKENLINK'));
  request.bodyFields = {
    'grant_type': 'password',
    'username': 'username',
    'password': 'password'
  };
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  String data=await response.stream.bytesToString();

  // final Map<String, dynamic> responseMap = jsonDecode(response.stream.bytesToString().toString());
  var jsonData=jsonDecode(data);
  if (response.statusCode == 200) {
    global.accesstoken=jsonData['access_token'];
    global.tokentype=jsonData['token_type']+' ';
    print(global.tokentype+global.accesstoken);
  }
  else {
    print(response.reasonPhrase);
  }
}
Future getVersion()async{
  var data= await http.get(Uri.parse(url+'GetVersion'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  if(data.statusCode==200){
    var jsonData=json.decode(data.body);
    print('Versiyon: '+data.body);
    global.androidVersiyon=jsonData[0]['AndroidVersion'];
    global.iosVersiyon=jsonData[0]['IOSVersion'];
  }
}
Future getCoupon(int siteid,int type)async{
  var data= await http.get(Uri.parse(url+'GetCoupon?userid=${global.userid}&siteid=$siteid&type=$type'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  if(data.statusCode==200) {
    var jsonData = json.decode(data.body);
    global.kupon = jsonData;

  }
}

Future getPoints(int userid) async{
  var data= await http.get(Uri.parse(url+'GetPoints?userid=$userid'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  if(data.statusCode==200) {
    print('\n---------------------GetPoints: '+data.body+'\n\n');
    var jsonData = json.decode(data.body);
    global.point = jsonData[0]['Point'];
    global.avgpoint = jsonData[0]['AvgPoint'];
    global.maxpoint = jsonData[0]['MaxPoint'];
    global.transferpoint = jsonData[0]['TransferPoint'];
    global.weekPoint = jsonData[0]['WeekPoint'];
    global.SeasonPoint = jsonData[0]['SeasonPoint'];
    global.TeamValue = jsonData[0]['TeamValue'];
    global.PointButce = jsonData[0]['Butce'];
    global.WeekState = jsonData[0]['WeekState'];
    global.WeekOpeningTime = jsonData[0]['WeekOpeningTime'];
    global.CurrentWeek = jsonData[0]['CurrentWeek'];
    global.HaftalikSira = jsonData[0]['HaftalikSira'];
    global.AylikSira = jsonData[0]['AylikSira'];
    global.SezonlukLig = jsonData[0]['SezonlukSira'];
    global.Expense1 = jsonData[0]['expense'];
    global.HaftalikLigAdi = jsonData[0]['HaftalikLigAdi'];
    global.AylikLigAdi = jsonData[0]['AylikLigAdi'];
    global.SezonlukLigAdi = jsonData[0]['SezonlukLigAdi'];
    global.HLAciklama = jsonData[0]['HaftalikLigAciklama'];
    global.ALAciklama = jsonData[0]['AylikLigAciklama'];
    global.SLAciklama = jsonData[0]['SezonlukLigAciklama'];
    global.OzelLig2Durum = jsonData[0]['OzelLig2Durum'];
    global.OzelLig1Durum = jsonData[0]['OzelLig1Durum'];
    global.OzelLig1Adi = jsonData[0]['OzelLig1Adi'];
    global.OzelLig1Aciklama = jsonData[0]['OzelLig1Aciklama'];
    global.OzelLig2Adi = jsonData[0]['OzelLig2Adi'];
    global.OzelLig2Aciklama = jsonData[0]['OzelLig2Aciklama'];
    global.CanliMac = jsonData[0]['CanliMac'];


  }
  else if(data.statusCode==401){
    getToken();
  }
}

Future getOldPoint(int userid,int haftaid)async{
  var data= await http.get(Uri.parse(url+'GetOldPoint2?userid=$userid&haftaid=$haftaid'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  if(data.statusCode==200){
    var jsonData = json.decode(data.body);

    global.OldPoint=jsonData[0]['OldPoint'];
    global.OldAvgPoint=jsonData[0]['OldAvgPoint'];
    global.OldMaxPoint=jsonData[0]['OldMaxPoint'];
  }
}
Future updateProfileInfo(String name,String surname,String bodysize,String giftaddress,int gender,String tel,String birtdate,int favteamid)async{
  var data= await http.get(Uri.parse(url+'UpdateProfile?uid=${global.userid}&name=$name&surname=$surname&bodysize=$bodysize&giftaddress=$giftaddress&gender=$gender&tel=$tel&birthdate=$birtdate&favteamid=$favteamid'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
}
Future getBannerAds()async{
  var data= await http.get(Uri.parse(url+'GetBannerAds?userid=${global.userid}&deviceid=${global.androidId}'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  if(data.statusCode==200){
    var jsonData = json.decode(data.body);
    print('Banner Ad Sonucu Hak: '+data.body);
    global.bannerReaklamHakki = jsonData[0]['BannerAdsHakki'];
  }
}
Future updateBanner()async{
  var data= await http.get(Uri.parse(url+'UpdateBannerAds?userid=${global.userid}&deviceid=${global.androidId}'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  if(data.statusCode==200){
    var jsonData = json.decode(data.body);

    // print('REWARD APISI SONUCU: '+jsonData);
  }
}
Future getRewards()async{
  var data= await http.get(Uri.parse(url+'GetRewards?userid=${global.userid}&deviceid=${global.androidId}'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  if(data.statusCode==200){
    var jsonData = json.decode(data.body);
    print('KALAN SÜRELER: '+data.body);
    global.reklamhakki = jsonData[0]['ReklamHakki'];
    global.kalansure1 = jsonData[0]['KalanSure1'];
    global.kalansure2 = jsonData[0]['KalanSure2'];
    global.kalansure3 = jsonData[0]['KalanSure3'];
  }
}
Future updateReward()async{
  var data= await http.get(Uri.parse(url+'UpdateReward?userid=${global.userid}&deviceid=${global.androidId}'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  if(data.statusCode==200){
    var jsonData = json.decode(data.body);

  }
}

Future getBanner(int userid)async{
  var data= await http.get(Uri.parse(url+'GetBanner?userid=$userid'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  var jsonData=json.decode(data.body);
  print('-----------------------------GetBanner: '+data.body);
  global.BannerID=jsonData[0]['BannerID'];
  global.BannerState=jsonData[0]['BannerState'];
  global.BannerURL=jsonData[0]['BannerURL'];
}
Future bannerClose(int bannerid) async{
  var data= await http.get(Uri.parse(url+'BannerClose?userid=${global.userid}&bannerid=$bannerid'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  if(data.statusCode==200){

    global.BannerID=0;

  }

}
Future getProfileInfo() async{

  var data= await http.get(Uri.parse(url+'GetProfileInfo?uid=${global.userid}'),
  headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken});
  if(data.statusCode==200) {
    var jsonData = json.decode(data.body);
    print('profil ' + data.body);

    global.pName = jsonData[0]['Name'];
    global.pSurname = jsonData[0]['SurName'];
    global.pCinsiyet = jsonData[0]['Gender'];
    global.pBeden = jsonData[0]['BodySize'];
    global.pFTA = jsonData[0]['FantasyName'];
    global.pAdres = jsonData[0]['GiftAddress'];
    global.BirthDate = jsonData[0]['BirthDate'];
    global.Tel = jsonData[0]['Tel'];
    global.Email = jsonData[0]['Email'];
    global.pFavTakim = jsonData[0]['TakimAdi'];
    global.pFavTakimId = jsonData[0]['FavoriteTeamID'];
  }
  else if(data.statusCode==401){
    getToken();
  }
}
class playergetir{
  List<Player> oyuncular=[];
  //Set<Player> oyuncular=new Set<Player>();
  Future<List<Player>> getPlayers(String position,String value,String takimadi) async{
    if(oyuncular.length==0){
      print(position+' '+takimadi);
      var data =await http.get(Uri.parse(url+'Player?p=$position&v=$value&t=$takimadi'),
          headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
      );
      if(data.statusCode==200) {
        print('İstatistik: '+data.body);
        var jsonData = json.decode(data.body);
        for (var u in jsonData) {
          Player oyuncu = Player(
              u['PlayerID'],
              u['TeamID'],
              u['PlayerName'],
              u['PlayerShortName'],
              u['Position'],
              u['Value1'],
              u['Kits'],
              u['TakimKisaltma'],
              u['Form'],
              u['WeekPoints'],
              u['SeasonPoints'],
              u['ElectionRate'],
              u['Injury'],
              u['Leave'],
              u['Description']
          );
          oyuncular.add(oyuncu);
        }
        print("Oyun sayısı" + oyuncular.length.toString());
      }
      else if(data.statusCode==401){
        getToken();
      }
    }

    //return oyuncular;
  }
}

class Takims{
  int TakimId;
  String TakimAdi;
  String TakimLogo;
  Takims(
      this.TakimId,this.TakimAdi,this.TakimLogo
      );
}
class takimlarigetir{
  List<Takims> takimler=[];
  Future<List<Takims>> getTakims() async{
    takimler.clear();
    if(takimler.length==0){
      ///api/GetTeamsLogo
      var data =await http.get(Uri.parse(url+'GetTeamsLogo'),
          headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
      );
      if(data.statusCode==200) {
        var jsonData = json.decode(data.body);
        for (var u in jsonData) {
          Takims takims = Takims(u['TakimID'], u['TakimAdi'], u['TakimLogo']);
          takimler.add(takims);
        }
        print("Oyun sayısı" + takimler.length.toString());
      }
      else if(data.statusCode==401){
        getToken();
      }
    }

    //return oyuncular;
  }
}
class Olaylar{
  String Tag;
  String score;
  String desc1;
  String PlayerShortName;
  String desc2;
  String desc3;
  int type;
  Olaylar(
      this.Tag,this.score,this.desc1,this.PlayerShortName,this.desc2,this.desc3,this.type
      );
}
class olaylarigetir{
  List<Olaylar> olaylar=[];
  //https://ftl.allryazilim.com/api/GetCouponHistory?userid=79
  Future<List<Coupons>> getOlaylar()async{
    olaylar.clear();
    if(olaylar.length==0){
      var data = await http.get(Uri.parse(url + 'FantasyLive'),
          headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
      );
      if(data.statusCode==200){
        var jsonData = json.decode(data.body);
        print('Olaylar sonucu: ' + data.body);
        for (var u in jsonData) {
          Olaylar olays = Olaylar(
              u['Tag'], u['score'], u['desc1'], u['PlayerShortName'],u['desc2'],u['desc3'],u['type']);
          olaylar.add(olays);
        }
      }
    }
  }
}
class SadakatGecmis{
  int userid;
  int typeid;
  String description;
  double amount;
  String date;
  SadakatGecmis(
      this.userid,this.typeid,this.description,this.amount,this.date
      );
}
class sadakatgecmisgetir{
  List<SadakatGecmis> sGList=[];
  //https://ftl.allryazilim.com/api/SadakatHistory?userid=4
  Future<List<SadakatGecmis>> getSadakatHistory()async{
    sGList.clear();
    if(sGList.length==0){
      var data = await http.get(Uri.parse(url + 'SadakatHistory?userid=${global.userid}'),
          headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
      );
      if(data.statusCode==200){
        var jsonData = json.decode(data.body);
        print('Sadakat geçmiş sonucu: ' + data.body);
        for (var u in jsonData) {
          SadakatGecmis sadakatGecmis = SadakatGecmis(
              u['userid'], u['typeid'],u['description'], u['amount'], u['date']);
          sGList.add(sadakatGecmis);
        }
      }
    }
  }
}
class Coupons{
  int siteid;
  int type;
  String coupecode;
  String creationdate;
  int state;
  Coupons(
      this.siteid,this.type,this.coupecode,this.creationdate,this.state
      );
}
class kuponlarigetir{
  List<Coupons> kuponlar=[];
  //https://ftl.allryazilim.com/api/GetCouponHistory?userid=79
  Future<List<Coupons>> getCouponHistory()async{
    kuponlar.clear();
    if(kuponlar.length==0){
      var data = await http.get(Uri.parse(url + 'GetCouponHistory?userid=${global.userid}'),
          headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
      );
      if(data.statusCode==200){
        var jsonData = json.decode(data.body);
        print('Kupon sonucu: ' + data.body);
        for (var u in jsonData) {
          Coupons coupons = Coupons(
              u['siteid'], u['type'], u['couponcode'], u['creationdate'],u['state']);
          kuponlar.add(coupons);
        }
      }
    }
  }
}
class News{
  int HaberID;
  String Baslik;
  String BaslikResim;
  String PaylasimURL;
  News(
      this.HaberID,this.Baslik,this.BaslikResim,this.PaylasimURL
      );
}
class haberlerigetir{
  List<News> haberler=[];
Future<List<News>> getNews() async {
  haberler.clear();
  //https://fantasy.bulutbyte.com/api/GetHaber
   if(haberler.length==0)   {
      var data = await http.get(Uri.parse(url + 'GetHaber'),
          headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
      );
      if(data.statusCode==200) {
        var jsonData = json.decode(data.body);
        print('Haber sonucu: ' + data.body);
        for (var u in jsonData) {
          News news = News(
              u['HaberID'], u['Baslik'], u['BaslikResim'], u['PaylasimURL']);
          haberler.add(news);
        }
      }
      else if(data.statusCode==401){
        getToken();
      }
    }
}}

class haberdetaygetir{

  Future getNewDetail(int haberid) async {

    //https://fantasy.bulutbyte.com/api/GetHaberDetay?hid=1

      var data = await http.get(Uri.parse(url + 'GetHaberDetay?hid=$haberid'),
          headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
      );
      if(data.statusCode==200) {
      var jsonData = json.decode(data.body);
      global.DetayBody = jsonData[0]['DetayBody'];
      global.DetayURL = jsonData[0]['DetayURL'];
      print('Haber Ayrıntı sonucu: ' + data.body);
    }
      else if(data.statusCode==401){
        getToken();
      }
  }}
class League{
  int userID;
  String FantasyName;
  int Points;
  League(
      this.userID,this.FantasyName,this.Points
      );
}
///27.07.2021'de 194. satırda League yazan yerde news yazıyordu -->  Future<List<News>> getLeague() async {
class liglerigetir{
  List<League> ligler=[];
  Future<List<League>> getLeague(int type) async {
    ligler.clear();
    //https://fantasy.bulutbyte.com/api/GetRanking
    if(ligler.length==0)   {
      var data = await http.get(Uri.parse(url + 'GetRanking?type=$type'),
          headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
      );
      if(data.statusCode==200) {
        var jsonData = json.decode(data.body);
        print('Lig sonucu: ' + data.body);
        for (var u in jsonData) {
          League league = League(u['UserID'],u['FantasyName'], u['Points']);
          ligler.add(league);
        }
      }
      else if(data.statusCode==401){
        getToken();
      }
    }
  }
}

class PrivateLeague{
  int userID;
  String FantasyName;
  int Points;
  PrivateLeague(
      this.userID,this.FantasyName,this.Points
      );
}
///27.07.2021'de 194. satırda League yazan yerde news yazıyordu -->  Future<List<News>> getLeague() async {
class privateliglerigetir{
  List<PrivateLeague> privateligler=[];
  Future<List<PrivateLeague>> getPrivateLeague(int oid) async {
    privateligler.clear();
    //https://fantasy.bulutbyte.com/api/GetRanking
    if(privateligler.length==0)   {
      var data = await http.get(Uri.parse(url + 'GetPrivateRanking?oid=$oid'),
          headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
      );
      if(data.statusCode==200) {
        var jsonData = json.decode(data.body);
        print('OZELLig sonucu: ' + data.body);
        for (var u in jsonData) {
          PrivateLeague privateleague = PrivateLeague(u['UserID'],u['FantasyName'], u['Points']);
          privateligler.add(privateleague);
        }
      }
      else if(data.statusCode==401){
        getToken();
      }
    }
  }
}
Future getOzelLigDetay(int oid) async {

  //https://ftl.allryazilim.com/api/GetPrivateAwards?oid=1

  var data = await http.get(Uri.parse(url + 'GetPrivateAwards?oid=$oid'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  if(data.statusCode==200) {
    var jsonData = json.decode(data.body);
    global.awards = jsonData[0]['awards'];

    print('Ozel Lig Ayrıntı sonucu: ' + data.body);
  }
  else if(data.statusCode==401){
    getToken();
  }
}
class OzelLigs{
  int oid;
  String LeagueName;
  int state;
  String Description;
  String CreatedTime;
  String CouponCode;
  OzelLigs(
      this.oid,this.LeagueName,this.state,this.Description,this.CreatedTime,this.CouponCode
      );
}
class ozelliglerigetir{
  List<OzelLigs> ozelligler=[];
  //https://ftl.allryazilim.com/api/GetCouponHistory?userid=79
  Future<List<OzelLigs>> getOzelLigs()async{
    ozelligler.clear();
    if(ozelligler.length==0){
      var data = await http.get(Uri.parse(url + 'GetPrivateLeague'),
          headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
      );
      if(data.statusCode==200){
        var jsonData = json.decode(data.body);
        print('ozel lig sonucu: ' + data.body);
        for (var u in jsonData) {
          OzelLigs ozelligs = OzelLigs(
              u['oid'], u['LeagueName'], u['state'], u['Description'],u['CreatedTime'],u['CouponCode']);
          ozelligler.add(ozelligs);
        }

      }
    }
  }
}
Future getOzelState(int userid,int oid)async{
  var data= await http.get(Uri.parse(url+'GetPrivateState?userid=$userid&oid=$oid'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  var jsonData=json.decode(data.body);
  print('-----------------------------GetPrivateState: '+data.body);
  global.ozelligstate=jsonData;
}

Future getOzelLigJoin(int userid,int oid,String couponcode)async{
  var data= await http.get(Uri.parse(url+'GetPrivateLeagueJoin?userid=$userid&oid=$oid&couponcode=$couponcode'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
  );
  var jsonData=json.decode(data.body);
  print('-----------------------------GetPrivateLeagueJoin: '+data.body);
  global.ozelligjoin=jsonData;
}


class Fixtures{
  int fixid;
  int matchid;
  int haftaid;
  String HomeLogo;
  String HomeTeam;
  String AwayLogo;
  String AwayTeam;
  String MatchTime;
  String MatchDate;
  String MatchResult;
  Fixtures(
      this.fixid,this.matchid,this.haftaid,this.HomeLogo,this.HomeTeam,
      this.AwayLogo,this.AwayTeam,this.MatchTime,this.MatchDate,this.MatchResult
      );
}
class fiksturlerigetir{
  List<Fixtures> fiks=[];
  Future<List<Fixtures>> getFixture(int haftaid) async {
    fiks.clear();
    if(fiks.length==0)   {
      //https://ftl.allryazilim.com/api/GetFixture?hid=1
      var data = await http.get(Uri.parse(url + 'GetFixture?hid=$haftaid'),
          headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
      );
      if(data.statusCode==200) {
        var jsonData = json.decode(data.body);
        print('fikstur sonucu: ' + data.body);
        for (var u in jsonData) {
          Fixtures fixs = Fixtures(
              u['fixid'],
              u['matchid'],
              u['haftaid'],
              u['HL'],
              u['HomeTeam'],
              u['AL'],
              u['AwayTeam'],
              u['MatchTime'],
              u['MatchDate'],
              u['MatchResult']);
          fiks.add(fixs);
        }
      }
      else if(data.statusCode==401){
        getToken();
      }
    }
  }
}
class RankTable{
  int TakimID;
  String TakimKisaltma;
  String TakimLogo;
  int PlayedMatch;
  int Win;
  int Draw;
  int Lose;
  int GF;
  int GA;
  int AVG;
  int Point;
  RankTable(
      this.TakimID,this.TakimKisaltma,this.TakimLogo,this.PlayedMatch,this.Win,
      this.Draw,this.Lose,this.GF,this.GA,this.AVG,this.Point
      );
}
class siralamayigetir{
  List<RankTable> rankt=[];
  Future<List<RankTable>> getRankTable() async {
    rankt.clear();
    if(rankt.length==0)   {
      //https://ftl.allryazilim.com/api/GetFixture?hid=1
      var data = await http.get(Uri.parse(url + 'GetRankTable'),
          headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
      );
      if(data.statusCode==200) {
        var jsonData = json.decode(data.body);
        print('RankTable sonucu: ' + data.body);
        for (var u in jsonData) {
          RankTable rankTable = RankTable(
              u['TakimID'],
              u['TakimKisaltma'],
              u['TakimLogo'],
              u['PlayedMatch'],
              u['Win'],
              u['Draw'],
              u['Lose'],
              u['GF'],
              u['GA'],
              u['Avg'],
            u['Point']
          );
          rankt.add(rankTable);
        }
      }
      else if(data.statusCode==401){
        getToken();
      }
    }
  }
}

class Teams{
  String Takimadi;
  Teams(
      this.Takimadi,
      );
}
class takimgetir{
  List<Teams> takimler=[];
  Future<List<Teams>> getTeams() async{
      var data =await http.get(Uri.parse(url+'GetTeamList'),
          headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
      );
      if(data.statusCode==200) {
      var jsonData = json.decode(data.body);
      for (var u in jsonData) {
        Teams teams = Teams(
          u['TakimAdi'],
        );
        takimler.add(teams);
      }
      print("takim sayısı" + takimler.length.toString());

      return takimler;
    }
      else if(data.statusCode==401){
        getToken();
      }
  }

}
