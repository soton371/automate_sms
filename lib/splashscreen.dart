import 'dart:async';
import 'package:automate_sms/smspage.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5), ()=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SmsPage()), (route) => false)
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF125589),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 30,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //start sms scheduling
            Row(
              children: [
                Icon(Icons.schedule, color: Colors.white, size: 20,),
                Text(" SMScheduling",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
                )
              ],
            ),
            //end sms scheduling
            SizedBox(height: 10,),
            //start a new way
            Container(
                alignment: Alignment.centerLeft,
                child: Text("A new way to connect \nwith your favourite \npeople",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700
                  ),
                )
            ),
            //end a new way
            SizedBox(height: 10,),
            //start image section
            Lottie.asset('images/new.json'),
            //end image section
            SizedBox(height: 10,),
            //start connect
            Text("Connect - Massage - Share - Enjoy",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            //end connect
          ],
        )
      ),
    );
  }
}
