import 'package:fantasysuperlig/Screens/Logins/welcome.dart';
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import '../../Variables/global.dart' as global;
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool erkek=false;
  bool kadin=false;
  bool belirtilmemis=false;
  String cinsiyet;

  bool s=false;
  bool m=false;
  bool l=false;
  bool xl=false;
  bool xxl=false;
  String beden;

  bool KVKK=false;
  int kvkkid;
  DateTime _dateTime;
  String isim;
  String soyisim;
  String email;
  String sifre;
  String fantasytakimadi;
  String telefonno;
  String adres;
  String dogumyili;
  TextEditingController isimctrl=TextEditingController();
  TextEditingController soyisimctrl=TextEditingController();
  TextEditingController emailctrl=TextEditingController();
  TextEditingController sifrectrl=TextEditingController();
  TextEditingController fantasytakimadictrl=TextEditingController();
  TextEditingController telefonnoctrl=TextEditingController();
  TextEditingController adresctrl=TextEditingController();
  TextEditingController yilctrl=TextEditingController();
  TextEditingController ayctrl=TextEditingController();
  TextEditingController gunctrl=TextEditingController();

  bool sifrebool=false;
  bool dogumyilibool=false;
  final _formKey=GlobalKey<FormState>();
  bool _validateisim=false;
  bool _validatesoyisim=false;
  bool _validatemail=false;
  bool _validatesifre=false;
  bool _validatefta=false;
  bool _validatetelno=false;
  bool _validatedogumyil=false;
  bool _validatedogumay=false;
  bool _validatedogumgun=false;
  bool _validateadres=false;

  bool ema=false;
  /*  @override
  void dispose() {
  isimctrl.dispose();
    soyisimctrl.dispose();
    emailctrl.dispose();
    sifrectrl.dispose();
    super.dispose();
  } */
takimlarigetir t=takimlarigetir();
  @override
  void initState() {
    _dateTime=DateTime.now();
    t.getTakims();
          super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double genislik=MediaQuery.of(context).size.width;
    double uzunluk=MediaQuery.of(context).size.height;
    //dogumyili= _dateTime.year.toString()+'-'+_dateTime.month.toString()+'-'+_dateTime.day.toString();
    dogumyili= yilctrl.text+'-'+ayctrl.text+'-'+gunctrl.text;
    erkek==true?cinsiyet='1':kadin==true?cinsiyet='0':cinsiyet='3';
    s==true?beden='S':m==true?beden='M':l==true?beden='L':xl==true?beden='XL':beden='XXL';
    KVKK==true? kvkkid=1:kvkkid=0;
    return WillPopScope(

      onWillPop: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage() ));

      },
      child: Scaffold(
       // backgroundColor: Color.fromARGB(255, 63, 0, 64),
        appBar: AppBar(title: Text('Yeni Üyelik Oluştur'),
      //  backgroundColor: Color.fromARGB(255, 35, 0, 36),
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
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage() ));

          },
        ),),
        body: SingleChildScrollView(
          child: Form(
            autovalidate: ema,
            child: Container(
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
              width: genislik,height: uzunluk,
              //color:Color.fromARGB(255, 63, 0, 64) ,
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                    child: TextFormField(
                      controller: isimctrl,
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white,fontSize: 28),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white,width: 2)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.green.shade600,width: 2)
                        ),
                        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        labelText: 'Adınız*',labelStyle: TextStyle(color: Colors.white,fontSize: 28),
                        errorText: _validateisim?'Lütfen adınızı giriniz':null,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: soyisimctrl,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white,fontSize: 28),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.white,width: 2)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.green.shade600,width: 2)
                        ),
                        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        labelText: 'Soyadınız*',labelStyle: TextStyle(color: Colors.white,fontSize: 28),
                        errorText: _validatesoyisim?'Lütfen soyadınız giriniz':null,

                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                    child: TextFormField(
                      autofocus: global.mailbool,
                      controller: emailctrl,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value)=>EmailValidator.validate(value)?null:'Lütfen mail adresinizi giriniz',
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white,fontSize: 28),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white,width: 2)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.green.shade600,width: 2)
                        ),
                        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        labelText: 'Mail Adresi*',labelStyle: TextStyle(color: Colors.white,fontSize: 28),
                     //   errorText: _validatemail?'Lütfen mail adresinizi giriniz':null,

                      ),
                    ),),
                  /*
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                    child: TextFormField(
                      controller: emailctrl,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white,width: 2)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.green.shade600,width: 2)
                        ),
                        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        labelText: 'Mail Adresi*',labelStyle: TextStyle(color: Colors.white),
                        errorText: _validatemail?'Lütfen mail adresinizi giriniz':null,

                      ),
                    ),
                  ), */
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: sifrectrl,
                      obscureText: sifrebool,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white,fontSize: 28),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white,width: 2)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.green.shade600,width: 2)
                        ),
                        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        labelText: 'Şifre*',labelStyle: TextStyle(color: Colors.white,fontSize: 28),
                        errorText: _validatesifre?'Lütfen şifrenizi giriniz':null,
                          suffixIcon: IconButton(
                            icon:sifrebool==false?Icon(Icons.remove_red_eye,color: Colors.white,):Icon(Icons.remove_red_eye_outlined,color: Colors.black,),
                            onPressed: () {
                              setState(() {
                                sifrebool==false?sifrebool=true:sifrebool=false;
                              });
                            },
                          )

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                    child: TextFormField(
                      autofocus: global.ftabool,
                      controller: fantasytakimadictrl,
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Color.fromARGB(227, 7, 249, 136 ),fontSize: 28,fontFamily: 'Sriracha'),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white,width: 2)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.green.shade600,width: 2)
                        ),
                        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        labelText: 'Fantezi Takım Adı*',labelStyle: TextStyle(color: Colors.white,fontSize: 28,fontFamily: 'Lexend'),
                        errorText: _validatefta?'Lütfen Fantezi takım adınızı giriniz':null,

                      ),
                    ),
                  ),
                  ///Cinsiyet
                 /* Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10,bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,width: 2),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                            child: Container(width: genislik,height: 25,

                              child: Text('Cinsiyet',style: TextStyle(
                                fontSize: 20,color: Colors.white
                              ),),
                            ),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Checkbox(
                                    checkColor:Colors.black,
                                      activeColor: Colors.white,
                                      value: erkek,
                                      onChanged: (bool value){
                                        if(kadin==true||belirtilmemis==true){
                                          setState(() {
                                           // this.erkek = false;
                                            this.kadin=false;
                                            this.belirtilmemis=false;
                                            this.erkek = true;
                                          });
                                        }
                                        else{
                                          setState(() {
                                            this.erkek = value;
                                          });
                                        }
                                        print('erkek: '+erkek.toString());
                                        print('Kadın: '+kadin.toString());
                                        print('Belitilmemiş: '+belirtilmemis.toString());
                                        print('cinsiyet: '+cinsiyet.toString());
                                      }),
                                  Text('Erkek',style: TextStyle(color: Colors.white))
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Checkbox(
                                      value: kadin,
                                      checkColor:Colors.black,
                                      activeColor: Colors.white,
                                      onChanged: (bool value){
                                          if(erkek==true||belirtilmemis==true){
                                            setState(() {
                                            //  this.kadin = false;
                                              this.kadin=true;
                                              this.belirtilmemis=false;
                                              this.erkek = false;
                                            });
                                          }
                                          else{
                                            setState(() {
                                              this.kadin = value;
                                            });
                                          }
                                          print('Kadın: '+kadin.toString());
                                          print('Belitilmemiş: '+belirtilmemis.toString());
                                          print('erkek: '+erkek.toString());
                                          print('cinsiyet: '+cinsiyet.toString());

                                      }),
                                  Text('Kadın',style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Checkbox(
                                      value: belirtilmemis,
                                      checkColor:Colors.black,
                                      activeColor: Colors.white,
                                      onChanged: (bool value){
                                        if(kadin==true||erkek==true){
                                          setState(() {
                                            //this.belirtilmemis = false;
                                            this.kadin=false;
                                            this.belirtilmemis=true;
                                            this.erkek = false;
                                          });
                                        }
                                        else{
                                          setState(() {
                                            this.belirtilmemis = value;
                                          });
                                        }
                                        print('Belitilmemiş: '+belirtilmemis.toString());
                                        print('kadın: '+kadin.toString());
                                        print('erkek: '+erkek.toString());
                                        print('cinsiyet: '+cinsiyet.toString());

                                      }),
                                  Text('Belirtilmemiş',style: TextStyle(color: Colors.white))
                                ],
                              ),

                            ],
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ), */
                  ///Doğum tarihi
                /*  Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10,bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 2),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                            child: Container(width: genislik,height: 25,

                              child: Text('Doğum Tarihi*',style: TextStyle(
                                  fontSize: 20,color: Colors.white
                              ),),
                            ),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(width: 80,child: TextFormField(
                                keyboardType: TextInputType.datetime,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: gunctrl,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(color: Colors.white,width: 2)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(color: Colors.green.shade600,width: 2)
                                  ),
                                  labelText: 'Gün',labelStyle: TextStyle(color: Colors.white),
                                  errorText: _validatedogumgun?'Lütfen gün\'ü giriniz':null,

                                ),
                              ),),

                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text('/',style: TextStyle(color: Colors.white,fontSize: 16),),
                             ),
                             Container(width: 80,child: TextFormField(
                               keyboardType: TextInputType.datetime,
                               inputFormatters: <TextInputFormatter>[
                                 FilteringTextInputFormatter.digitsOnly
                               ],
                               controller: ayctrl,
                               cursorColor: Colors.white,
                               style: TextStyle(color: Colors.white),
                               decoration: InputDecoration(
                                   enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(15),
                                       borderSide: BorderSide(color: Colors.white,width: 2)
                                   ),
                                   focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(15),
                                       borderSide: BorderSide(color: Colors.green.shade600,width: 2)
                                   ),
                                   // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                   labelText: 'Ay',labelStyle: TextStyle(color: Colors.white),
                                 errorText: _validatedogumay?'Lütfen ay\'ı giriniz':null,

                               ),
                             ),),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('/',style: TextStyle(color: Colors.white,fontSize: 16),),
                              ),
                              Container(width: 80,child: TextFormField(
                                controller: yilctrl,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.datetime,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(color: Colors.white,width: 2)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(color: Colors.green.shade600,width: 2)
                                  ),
                                  labelText: 'Yıl',labelStyle: TextStyle(color: Colors.white),
                                  errorText: _validatedogumyil?'Lütfen yılı\'ı giriniz':null,
                                ),
                              ),),

                            ],
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ), */
                /*  InkWell(
                    onTap: _pickDate,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                      child: Container(
                        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 2,color: Colors.white)
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(dogumyilibool==false?'Doğum tarihinizi seçiniz':

                            _dateTime.year.toString()+'.'+_dateTime.month.toString()+'.'+_dateTime.day.toString(),
                            style: TextStyle(color: Colors.white),),

                            Icon(Icons.calendar_today,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ), */
                /*  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                    child: TextFormField(
                      autofocus: global.telnobool,
                      controller: telefonnoctrl,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white,width: 2)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.green.shade600,width: 2)
                        ),
                        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        labelText: 'Telefon Numarası*',labelStyle: TextStyle(color: Colors.white),

                        errorText: _validatetelno?'Lütfen telefon numarasını giriniz':null,

                      ),
                    ),
                  ), */
                  ///Beden
               /*   Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10,bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 2),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                            child: Container(width: genislik,height: 25,

                              child: Text('Beden',style: TextStyle(
                                  fontSize: 20,color: Colors.white
                              ),),
                            ),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Checkbox(
                                      value: s,
                                      checkColor: Colors.black,
                                      activeColor: Colors.white,
                                      onChanged: (bool value){
                                        if(m==true||l==true||xl==true||xxl==true){
                                          setState(() {
                                           // this.s = false;
                                            this.s=true;
                                            this.m=false;
                                            this.l=false;
                                            this.xl=false;
                                            this.xxl=false;
                                          });
                                        }
                                        else{
                                          setState(() {
                                            this.s = value;
                                          });
                                        }
                                        print('s: '+s.toString());
                                      }),
                                  Text('S',style: TextStyle(color: Colors.white))
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Checkbox(
                                      value: m,
                                      checkColor: Colors.black,
                                      activeColor: Colors.white,
                                      onChanged: (bool value){
                                        if(s==true||l==true||xl==true||xxl==true){
                                          setState(() {
                                           // this.m = false;
                                            this.s=false;
                                            this.m=true;
                                            this.l=false;
                                            this.xl=false;
                                            this.xxl=false;
                                          });
                                        }
                                        else{
                                          setState(() {
                                            this.m = value;
                                          });
                                        }
                                        print('m: '+m.toString());

                                      }),
                                  Text('M',style: TextStyle(color: Colors.white))
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Checkbox(
                                      value: l,
                                      checkColor: Colors.black,
                                      activeColor: Colors.white,
                                      onChanged: (bool value){
                                        if(m==true||s==true||xl==true||xxl==true){
                                          setState(() {
                                            //this.l = false;
                                            this.s=false;
                                            this.m=false;
                                            this.l=true;
                                            this.xl=false;
                                            this.xxl=false;
                                          });
                                        }
                                        else{
                                          setState(() {
                                            this.l = value;
                                          });
                                        }
                                        print('L: '+l.toString());

                                      }),
                                  Text('L',style: TextStyle(color: Colors.white))
                                ],
                              ),
                              Column(
                                children: [
                                  Checkbox(
                                      value: xl,
                                      checkColor: Colors.black,
                                      activeColor: Colors.white,
                                      onChanged: (bool value){
                                        if(m==true||l==true||s==true||xxl==true){
                                          setState(() {
                                            //this.xl = false;
                                            this.s=false;
                                            this.m=false;
                                            this.l=false;
                                            this.xl=true;
                                            this.xxl=false;
                                          });
                                        }
                                        else{
                                          setState(() {
                                            this.xl = value;
                                          });
                                        }
                                        print('xl: '+xl.toString());

                                      }),
                                  Text('XL',style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              Column(
                                children: [
                                  Checkbox(
                                      value: xxl,
                                      checkColor: Colors.black,
                                      activeColor: Colors.white,
                                      onChanged: (bool value){
                                        if(m==true||l==true||xl==true||s==true) {
                                          setState(() {
                                            //this.xxl = false;
                                            this.s=false;
                                            this.m=false;
                                            this.l=false;
                                            this.xl=false;
                                            this.xxl=true;
                                          });
                                        }
                                        else{
                                          setState(() {
                                            this.xxl = value;
                                          });
                                        }
                                        print('xxl: '+xxl.toString());

                                      }),
                                  Text('XXL',style: TextStyle(color: Colors.white))
                                ],
                              ),

                            ],
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ), */
                  ///adres
              /*    Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16,bottom: 16),
                    child: TextFormField(
                      controller: adresctrl,
                      keyboardType: TextInputType.streetAddress,
                      maxLines: 5,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white,width: 2)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.green.shade600,width: 2)
                        ),
                        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        labelText: 'Adres',labelStyle: TextStyle(color: Colors.white),
                        hintText: 'adresinizi ödül kazandığınızda yollmak için istiyoruz*',hintStyle: TextStyle(color: Colors.white54)


                      ),
                    ),
                  ), */
                  ///kvkk
               /*   Row(
                    children: [
                      Checkbox(
                          value: KVKK,
                          checkColor: Colors.black,
                          activeColor: Colors.white,
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
                      )
                    ],
                  ), */
                  SizedBox(height: 10,),
                  RaisedButton(
                    child: Text('Devam'),color: Colors.white,elevation: 10,
                      onPressed: (){
                        setState(() {
                          isimctrl.text.isEmpty||isimctrl.text.length<2 ?_validateisim=true:_validateisim=false;
                        });
                        setState(() {
                          soyisimctrl.text.isEmpty||soyisimctrl.text.length<2?_validatesoyisim=true:_validatesoyisim=false;
                        });
                        setState(() {
                          emailctrl.text.isEmpty?_validatemail=true:_validatemail=false;
                        });
                        setState(() {
                          sifrectrl.text.isEmpty?_validatesifre=true:_validatesifre=false;
                        });
                     /*   setState(() {
                          telefonnoctrl.text.isEmpty||telefonnoctrl.text.length!=10?_validatetelno=true:_validatetelno=false;
                        }); */
                        setState(() {
                          fantasytakimadictrl.text.isEmpty||fantasytakimadictrl.text.length<3?_validatefta=true:_validatefta=false;
                        });
                      /*  setState(() {
                          yilctrl.text.isEmpty||int.parse(yilctrl.text)<1940||int.parse(yilctrl.text)<1?_validatedogumyil=true:_validatedogumyil=false;
                        }); */
                      /*  setState(() {
                          ayctrl.text.isEmpty||int.parse(ayctrl.text)>=13||int.parse(ayctrl.text)<1?_validatedogumay=true:_validatedogumay=false;
                        }); */
                      /*  setState(() {
                          gunctrl.text.isEmpty||int.parse(gunctrl.text)>=32||int.parse(gunctrl.text)<1?_validatedogumgun=true:_validatedogumgun=false;
                        });*/

                        if(_validateisim==true||_validatesoyisim==true||
                            _validatemail==true||_validatesifre==true||
                           _validatefta==true||
                            EmailValidator.validate(emailctrl.text)==false
                        )
                        {
                          setState(() {
                            ema=true;
                          });
                          print('hataa');
                        }
                     /*   else if(KVKK==false){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.white,
                              content: Text(
                                  'KVKK sözleşmesini okuyup onaylamanız gerekiyor',
                                style: TextStyle(color: Colors.black),
                              )
                          )
                          );
                        } */
                        else{
                          var data=[];
                          data.add(isimctrl.text);
                          data.add(soyisimctrl.text);
                          data.add(emailctrl.text);
                          data.add(sifrectrl.text);
                          data.add(fantasytakimadictrl.text.isEmpty?'bos':fantasytakimadictrl.text);
                        //  data.add(cinsiyet);
                        //  data.add(dogumyili=='--'?'2021-05-05':dogumyili);
                        //  data.add(telefonnoctrl.text.isEmpty?'bos':telefonnoctrl.text);
                        //  data.add(beden);
                        //  data.add(adresctrl.text.isEmpty?null:adresctrl.text);
                        //  data.add(kvkkid);
                        //Navigator.pushNamed(context, '/register2',arguments: data);
                        Navigator.pushNamed(context, '/kvkk',arguments: data);
                        }
                      }
                  ),
                  SizedBox(height: 30,),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _pickDate() async{
    DateTime date=await showDatePicker(

        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(DateTime.now().year-50),
        lastDate: DateTime(DateTime.now().year+1)
    );
    if(date!=null){
      setState(() {
        _dateTime=date;
        dogumyilibool=true;
      });
    }
  }
}
