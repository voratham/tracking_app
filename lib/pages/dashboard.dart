import "package:flutter/material.dart";
import 'package:tracking_app/domain/dailyWokring.domain.dart';
import 'package:tracking_app/models/dailyWorking.model.dart';

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

class CurrentDailyWorking extends StatelessWidget {
  DailyWorking dailyWorking;

  CurrentDailyWorking(this.dailyWorking);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 13,
          ),
          Text(
            "DW Number : ${this.dailyWorking.dwNo}",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            "DW Job Number : ${this.dailyWorking.dailyJobNo}",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            "Check In : ${this.dailyWorking.startWorkingTime}",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            "Check Out: ${this.dailyWorking.finishWorkingTime}",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
