import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({
    Key key,
    @required this.image,
    @required this.name,
    @required this.value,
    @required this.top,
    @required this.right,
    @required this.left,
    @required this.position,
    @required this.gideceksayfa,
    @required this.pozisyon,
    @required this.neresi,
  })  : assert(top > 0.0),
        super(key: key);
  final String image;
  final String name;
  final String value;
  final String position;
  final double top;
  final double right;
  final double left;
  final String gideceksayfa;
  final String pozisyon;
  final String neresi;
///0.6773399
  @override
  Widget build(BuildContext context) {

    //double fontBoyut=13;
    final double _height = MediaQuery.of(context).size.height;
    double height = 0.18181818 * (0.5000299 * _height);
    final double _width = MediaQuery.of(context).size.width;
    final double _fieldH = 0.8143399 * _height;
    // double height = 0.18181818 * (0.5894399 * _height);
    return new Positioned(
      child: GestureDetector(
        onTap: (){
          var data=[];
          data.add(pozisyon);
          data.add(neresi);
          Navigator.pushNamed(context, '/$gideceksayfa',arguments: data);},
        child: Container(
          child: Column(children: [
           // Image.asset(image, height: position == 'GK' ? height - 10.0 : height),
            Image.network(image,height: height,),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade900, borderRadius: BorderRadius.circular(6.0)),
              height: 29.0,width: 75,
              child: Column(
                children: [
                  Expanded(flex:1,
                    child: Padding(
                        child: Text(
                          name,
                          style: TextStyle(color: Colors.white,fontSize: name.length>8?11:12),
                          textAlign: TextAlign.center,maxLines: 1,
                        ),
                        padding: EdgeInsets.only(left: 2.0, right: 2.0)),
                  ),
                  Expanded(flex:1,
                    child: Padding(
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white,fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.only(left: 3.0, right: 3.0)),
                  ),
                ],
              ),
            ),
          ]),
          height: (height + 29.0),
        ),
      ),
      top: top,
      right: right,
      left: left,
    );
  }
}
