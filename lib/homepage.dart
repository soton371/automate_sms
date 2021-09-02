import 'dart:async';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  //all tab function here
  Scaffold allMassages(){
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (context, index){
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("images/avatar3.jpg"),
              ),
              title: Text("Name",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text("Massage des"),
              trailing: Text("19-8-21"),
            );
          }
      )
    );
  }
  Scaffold upComing(){
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index){
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("images/avatar3.jpg"),
              ),
              title: Text("Name",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text("Massage des"),
              trailing: Text("20-8-21"),
            );
          }
      )
    );
  }
  Scaffold delivered(){
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index){
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("images/avatar3.jpg"),
              ),
              title: Text("Name",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text("Massage des"),
              trailing: Text("18-8-21"),
            );
          }
      ),
    );
  }
//variable for sms
  final Telephony _telephony = Telephony.instance;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _msgController = TextEditingController();
  final TextEditingController _schdulingController = TextEditingController();

// function for button click action
  Future showSheet()=> showSlidingBottomSheet(
      context,
      builder: (context)=> SlidingSheetDialog(
          builder: buildSheet,
        snapSpec: SnapSpec(
          snappings: [0.4,0.7]
        ),
        cornerRadius: 15,
        headerBuilder: buildHeader
      )
  );

  Widget buildSheet(BuildContext context, SheetState state) => Material(
    child: Form(
      key: _formkey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF125589),
                  ),
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
                      color: Color(0xFF125589).withOpacity(.5)
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
                    border: Border.all(
                      color: Color(0xFF125589),
                    ),
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
                          color: Color(0xFF125589).withOpacity(.5)
                      ),
                      hintText: "after seconds",
                      prefixIcon: Icon(Icons.schedule, color: Color(0xFF125589).withOpacity(.5),),
                      border: InputBorder.none
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Color(0xFF125589).withOpacity(.2),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: TextFormField(
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
                          color: Color(0xFF125589).withOpacity(.5)
                      ),
                      hintText: "write massage.."
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  //onPressed: ()=>smsSend(),
                  onPressed: ()=>Timer(
                    Duration(seconds: int.parse(_schdulingController.text)), ()=>smsSend()),
                  child: Text("send")
              )
            ],
          ),
        )
    )
  );


  smsSend() async {
    _telephony.sendSms(to: _phoneController.text, message: _msgController.text);
  }
  
  Widget buildHeader(BuildContext context, SheetState state) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        height: 20,
        //color: Color(0xFF125589).withOpacity(.5),
        child: Container(
          height: 5,
          width: 25,
          decoration: BoxDecoration(
            color: Color(0xFF125589).withOpacity(.5),
            borderRadius: BorderRadius.circular(15)
          ),
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF125589),
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
          ),
          title: Row(
            children: [
              Icon(Icons.schedule,size: 20,),
              Text(" Scheduling"),
              Spacer(),
              Icon(Icons.search),
              SizedBox(width: 10,),
              Icon(Icons.notifications_none)
            ],
          ),
          bottom: TabBar(
            indicatorColor: Colors.white.withOpacity(0.0),
              tabs: [
            Tab(text: "Inbox",),
            Tab(text: "Sent",),
            Tab(text: "Drafts",),
          ]
          ),
        ),
        body: TabBarView(
            children: [
              allMassages(),
              upComing(),
              delivered()
            ]
        ),
        //start button section
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF125589),
          onPressed: showSheet,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
