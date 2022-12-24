import 'package:flutter/material.dart';
class DenemePage extends StatefulWidget {
  @override
  _DenemePageState createState() => _DenemePageState();
}

class _DenemePageState extends State<DenemePage> {
  @override
  Widget build(BuildContext context) {
    double uzunluk=MediaQuery.of(context).size.height;
    double genislik=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text('Takım kur'),),
      body: Container(
        width: genislik,height: uzunluk,
        color: Colors.purple,
        child: Column(
          children: [
            Expanded(flex: 1,child: Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){}, child: Text('listele')),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: (){}, child: Text('listele')),
                ],
              ),
              color: Colors.grey,
            )
            ),
            Expanded(flex: 1,child: Container(
              color: Colors.green,
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(flex: 1,child: Container(width:5 ,height: 60,color: Colors.black,)),
                      Expanded(flex: 1,child: Container(width:5 ,height: 60,color: Colors.pinkAccent,)),
                      Expanded(flex: 1,child: Container(width:5 ,height: 60,color: Colors.lightGreenAccent,)),
                      Expanded(flex: 1,child: Container(width:5 ,height: 60,color: Colors.amber,)),
                    ],
                  ),

                ],
              ),
            )),
            Expanded(flex: 8,child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(image: AssetImage('assets/images/saha.png'),fit: BoxFit.fill
                  )
              ),

            )
            ),
            Expanded(flex: 1,child: Container(
              color: Colors.white,
            )
            ),
          ],
        ),
      ),
    );
  }
}
