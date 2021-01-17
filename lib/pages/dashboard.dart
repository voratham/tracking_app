import "package:flutter/material.dart";
import '../domain/dailyWokring.domain.dart';
import '../models/dailyWorking.model.dart';
import '../widgets/currentDailyWorking.dart';

class DasdhboradPage extends StatefulWidget {
  @override
  _DasdhboradPageState createState() => _DasdhboradPageState();
}

class _DasdhboradPageState extends State<DasdhboradPage> {
  Future<DailyWorking> currentDailyWorking;

  @override
  void initState() {
    super.initState();
    currentDailyWorking = dailyWorkingDomain.currentWorking();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Daliy Working"),
          leading: new IconButton(
            icon: new Icon(Icons.access_time_outlined),
            onPressed: () => {},
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              FutureBuilder(
                  future: currentDailyWorking,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      print(
                          "snapshot.data : ${(snapshot.data as DailyWorking).dailyJobNo}");
                      return Column(
                        children: <Widget>[
                          new CurrentDailyWorking(
                              snapshot.data as DailyWorking),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: RaisedButton(
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Container(
                                  width: 100,
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "Check In",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                onPressed: () {}),
                          )
                        ],
                      );
                    }
                    return Container(
                        margin: EdgeInsets.all(20.0),
                        child: Center(child: CircularProgressIndicator()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
