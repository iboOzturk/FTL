import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.renk,
    @required this.name,
    @required this.onpressed,
  })  : super(key: key);
  final Color renk;
  final String name;
  final Navigator onpressed;


  ///0.6773399
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    double height = 0.18181818 * (0.5894399 * _height);
    return ElevatedButton(
        onPressed: () {onpressed;},
        style: ElevatedButton.styleFrom(
          primary: renk,padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10)
        ),
        child: Text(
          name,
          style: TextStyle(fontSize: 12,color: Colors.white),
        ));
  }
}
/*
 new Positioned(
      child: Container(
        child: Column(children: [
          // Image.asset(image, height: position == 'GK' ? height - 10.0 : height),
          Image.network(image,height: height,),
          Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10.0)),
            height: 20.0,
            child: Padding(
                child: Text(
                  name,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(left: 5.0, right: 5.0)),
          ),
        ]),
        height: (height + 20.0),
      ),
      top: top,
      right: right,
      left: left,
    ); */
