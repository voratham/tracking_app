import "package:flutter/material.dart";
import "../models/dailyWorking.model.dart";
import "package:intl/intl.dart";

class CurrentDailyWorking extends StatelessWidget {
  DailyWorking dailyWorking;
  CurrentDailyWorking(this.dailyWorking);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: Colors.grey.shade300,
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(children: <Widget>[
              Container(
                width: 60,
                child: Icon(
                  Icons.local_shipping,
                  color: Colors.black38,
                  size: 45,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text(this.dailyWorking.dwNo,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black87)),
                      SizedBox(
                        height: 6,
                      ),
                      Text(this.dailyWorking.dailyJobNo,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black38)),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                          "เริ่มทำงาน  ${DateFormat("dd/MM/yyyy HH:mm aa").format(this.dailyWorking.startWorkingTime)}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black38)),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                          "เลิกทำงาน ${DateFormat("dd/MM/yyyy HH:mm aa").format(this.dailyWorking.finishWorkingTime)}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black38)),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ]));
  }
}
