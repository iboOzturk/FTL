import 'package:flutter/material.dart';
class ForgotPassPage extends StatefulWidget {
  @override
  _ForgotPassPageState createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  TextEditingController _emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('Şifremi unuttum'),
        leading: IconButton(onPressed: () {
          Navigator.pushNamed(context, '/login');
        },icon: Icon(Icons.arrow_back_ios),
        ),
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
        ), ),
      body: Container(alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Şifreni sıfırlamak için email adresinizi giriniz',
            style: TextStyle(color: Colors.white),),
            SizedBox(height: 15,),
            Padding(
              padding: EdgeInsets.only(right: 20,left: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                        color: Colors.white,
                        blurRadius: 20,
                        offset: Offset(0, 7)
                    )]
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black))
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),

            RaisedButton(onPressed: () {},child: Text('Şifremi sıfırla'),color: Colors.red,textColor: Colors.white,)
          ],
        ),
      ),
    );
  }
}
