import 'package:flutter/material.dart';

class BankContainer extends StatelessWidget {
  const BankContainer({
    Key key,
    @required this.baslik,
    @required this.deger,

  })  :super(key: key);
  final String baslik;
  final double deger;
  ///0.6773399
  @override
  Widget build(BuildContext context) {
    //double fontBoyut=13;
    final double _height = MediaQuery.of(context).size.height;
    double height = 0.18181818 * (0.5294399 * _height);
    // double height = 0.18181818 * (0.5894399 * _height);
    return Container(
      width: 105,height: 36,decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
        //border: Border.all(color: Colors.green.shade700,width: 1)
    ),
     child: Column(
       children: [
         Container(alignment: Alignment.center,
             width: 105,height: 16,decoration: BoxDecoration(
               color: Color.fromARGB(255, 55, 0, 60 ),
                 borderRadius: BorderRadius.circular(15),
             ),

             child: Text(baslik,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,)
         ),
         SizedBox(height: 1,),
         Container(alignment: Alignment.center,
           width: 105,height: 16,
             decoration: BoxDecoration(
              // color: Colors.purple.shade700,
               color: Colors.green.shade700,
                 borderRadius: BorderRadius.circular(15),),
             //Color.fromARGB(99, 79, 35, 84 ),

             child: Text(deger.toString()+'M ₺',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),)
         ),
       ],
     ),
    );
  }
}
