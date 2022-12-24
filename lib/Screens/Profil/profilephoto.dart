import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProfilePhotoPage extends StatefulWidget {
  @override
  _ProfilePhotoPageState createState() => _ProfilePhotoPageState();
}

class _ProfilePhotoPageState extends State<ProfilePhotoPage> {
  Color mavi=Colors.blue;
  Color kirmizi=Colors.red;
  Color yesil=Colors.green;
  Color turuncu=Colors.orange;
  Color pembe=Colors.pinkAccent;
  Color mor=Colors.purple;
  Color sari=Colors.yellow;
  Color turkuaz=Colors.cyanAccent;
  Color siyah=Colors.black;
  Color beyaz=Colors.white;
  Color gri=Colors.grey;
  Color ppBackColor=Colors.green;
  Color ppFronColor=Colors.white;

  IconData ppIcon=Icons.person;
  IconData insan=Icons.person;
  IconData top=Icons.sports_baseball;
  IconData duduk=Icons.sports;
  IconData joy=Icons.sports_esports_outlined;
  IconData klavye=Icons.keyboard;
  IconData motor=Icons.motorcycle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
        //color: Colors.grey.shade300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey.shade900,Colors.lightBlueAccent
            ],
            begin: Alignment.bottomLeft,end: Alignment.topRight,
            tileMode: TileMode.mirror
          )
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),

                child: CircleAvatar(backgroundColor: ppBackColor,
                  radius: 70,
                  child: ClipOval(
                    //child: Image.asset('assets/images/FTLlogo.png', height: 150, width: 150, fit: BoxFit.contain,),
                    child: Icon(
                     ppIcon, size: 124, color: ppFronColor,),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                child: Container(
                  alignment: Alignment.centerLeft,
                    child: Text('Dış Renk',style: TextStyle(fontSize: 18),
                    )
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                            ppBackColor=kirmizi;
                      });
                    },
                      child: CircleAvatar(backgroundColor: Colors.red,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppBackColor=yesil;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.green,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppBackColor=mavi;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.blue,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppBackColor=sari;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.yellow,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppBackColor=turkuaz;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.cyanAccent,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppBackColor=mor;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.purple,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppBackColor=pembe;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.pinkAccent,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppBackColor=turuncu;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.orange,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppBackColor=gri;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.grey,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppBackColor=siyah;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.black,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppBackColor=beyaz;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.white,)
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Şekiller',style: TextStyle(fontSize: 18),
                    )
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppIcon=insan;
                        });
                      },
                      child: CircleAvatar(child: Icon(Icons.person),)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppIcon=top;
                        });
                      },
                      child: CircleAvatar(child: Icon(Icons.sports_baseball),)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppIcon=duduk;
                        });
                      },
                      child: CircleAvatar(child: Icon(Icons.sports),)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppIcon=joy;
                        });
                      },
                      child: CircleAvatar(child: Icon(Icons.sports_esports_outlined),)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppIcon=klavye;
                        });
                      },
                      child: CircleAvatar(child: Icon(Icons.keyboard),)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppIcon=motor;
                        });
                      },
                      child: CircleAvatar(child: Icon(Icons.motorcycle),)
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text('İç Renk',style: TextStyle(fontSize: 18),
                    )
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppFronColor=kirmizi;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.red,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppFronColor=yesil;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.green,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppFronColor=mavi;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.blue,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppFronColor=sari;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.yellow,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppFronColor=turkuaz;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.cyanAccent,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppFronColor=mor;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.purple,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppFronColor=pembe;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.pinkAccent,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppFronColor=turuncu;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.orange,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppFronColor=gri;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.grey,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppFronColor=siyah;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.black,)
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          ppFronColor=beyaz;
                        });
                      },
                      child: CircleAvatar(backgroundColor: Colors.white,)
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
