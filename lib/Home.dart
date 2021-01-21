import 'package:flutter/material.dart';
//import 'package:projectpu2021/Feed.dart';
import 'package:projectpu2021/Login.dart';
import 'package:projectpu2021/signup.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                ClipPath(
                  clipper: Myclip(),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                          Color.fromARGB(255, 255, 33, 122),
                          Color.fromARGB(255, 255, 33, 33),
                        ])),
                  ),
                ),
              ],
            ),
            Text(
              "LOGIN  & REGISTER",
              style: TextStyle(
                  fontFamily: 'Avernir',
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Fb(
              imgUrl: 'logo/facebook1.png',
              titles: "Log In",
            ),
            Signupclick(
              imgUrl: 'logo/facebook1.png',
              titles: "SIGNUP",
            ),
          ],
        ),
      ),
    );
  }
}

class Myclip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 90, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Social extends StatelessWidget {
  final String imgUrl, titles;
  Social({this.imgUrl, this.titles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), border: Border.all()),
        height: 50,
        width: 280,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Image.asset(
                imgUrl,
                height: 20,
              ),
            ),
            SizedBox(width: 50),
            Text(
              titles,
              style: TextStyle(
                  fontFamily: 'Anveri',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}

class Fb extends StatelessWidget {
  final String imgUrl, titles;
  Fb({this.imgUrl, this.titles});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue[900],
          ),
          height: 50,
          width: 280,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Image.asset(
                  imgUrl,
                  height: 25,
                ),
              ),
              SizedBox(width: 50),
              Text(
                titles,
                style: TextStyle(
                    fontFamily: 'Anveri',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Signupclick extends StatelessWidget {
  final String imgUrl, titles;
  Signupclick({this.imgUrl, this.titles});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUp()));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue[900],
          ),
          height: 50,
          width: 280,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Image.asset(
                  imgUrl,
                  height: 25,
                ),
              ),
              SizedBox(width: 50),
              Text(
                titles,
                style: TextStyle(
                    fontFamily: 'Anveri',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class Socialnumber extends StatelessWidget {

//   final String imgUrl , titles ;
//   Socialnumber({this.imgUrl , this.titles});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top:20.0),
//       child: Container(
//               decoration: BoxDecoration(

//                 borderRadius: BorderRadius.circular(30),
//                 border: Border.all()

//               ),
//               height: 50,
//               width: 280,
//               child: Row(
//                 children: <Widget>[

//                   Padding(
//                     padding: const EdgeInsets.only(left:20.0),
//                     child: Image.asset(imgUrl , height: 18,),
//                   ),
//                   SizedBox(width: 50),
//                   Text(titles , style: TextStyle(
//                     fontFamily: 'Anveri',
//                     fontWeight: FontWeight.w400,
//                     fontStyle: FontStyle.normal,
//                     fontSize: 15
//                   ),)

//                 ],
//               ),

//             ),
//     );
//   }
// }
