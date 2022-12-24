library fantasysuperlig.konum;
///4-4-2

bool gorunurluk=true;
bool gorunurluk2=true;

double kaleci0top=0.15272727; double kaleci0right=0.0; double kaleci0left=0.0;
double kaleci1top=0.85090909; double kaleci1right=0.22154; double kaleci1left=0.0;

double defans0top=0.30636364; double defans0right=0.70666667; double defans0left=0.0       ;
double defans1top=0.29636364; double defans1right=0.25333333; double defans1left=0.0       ;
double defans2top=0.29636364; double defans2right=0.0       ; double defans2left=0.21333333;
double defans3top=0.30636364; double defans3right=0.0       ; double defans3left=0.70666667;
double defans4top=0.85090909; double defans4right=0.0       ; double defans4left=0.70666667;

double ortasaha0top=0.52272727; double ortasaha0right=0.0; double ortasaha0left=0.70666667;
double ortasaha1top=0.48454545; double ortasaha1right=0.0; double ortasaha1left=0.25333333;
double ortasaha2top=0.48454545; double ortasaha2right=0.25333333; double ortasaha2left=0.0;
double ortasaha3top=0.52272727; double ortasaha3right=0.70666667; double ortasaha3left=0.0;
double ortasaha4top=0.85090909; double ortasaha4right=0.70666667; double ortasaha4left=0.0;

double forvet1top=0.65090909; double forvet1right=0.0; double forvet1left=0.24333333;
double forvet2top=0.65090909; double forvet2right=0.24333333; double forvet2left=0.0;
double forvet3top=0.85090909; double forvet3right=0.0; double forvet3left=0.22154;

///5-4-1 forvet 2 ve 3, ortasaha 4, kaleci 1 yedek olarak belirlendi
/*  k0 top:  0.15272727 right: 0.0     left: 0.0
    k1 top: 0.85090909  right: 0.22154 left: 0.0

    d0 top: 0.32818182 right:  0.70666667 left:0.0
    d1 top: 0.31936364 right:  0.37333333 left:0.0
    d2 top: 0.30936364 right:  0.00923333 left:0.0
    d3 top: 0.31936364 right:  0.0        left:0.35333333
    d4 top: 0.32818182 right:  0.0        left:0.70666667

    os0 top: 0.52272727 right: 0.0        left: 0.70666667
    0s1 top: 0.48454545 right: 0.0        left: 0.25333333
    0s2 top: 0.48454545 right: 0.25333333 left: 0.0
    0s3 top: 0.52272727 right: 0.70666667 left: 0.0
    0s4 top: 0.85090909 right: 0.70666667 left: 0.0

    f1 top: 0.65090909 right: 0.0 left: 0.0
    f2 top: 0.85090909 right: 0.0 left: 0.70666667
    f3 top: 0.85090909 right: 0.0 left: 0.22154
 */
///5-3-2 ortasaha 3 ve 4, forvet 3,kaleci 1 yedek olarak belirlendi
/*  k0 top: 0.15272727 right: 0.0     left: 0.0
    k1 top: 0.85090909  right: 0.22154 left: 0.0

    d0 top: 0.32818182 right:  0.70666667 left:0.0
    d1 top: 0.31936364 right:  0.37333333 left:0.0
    d2 top: 0.30936364 right:  0.00923333 left:0.0
    d3 top: 0.31936364 right:  0.0        left:0.35333333
    d4 top: 0.32818182 right:  0.0        left:0.70666667

    os0 top: 0.48454545 right: 0.0        left: 0.45333333
    0s1 top: 0.48454545 right: 0.0        left: 0.0
    0s2 top: 0.48454545 right: 0.45333333 left: 0.0
    0s3 top: 0.85090909 right: 0.0        left: 0.70666667
    0s4 top: 0.85090909 right: 0.70666667 left: 0.0

    f1 top: 0.65090909 right: 0.0        left: 0.24333333
    f2 top: 0.65090909 right: 0.24333333 left: 0.0
    f3 top: 0.85090909 right: 0.0        left: 0.22154
 */
///4-5-1 forvet 2 ve 3, defans 4, kaleci 1 yedek olarak belirlendi
/*  k0 top:  0.15272727 right: 0.0     left: 0.0
    k1 top: 0.85090909  right: 0.22154 left: 0.0

    d0 top: 0.30636364 right:  0.70666667 left:0.0
    d1 top: 0.29636364 right:  0.25333333 left:0.0
    d2 top: 0.29636364 right:  0.0        left:0.21333333
    d3 top: 0.30636364 right:  0.0        left:0.70666667
    d4 top: 0.85090909 right:  0.0        left:0.70666667

    os0 top: 0.52272727 right: 0.0        left:  0.70666667
    0s1 top: 0.48454545 right: 0.0        left:  0.35333333
    0s2 top: 0.46454545 right: 0.00923333 left:  0.0
    0s3 top: 0.48454545 right: 0.35333333 left:  0.0
    0s4 top: 0.52272727 right: 0.70666667 left:  0.0

    f1 top: 0.65090909 right: 0.0        left: 0.0
    f2 top: 0.85090909 right: 0.70666667 left: 0.0
    f3 top: 0.85090909 right: 0.0        left: 0.22154
 */
///3-5-2 defans 3 ve 4,forvet 3, kaleci 1 yedek olarak belirlendi
/* k0 top:  0.15272727 right: 0.0     left: 0.0
   k1 top: 0.85090909  right: 0.22154 left: 0.0

   d0 top: 0.29636364 right:  0.51333333 left:0.0
   d1 top: 0.29636364 right:  0.0        left:0.0
   d2 top: 0.29636364 right:  0.0        left:0.51333333
   d3 top: 0.85090909 right:  0.70666667 left:0.0
   d4 top: 0.85090909 right:  0.0        left:0.70666667

   os0 top: 0.52272727 right: 0.0        0.70666667
   0s1 top: 0.48454545 right: 0.0        0.35333333
   0s2 top: 0.46454545 right: 0.00923333 0.0
   0s3 top: 0.48454545 right: 0.35333333 0.0
   0s4 top: 0.52272727 right: 0.70666667 0.0

   f1 top: 0.65090909  right: 0.0        left: 0.24333333
   f2 top: 0.65090909  right: 0.24333333 left: 0.0
   f3 top: 0.85090909  right: 0.0        left: 0.22154
 */
///4-3-3 defans 4, ortasaha 3 ve 4, kaleci 1 yedek olarak belirlendi
/* k0 top:  0.15272727 right: 0.0     left: 0.0
   k1 top: 0.85090909  right: 0.22154 left: 0.0

   d0 top: 0.30636364 right:  0.70666667 left:0.0
   d1 top: 0.29636364 right:  0.25333333 left:0.0
   d2 top: 0.29636364 right:  0.0        left:0.21333333
   d3 top: 0.30636364 right:  0.0        left:0.70666667
   d4 top: 0.85090909 right:  0.0        left:0.22666667

   os top: 0.48454545 right: 0.0        left: 0.45333333
   0s top: 0.48454545 right: 0.0        left: 0.0
   0s top: 0.48454545 right: 0.45333333 left: 0.0
   0s top: 0.85090909 right: 0.0        left: 0.70666667
   0s top: 0.85090909 right: 0.70666667 left: 0.0

   f1 top: 0.65090909 right: 0.0        left: 0.0
   f2 top: 0.65090909 right: 0.44333333 left: 0.0
   f3 top: 0.65090909 right: 0.0        left: 0.44333333
 */

///3-4-3 defans 3 ve 4, ortasaha 4 , kaleci 1 yedek olarak belirlendi
/* k0 top:  0.15272727 right: 0.0     left: 0.0
   k1 top: 0.85090909  right: 0.22154 left: 0.0

   d0 top: 0.29636364 right: 0.51333333 left:0.0
   d1 top: 0.29636364 right: 0.0        left:0.0
   d2 top: 0.29636364 right: 0.0        left:0.51333333
   d3 top: 0.85090909 right: 0.0        left:0.25666667
   d4 top: 0.85090909 right: 0.0        left:0.70666667

   os0 top: 0.52272727 right: 0.0        left: 0.70666667
   0s1 top: 0.48454545 right: 0.0        left: 0.25333333
   0s2 top: 0.48454545 right: 0.25333333 left: 0.0
   0s3 top: 0.52272727 right: 0.70666667 left: 0.0
   0s4 top: 0.85090909 right: 0.70666667 left: 0.0

  f1 top: 0.65090909 right: 0.0        left: 0.0
  f2 top: 0.65090909 right: 0.44333333 left: 0.0
  f3 top: 0.65090909 right: 0.0        left: 0.44333333

 */
