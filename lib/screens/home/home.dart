import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makanforfree/services/auth.dart';
import 'form_material.dart';
// import 'package:makanforfree/shared/loading.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 33.0,
            ),
            Container(
              padding: const EdgeInsets.all(8.0), 
              child: Text(
                'MakanForFree',
                style: TextStyle(color: Color(0xff224966)),
              )
            )
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 2.0,
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.exit_to_app,
              color: Color(0xff224966),
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0,),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50.0,),
              Row(
                children: <Widget>[
                  // Align(
                  //       alignment: Alignment.topLeft,
                  //       child: Image.asset(
                  //         'assets/images/logo.png',
                  //         height: 40.0,
                  //       ),
                  //     ),
                  // Text(
                  //   '   Home | Makan For Free',
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Color(0xff224966)),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red.withOpacity(.26),
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
              // MaterialPageRoute(builder: (context) => FormMaterial())
              PageRouteBuilder(
                // transitionDuration: Duration(seconds: 1),
                transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                  
                  animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                  
                  return ScaleTransition(
                    alignment: Alignment.bottomRight,
                    scale: animation,
                    child: child,
                  );
                },
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                  return FormMaterial();
                }
              )
            );
          },
          child: SvgPicture.asset(
            "assets/icons/plus.svg",
            height: 20.0,
          ),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
    