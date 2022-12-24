import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:device_info/device_info.dart';
import 'package:http/http.dart' as http;
import '../Variables/global.dart' as global;
import 'player_api.dart';


///Asıl api
String url='APILINK';

///Login servisi
class Giris {
  String useremail;
  int userid;
  int loginkontrol;
  Future<String> getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      print(iosDeviceInfo.toString());
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      global.androidId=androidDeviceInfo.androidId.toString();
     // return androidDeviceInfo.androidId; // unique ID on Android

    }
  }
  Future<int> LoginService2(String username, String pass,String DeviceId) async {
    loginkontrol=0;
    final ref = await http.get(
        Uri.parse(url + 'Login2?user=$username&pass=$pass&deviceid=$DeviceId'),
        headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken
          });

    if (ref.statusCode == 200) {
      // If the server returns an OK response, then parse the JSON.
      var jsonData = json.decode(ref.body);

      // print('userid gelmesi lazımmmm: '+jsonData[0]['userid']);
      loginkontrol = jsonData[0]['userid'];
      global.userid = jsonData[0]['userid'];

      global.email = jsonData[0]['useremail'];
      global.fantasyteamname=jsonData[0]['TeamName'];
      global.userName=jsonData[0]['UserName'];
      global.userSurname=jsonData[0]['UserSurName'];
      global.AndroidVersion=jsonData[0]['AndroidVersion'];
      global.IOSVersion=jsonData[0]['IOSVersion'];
      global.adsBannerState=jsonData[0]['AdsBannerState'];
      global.adsRewardState=jsonData[0]['AdsRewardState'];

      return loginkontrol;
    }  else if(ref.statusCode==401){
      getToken();
    }
  }
  Future signOut(int userid) async{
    final ref = await http.get(
        Uri.parse(url + 'LogOut?userid=$userid'),
        headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken});
  }
  ///28.07.2021 00:52'de eklendi ama sadece eklendi bi yer ile bağlantılı değil haberdeneme projesinden kodları alabilirsin
  String accesstoken;
  String tokentype;

  Future getToken() async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };

    ///asıl api
    var request = http.Request('POST', Uri.parse('TOKENLINK'));
    request.bodyFields = {
      'grant_type': 'password',
      'username': 'username',
      'password': 'password'
    };

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String data=await response.stream.bytesToString();
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

  Future getBankInfo() async{
    final ref = await http.get(
      Uri.parse(url + 'GetUserBank?userid=${global.userid}'),
        headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}
    );
    if(ref.statusCode==200){
      var jsonData = json.decode(ref.body);
      print('BODY: '+ref.body);
        print('Bütçe: '+jsonData[0]['Butce'].toString());
        print('Transpoint: '+jsonData[0]['TransferPoint'].toString());
        global.Butce=jsonData[0]['Butce'];
        global.TransferPuan=jsonData[0]['TransferPoint'];
        global.FreeTransfer=jsonData[0]['FreeTransfer'];
        global.Expense=jsonData[0]['Expense'];
    }
    else if(ref.statusCode==401){
      getToken();
    }
  }
  Future<int> CreateTeam(int userid) async{
    final ref=await http.get(
        Uri.parse(url+'CreateTeam?userID=$userid'),
        headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}

    );
    if(ref.statusCode==200){
      print('ref.body: '+ref.body);
    } else {
      // If the response was umexpected, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
Future Register(String name,String surname,String fantasyName,String email,String pass,
    int FavTeam,
    int kvkk) async{

  var data=await http.get(
      Uri.parse(url+'Register2?reg_Name=$name&reg_SurName=$surname&reg_FantasyName=$fantasyName&reg_Email=$email&reg_Password=$pass&reg_FavoriteTeamID=$FavTeam&reg_KVKK=$kvkk'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}

  );
  if(data.statusCode==200) {
    print('Register durum: ' + data.body);
    global.registerdurum = int.parse(data.body);
  }
  else if(data.statusCode==401){
    getToken();
  }
}

class MyTeam2{
  int UserID;
  int Orders;
  String Employee;
  int PlayerID;
  int TeamID;
  String PlayerName;
  String PlayerShortName;
  String Position;
  String Value;
  String Kits;
  int Point;
  String TakimKisaltma;
  MyTeam2(
      this.UserID,this.Orders,this.Employee,this.PlayerID,this.TeamID,this.PlayerName,this.PlayerShortName,
      this.Position,this.Value,this.Kits,this.Point,this.TakimKisaltma
      );
}

///takımımı getiren fonksiyon
Future<List<MyTeam>> getPointTeams(int userid,int haftaid)async{
  //  var data=await http.get(Uri.parse(url+'GetPointTeams?userid=$userid'),
  var data=await http.get(Uri.parse(url+'GetPointTeams2?userid=$userid&haftaid=$haftaid'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}

  );
  if(data.statusCode==200){
    //print(data.body);
    var jsonData=json.decode(data.body);
    global.gelenOyuncuSayisi=0;
    List<MyTeam> takimimS=[];
    for(var f in jsonData){
      MyTeam myTeam=MyTeam(f['UserID'], f['Orders'],f['HaftaID'] ,f['Employee'], f['PlayerID'], f['TeamID'],
          f['PlayerName'], f['PlayerShortName'], f['Position'], f['Value'], f['Kits'],f['point'],
          f['TakimKisaltma'],f['Injury'],f['Leave'],f['Description'],f['ISPlayed']);
      takimimS.add(myTeam);
      global.haftaID=f['HaftaID'];
      if(f['PlayerID']!=0){
        global.gelenOyuncuSayisi=global.gelenOyuncuSayisi+1;
      }
      if(f['Employee']=='Kaleci0'){
        global.kaleci0PlayerShortName=f['PlayerShortName'];
        global.kaleci0Kits=f['Kits'];
        global.kaleci0PlayerID=f['PlayerID'];
        global.kaleci0Value=f['Value'];
        global.kaleci0Pos=f['Position'];
        global.kaleci0emp=f['Employee'];
        global.kaleci0Puan=f['point'];
        global.K0takimKisa=f['TakimKisaltma'];
        global.K0injury=f['Injury'];
        global.K0leave=f['Leave'];
        global.K0Desp=f['Description'];
        global.K0isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='YedekKaleci'){
        global.kaleci1PlayerShortName=f['PlayerShortName'];
        global.kaleci1Kits=f['Kits'];
        global.kaleci1PlayerID=f['PlayerID'];
        global.kaleci1Value=f['Value'];
        global.kaleci1Pos=f['Position'];
        global.kaleci1emp=f['Employee'];
        global.kaleci1Puan=f['point'];
        global.K1takimKisa=f['TakimKisaltma'];
        global.K1injury=f['Injury'];
        global.K1leave=f['Leave'];
        global.K1Desp=f['Description'];
        global.K1isplay=f['ISPlayed'];


      }
      else if(f['Employee']=='Defans0'){
        global.defans0PlayerShortName=f['PlayerShortName'];
        global.defans0Kits=f['Kits'];
        global.defans0PlayerID=f['PlayerID'];
        global.defans0Value=f['Value'];
        global.defans0Pos=f['Position'];
        global.defans0emp=f['Employee'];
        global.defans0Puan=f['point'];
        global.D0takimKisa=f['TakimKisaltma'];
        global.D0injury=f['Injury'];
        global.D0leave=f['Leave'];
        global.D0Desp=f['Description'];
        global.D0isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='Defans1'){
        global.defans1PlayerShortName=f['PlayerShortName'];
        global.defans1Kits=f['Kits'];
        global.defans1PlayerID=f['PlayerID'];
        global.defans1Value=f['Value'];
        global.defans1Pos=f['Position'];
        global.defans1emp=f['Employee'];
        global.defans1Puan=f['point'];
        global.D1takimKisa=f['TakimKisaltma'];
        global.D1injury=f['Injury'];
        global.D1leave=f['Leave'];
        global.D1Desp=f['Description'];
        global.D1isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='Defans2'){
        global.defans2PlayerShortName=f['PlayerShortName'];
        global.defans2Kits=f['Kits'];
        global.defans2PlayerID=f['PlayerID'];
        global.defans2Value=f['Value'];
        global.defans2Pos=f['Position'];
        global.defans2emp=f['Employee'];
        global.defans2Puan=f['point'];
        global.D2takimKisa=f['TakimKisaltma'];
        global.D2injury=f['Injury'];
        global.D2leave=f['Leave'];
        global.D2Desp=f['Description'];
        global.D2isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='Defans3'){
        global.defans3PlayerShortName=f['PlayerShortName'];
        global.defans3Kits=f['Kits'];
        global.defans3PlayerID=f['PlayerID'];
        global.defans3Value=f['Value'];
        global.defans3Pos=f['Position'];
        global.defans3emp=f['Employee'];
        global.defans3Puan=f['point'];
        global.D3takimKisa=f['TakimKisaltma'];
        global.D3injury=f['Injury'];
        global.D3leave=f['Leave'];
        global.D3Desp=f['Description'];
        global.D3isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='Defans4'){
        global.defans4PlayerShortName=f['PlayerShortName'];
        global.defans4Kits=f['Kits'];
        global.defans4PlayerID=f['PlayerID'];
        global.defans4Value=f['Value'];
        global.defans4Pos=f['Position'];
        global.defans4emp=f['Employee'];
        global.defans4Puan=f['point'];
        global.D4takimKisa=f['TakimKisaltma'];
        global.D4injury=f['Injury'];
        global.D4leave=f['Leave'];
        global.D4Desp=f['Description'];
        global.D4isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='OrtaSaha0'){
        global.ortasaha0PlayerShortName=f['PlayerShortName'];
        global.ortasaha0Kits=f['Kits'];
        global.ortasaha0PlayerID=f['PlayerID'];
        global.ortasaha0Value=f['Value'];
        global.ortasaha0Pos=f['Position'];
        global.ortasaha0emp=f['Employee'];
        global.ortasaha0Puan=f['point'];
        global.OS0takimKisa=f['TakimKisaltma'];
        global.OS0injury=f['Injury'];
        global.OS0leave=f['Leave'];
        global.OS0Desp=f['Description'];
        global.OS0isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='OrtaSaha1'){
        global.ortasaha1PlayerShortName=f['PlayerShortName'];
        global.ortasaha1Kits=f['Kits'];
        global.ortasaha1PlayerID=f['PlayerID'];
        global.ortasaha1Value=f['Value'];
        global.ortasaha1Pos=f['Position'];
        global.ortasaha1emp=f['Employee'];
        global.ortasaha1Puan=f['point'];
        global.OS1takimKisa=f['TakimKisaltma'];
        global.OS1injury=f['Injury'];
        global.OS1leave=f['Leave'];
        global.OS1Desp=f['Description'];
        global.OS1isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='OrtaSaha2'){
        global.ortasaha2PlayerShortName=f['PlayerShortName'];
        global.ortasaha2Kits=f['Kits'];
        global.ortasaha2PlayerID=f['PlayerID'];
        global.ortasaha2Value=f['Value'];
        global.ortasaha2Pos=f['Position'];
        global.ortasaha2emp=f['Employee'];
        global.ortasaha2Puan=f['point'];
        global.OS2takimKisa=f['TakimKisaltma'];
        global.OS2injury=f['Injury'];
        global.OS2leave=f['Leave'];
        global.OS2Desp=f['Description'];
        global.OS2isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='OrtaSaha3'){
        global.ortasaha3PlayerShortName=f['PlayerShortName'];
        global.ortasaha3Kits=f['Kits'];
        global.ortasaha3PlayerID=f['PlayerID'];
        global.ortasaha3Value=f['Value'];
        global.ortasaha3Pos=f['Position'];
        global.ortasaha3emp=f['Employee'];
        global.ortasaha3Puan=f['point'];
        global.OS3takimKisa=f['TakimKisaltma'];
        global.OS3injury=f['Injury'];
        global.OS3leave=f['Leave'];
        global.OS3Desp=f['Description'];
        global.OS3isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='OrtaSaha4'){
        global.ortasaha4PlayerShortName=f['PlayerShortName'];
        global.ortasaha4Kits=f['Kits'];
        global.ortasaha4PlayerID=f['PlayerID'];
        global.ortasaha4Value=f['Value'];
        global.ortasaha4Pos=f['Position'];
        global.ortasaha4emp=f['Employee'];
        global.ortasaha4Puan=f['point'];
        global.OS4takimKisa=f['TakimKisaltma'];
        global.OS4injury=f['Injury'];
        global.OS4leave=f['Leave'];
        global.OS4Desp=f['Description'];
        global.OS4isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='Forvet0'){
        global.forvet0PlayerShortName=f['PlayerShortName'];
        global.forvet0Kits=f['Kits'];
        global.forvet0PlayerID=f['PlayerID'];
        global.forvet0Value=f['Value'];
        global.forvet0Pos=f['Position'];
        global.forvet0emp=f['Employee'];
        global.forvet0Puan=f['point'];
        global.F0takimKisa=f['TakimKisaltma'];
        global.F0injury=f['Injury'];
        global.F0leave=f['Leave'];
        global.F0Desp=f['Description'];
        global.F0isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='Forvet1'){
        global.forvet1PlayerShortName=f['PlayerShortName'];
        global.forvet1Kits=f['Kits'];
        global.forvet1PlayerID=f['PlayerID'];
        global.forvet1Value=f['Value'];
        global.forvet1Pos=f['Position'];
        global.forvet1emp=f['Employee'];
        global.forvet1Puan=f['point'];
        global.F1takimKisa=f['TakimKisaltma'];
        global.F1injury=f['Injury'];
        global.F1leave=f['Leave'];
        global.F1Desp=f['Description'];
        global.F1isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='Forvet2'){
        global.forvet2PlayerShortName=f['PlayerShortName'];
        global.forvet2Kits=f['Kits'];
        global.forvet2PlayerID=f['PlayerID'];
        global.forvet2Value=f['Value'];
        global.forvet2Pos=f['Position'];
        global.forvet2emp=f['Employee'];
        global.forvet2Puan=f['point'];
        global.F2takimKisa=f['TakimKisaltma'];
        global.F2injury=f['Injury'];
        global.F2leave=f['Leave'];
        global.F2Desp=f['Description'];
        global.F2isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='Yedek2'){
        global.yedek2PlayerShortName=f['PlayerShortName'];
        global.yedek2Kits=f['Kits'];
        global.yedek2PlayerID=f['PlayerID'];
        global.yedek2Value=f['Value'];
        global.yedek2Pos=f['Position'];
        global.yedek2emp=f['Employee'];
        global.yedek2Puan=f['point'];
        global.Y2takimKisa=f['TakimKisaltma'];
        global.Y2injury=f['Injury'];
        global.Y2leave=f['Leave'];
        global.Y2Desp=f['Description'];
        global.Y2isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='Yedek1'){
        global.yedek1PlayerShortName=f['PlayerShortName'];
        global.yedek1Kits=f['Kits'];
        global.yedek1PlayerID=f['PlayerID'];
        global.yedek1Value=f['Value'];
        global.yedek1Pos=f['Position'];
        global.yedek1emp=f['Employee'];
        global.yedek1Puan=f['point'];
        global.Y1takimKisa=f['TakimKisaltma'];
        global.Y1injury=f['Injury'];
        global.Y1leave=f['Leave'];
        global.Y1Desp=f['Description'];
        global.Y1isplay=f['ISPlayed'];

      }
      else if(f['Employee']=='Yedek0'){
        global.yedek0PlayerShortName=f['PlayerShortName'];
        global.yedek0Kits=f['Kits'];
        global.yedek0PlayerID=f['PlayerID'];
        global.yedek0Value=f['Value'];
        global.yedek0Pos=f['Position'];
        global.yedek0emp=f['Employee'];
        global.yedek0Puan=f['point'];
        global.Y0takimKisa=f['TakimKisaltma'];
        global.Y0injury=f['Injury'];
        global.Y0leave=f['Leave'];
        global.Y0Desp=f['Description'];
        global.Y0isplay=f['ISPlayed'];


      }
    }

    print('uzunluk: '+global.gelenOyuncuSayisi.toString());
    return takimimS;
  }
  else if(data.statusCode==401){
    getToken();
  }
}

///Takımım modeli
class MyTeam{
  int UserID;
  int Orders;
  int haftaId;
  String Employee;
  int PlayerID;
  int TeamID;
  String PlayerName;
  String PlayerShortName;
  String Position;
  String Value;
  String Kits;
  int Point;
  String TakimKisaltma;
  int Injury;
  int Leave;
  String Desp;
  int ISPlayed;
  MyTeam(
      this.UserID,this.Orders,this.haftaId,this.Employee,this.PlayerID,this.TeamID,this.PlayerName,this.PlayerShortName,
      this.Position,this.Value,this.Kits,this.Point,this.TakimKisaltma,this.Injury,this.Leave,this.Desp,this.ISPlayed
      );
}

///takımımı getiren fonksiyon
Future<List<MyTeam>> getTakimim(int userid)async{
  var data=await http.get(Uri.parse(url+'GetTeam?userid=$userid'),
      headers: {"Accept": "application/json","Authorization":global.tokentype+global.accesstoken}

  );
  if(data.statusCode==200){
    var jsonData=json.decode(data.body);
    global.gelenOyuncuSayisi=0;
    List<MyTeam> takimimS=[];
    for(var f in jsonData){
      MyTeam myTeam=MyTeam(f['UserID'], f['Orders'],f['HaftaID'] ,f['Employee'], f['PlayerID'], f['TeamID'],
          f['PlayerName'], f['PlayerShortName'], f['Position'], f['Value'], f['Kits'],f['point'],
      f['TakimKisaltma'],f['Injury'],f['Leave'],f['Description'],f['ISPlayed']);

      takimimS.add(myTeam);
      global.teamhaftaID=f['HaftaID'];

      if(f['PlayerID']!=0){
        global.gelenOyuncuSayisi=global.gelenOyuncuSayisi+1;
      }
      if(f['Employee']=='Kaleci0'){
        global.kaleci0PlayerShortName=f['PlayerShortName'];
        global.kaleci0Kits=f['Kits'];
        global.kaleci0PlayerID=f['PlayerID'];
        global.kaleci0Value=f['Value'];
        global.kaleci0Pos=f['Position'];
        global.kaleci0emp=f['Employee'];
        global.kaleci0Puan=f['point'];
        global.K0takimKisa=f['TakimKisaltma'];
        global.K0injury=f['Injury'];
        global.K0leave=f['Leave'];
        global.K0Desp=f['Description'];
      }
      else if(f['Employee']=='YedekKaleci'){
        global.kaleci1PlayerShortName=f['PlayerShortName'];
        global.kaleci1Kits=f['Kits'];
        global.kaleci1PlayerID=f['PlayerID'];
        global.kaleci1Value=f['Value'];
        global.kaleci1Pos=f['Position'];
        global.kaleci1emp=f['Employee'];
        global.kaleci1Puan=f['point'];
        global.K1takimKisa=f['TakimKisaltma'];
        global.K1injury=f['Injury'];
        global.K1leave=f['Leave'];
        global.K1Desp=f['Description'];

      }
      else if(f['Employee']=='Defans0'){
        global.defans0PlayerShortName=f['PlayerShortName'];
        global.defans0Kits=f['Kits'];
        global.defans0PlayerID=f['PlayerID'];
        global.defans0Value=f['Value'];
        global.defans0Pos=f['Position'];
        global.defans0emp=f['Employee'];
        global.defans0Puan=f['point'];
        global.D0takimKisa=f['TakimKisaltma'];
        global.D0injury=f['Injury'];
        global.D0leave=f['Leave'];
        global.D0Desp=f['Description'];


      }
      else if(f['Employee']=='Defans1'){
        global.defans1PlayerShortName=f['PlayerShortName'];
        global.defans1Kits=f['Kits'];
        global.defans1PlayerID=f['PlayerID'];
        global.defans1Value=f['Value'];
        global.defans1Pos=f['Position'];
        global.defans1emp=f['Employee'];
        global.defans1Puan=f['point'];
        global.D1takimKisa=f['TakimKisaltma'];
        global.D1injury=f['Injury'];
        global.D1leave=f['Leave'];
        global.D1Desp=f['Description'];


      }
      else if(f['Employee']=='Defans2'){
        global.defans2PlayerShortName=f['PlayerShortName'];
        global.defans2Kits=f['Kits'];
        global.defans2PlayerID=f['PlayerID'];
        global.defans2Value=f['Value'];
        global.defans2Pos=f['Position'];
        global.defans2emp=f['Employee'];
        global.defans2Puan=f['point'];
        global.D2takimKisa=f['TakimKisaltma'];
        global.D2injury=f['Injury'];
        global.D2leave=f['Leave'];
        global.D2Desp=f['Description'];


      }
      else if(f['Employee']=='Defans3'){
        global.defans3PlayerShortName=f['PlayerShortName'];
        global.defans3Kits=f['Kits'];
        global.defans3PlayerID=f['PlayerID'];
        global.defans3Value=f['Value'];
        global.defans3Pos=f['Position'];
        global.defans3emp=f['Employee'];
        global.defans3Puan=f['point'];
        global.D3takimKisa=f['TakimKisaltma'];
        global.D3injury=f['Injury'];
        global.D3leave=f['Leave'];
        global.D3Desp=f['Description'];


      }
      else if(f['Employee']=='Defans4'){
        global.defans4PlayerShortName=f['PlayerShortName'];
        global.defans4Kits=f['Kits'];
        global.defans4PlayerID=f['PlayerID'];
        global.defans4Value=f['Value'];
        global.defans4Pos=f['Position'];
        global.defans4emp=f['Employee'];
        global.defans4Puan=f['point'];
        global.D4takimKisa=f['TakimKisaltma'];
        global.D4injury=f['Injury'];
        global.D4leave=f['Leave'];
        global.D4Desp=f['Description'];


      }
      else if(f['Employee']=='OrtaSaha0'){
        global.ortasaha0PlayerShortName=f['PlayerShortName'];
        global.ortasaha0Kits=f['Kits'];
        global.ortasaha0PlayerID=f['PlayerID'];
        global.ortasaha0Value=f['Value'];
        global.ortasaha0Pos=f['Position'];
        global.ortasaha0emp=f['Employee'];
        global.ortasaha0Puan=f['point'];
        global.OS0takimKisa=f['TakimKisaltma'];
        global.OS0injury=f['Injury'];
        global.OS0leave=f['Leave'];
        global.OS0Desp=f['Description'];


      }
      else if(f['Employee']=='OrtaSaha1'){
        global.ortasaha1PlayerShortName=f['PlayerShortName'];
        global.ortasaha1Kits=f['Kits'];
        global.ortasaha1PlayerID=f['PlayerID'];
        global.ortasaha1Value=f['Value'];
        global.ortasaha1Pos=f['Position'];
        global.ortasaha1emp=f['Employee'];
        global.ortasaha1Puan=f['point'];
        global.OS1takimKisa=f['TakimKisaltma'];
        global.OS1injury=f['Injury'];
        global.OS1leave=f['Leave'];
        global.OS1Desp=f['Description'];


      }
      else if(f['Employee']=='OrtaSaha2'){
        global.ortasaha2PlayerShortName=f['PlayerShortName'];
        global.ortasaha2Kits=f['Kits'];
        global.ortasaha2PlayerID=f['PlayerID'];
        global.ortasaha2Value=f['Value'];
        global.ortasaha2Pos=f['Position'];
        global.ortasaha2emp=f['Employee'];
        global.ortasaha2Puan=f['point'];
        global.OS2takimKisa=f['TakimKisaltma'];
        global.OS2injury=f['Injury'];
        global.OS2leave=f['Leave'];
        global.OS2Desp=f['Description'];


      }
      else if(f['Employee']=='OrtaSaha3'){
        global.ortasaha3PlayerShortName=f['PlayerShortName'];
        global.ortasaha3Kits=f['Kits'];
        global.ortasaha3PlayerID=f['PlayerID'];
        global.ortasaha3Value=f['Value'];
        global.ortasaha3Pos=f['Position'];
        global.ortasaha3emp=f['Employee'];
        global.ortasaha3Puan=f['point'];
        global.OS3takimKisa=f['TakimKisaltma'];
        global.OS3injury=f['Injury'];
        global.OS3leave=f['Leave'];
        global.OS3Desp=f['Description'];


      }
      else if(f['Employee']=='OrtaSaha4'){
        global.ortasaha4PlayerShortName=f['PlayerShortName'];
        global.ortasaha4Kits=f['Kits'];
        global.ortasaha4PlayerID=f['PlayerID'];
        global.ortasaha4Value=f['Value'];
        global.ortasaha4Pos=f['Position'];
        global.ortasaha4emp=f['Employee'];
        global.ortasaha4Puan=f['point'];
        global.OS4takimKisa=f['TakimKisaltma'];
        global.OS4injury=f['Injury'];
        global.OS4leave=f['Leave'];
        global.OS4Desp=f['Description'];


      }
      else if(f['Employee']=='Forvet0'){
        global.forvet0PlayerShortName=f['PlayerShortName'];
        global.forvet0Kits=f['Kits'];
        global.forvet0PlayerID=f['PlayerID'];
        global.forvet0Value=f['Value'];
        global.forvet0Pos=f['Position'];
        global.forvet0emp=f['Employee'];
        global.forvet0Puan=f['point'];
        global.F0takimKisa=f['TakimKisaltma'];
        global.F0injury=f['Injury'];
        global.F0leave=f['Leave'];
        global.F0Desp=f['Description'];



      }
      else if(f['Employee']=='Forvet1'){
        global.forvet1PlayerShortName=f['PlayerShortName'];
        global.forvet1Kits=f['Kits'];
        global.forvet1PlayerID=f['PlayerID'];
        global.forvet1Value=f['Value'];
        global.forvet1Pos=f['Position'];
        global.forvet1emp=f['Employee'];
        global.forvet1Puan=f['point'];
        global.F1takimKisa=f['TakimKisaltma'];
        global.F1injury=f['Injury'];
        global.F1leave=f['Leave'];
        global.F1Desp=f['Description'];



      }
      else if(f['Employee']=='Forvet2'){
        global.forvet2PlayerShortName=f['PlayerShortName'];
        global.forvet2Kits=f['Kits'];
        global.forvet2PlayerID=f['PlayerID'];
        global.forvet2Value=f['Value'];
        global.forvet2Pos=f['Position'];
        global.forvet2emp=f['Employee'];
        global.forvet2Puan=f['point'];
        global.F2takimKisa=f['TakimKisaltma'];
        global.F2injury=f['Injury'];
        global.F2leave=f['Leave'];
        global.F2Desp=f['Description'];


      }
      else if(f['Employee']=='Yedek2'){
        global.yedek2PlayerShortName=f['PlayerShortName'];
        global.yedek2Kits=f['Kits'];
        global.yedek2PlayerID=f['PlayerID'];
        global.yedek2Value=f['Value'];
        global.yedek2Pos=f['Position'];
        global.yedek2emp=f['Employee'];
        global.yedek2Puan=f['point'];
        global.Y2takimKisa=f['TakimKisaltma'];
        global.Y2injury=f['Injury'];
        global.Y2leave=f['Leave'];
        global.Y2Desp=f['Description'];


      }
      else if(f['Employee']=='Yedek1'){
        global.yedek1PlayerShortName=f['PlayerShortName'];
        global.yedek1Kits=f['Kits'];
        global.yedek1PlayerID=f['PlayerID'];
        global.yedek1Value=f['Value'];
        global.yedek1Pos=f['Position'];
        global.yedek1emp=f['Employee'];
        global.yedek1Puan=f['point'];
        global.Y1takimKisa=f['TakimKisaltma'];
        global.Y1injury=f['Injury'];
        global.Y1leave=f['Leave'];
        global.Y1Desp=f['Description'];


      }
      else if(f['Employee']=='Yedek0'){
        global.yedek0PlayerShortName=f['PlayerShortName'];
        global.yedek0Kits=f['Kits'];
        global.yedek0PlayerID=f['PlayerID'];
        global.yedek0Value=f['Value'];
        global.yedek0Pos=f['Position'];
        global.yedek0emp=f['Employee'];
        global.yedek0Puan=f['point'];
        global.Y0takimKisa=f['TakimKisaltma'];
        global.Y0injury=f['Injury'];
        global.Y0leave=f['Leave'];
        global.Y0Desp=f['Description'];

      }
    }
   print('uzunluk: '+global.gelenOyuncuSayisi.toString());
    return takimimS;
  }
  else if(data.statusCode==401){
    getToken();
  }
}



