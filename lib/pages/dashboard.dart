import "package:flutter/material.dart";

class DasdhboradPage extends StatefulWidget {
  @override
  _DasdhboradPageState createState() => _DasdhboradPageState();
}

class _DasdhboradPageState extends State<DasdhboradPage> {
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
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "February 21, 2021",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Check-in: 08:00",
                      style: TextStyle(fontSize: 19),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Check-out: 17:00",
                      style: TextStyle(fontSize: 19),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              RaisedButton(
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
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
