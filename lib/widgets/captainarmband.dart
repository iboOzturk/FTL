import 'package:flutter/material.dart';

class CaptainArmband extends StatelessWidget {
  const CaptainArmband({
    Key key,

    @required this.top,
    @required this.right,
    @required this.left,
    @required this.visibilty,
    @required this.who,

  })  : assert(top > 0.0),
        super(key: key);

  final double top;
  final double right;
  final double left;
  final double visibilty;
  final String who;

  ///0.6773399
  @override
  Widget build(BuildContext context) {
    //double fontBoyut=13;
    final double _height = MediaQuery.of(context).size.height;
    double height = 0.08181818 * (0.0009 * _height);
    // double height = 0.18181818 * (0.5894399 * _height);
    return new Positioned(
      child: Opacity(
        opacity: visibilty,
        child: Container(

          child: Opacity(opacity: 0.7,
          child: CircleAvatar(backgroundColor: Colors.white,maxRadius: 3,minRadius: 2,child: Text(who,style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),))),
          height: (height + 20.0),
        ),
      ),
      top: top,
      right: right,
      left: left,
    );
  }
}
