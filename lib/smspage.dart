import 'dart:async';
import 'dart:ui';
import 'package:telephony/telephony.dart';
import 'package:flutter/material.dart';

class SmsPage extends StatefulWidget {
  @override
  _SmsPageState createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {

  final Telephony _telephony = Telephony.instance;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _msgController = TextEditingController();
  final TextEditingController _schdulingController = TextEditingController();

  smsSend() async {
    _telephony.sendSms(to: _phoneController.text, message: _msgController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('images/one.jpg'), fit: BoxFit.cover)
                      ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 2.5, sigmaX: 2.5),
                      child: Container(
                        color: Colors.black12
                      ),
                    )
                  )
              ),
              Positioned(
                top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Form(
                          key: _formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: TextFormField(
                                  cursorColor: Color(0xFF125589),
                                  controller: _phoneController,
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if(value == null || value.isEmpty){
                                      return "value is empty";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Color(0xFF125589)
                                  ),
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          color: Color(0xFF125589).withOpacity(.7)
                                      ),
                                      hintText: "enter contact number",
                                      prefixIcon: Icon(Icons.person, color: Color(0xFF125589).withOpacity(.5),),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              SizedBox(height: 8,),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: TextFormField(
                                  cursorColor: Color(0xFF125589),
                                  controller: _schdulingController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if(value == null || value.isEmpty){
                                      return "value is empty";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Color(0xFF125589)
                                  ),
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          color: Color(0xFF125589).withOpacity(.7)
                                      ),
                                      hintText: "after minutes",
                                      prefixIcon: Icon(Icons.schedule, color: Color(0xFF125589).withOpacity(.5),),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              SizedBox(height: 8,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: TextFormField(
                                  maxLines: 3,
                                  cursorColor: Color(0xFF125589),
                                  controller: _msgController,
                                  validator: (value) {
                                    if(value == null || value.isEmpty){
                                      return "value is empty";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Color(0xFF125589)
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Color(0xFF125589).withOpacity(.7)
                                      ),
                                      hintText: "write massage.."
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                                  color: Colors.white.withOpacity(.84),
                                  onPressed: ()=>Timer(
                                      Duration(minutes: int.parse(_schdulingController.text)), ()=>smsSend()),
                                  child: Text("send",
                                  style: TextStyle(
                                    color: Color(0xFF125589),
                                    fontSize: 16
                                  ),
                                  ),
                              )
                            ],
                          )
                      ),
                    )
                  )
              )
            ],
          )
      ),
    );
  }
}
