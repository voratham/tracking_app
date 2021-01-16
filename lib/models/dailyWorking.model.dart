class DailyWorking {
  DailyWorking({
    this.dwNo,
    this.startWorkingTime,
    this.finishWorkingTime,
    this.isComplete,
    this.jobAssign,
    this.mode,
    this.dailyJobNo,
    this.isCheckIn,
    this.isCheckOut,
  });

  String dwNo;
  DateTime startWorkingTime;
  DateTime finishWorkingTime;
  bool isComplete;
  List<dynamic> jobAssign;
  int mode;
  String dailyJobNo;
  bool isCheckIn;
  bool isCheckOut;

  factory DailyWorking.fromJson(Map<String, dynamic> json) => DailyWorking(
        dwNo: json["dwNo"] == null ? null : json["dwNo"],
        startWorkingTime: json["startWorkingTime"] == null
            ? null
            : DateTime.parse(json["startWorkingTime"]),
        finishWorkingTime: json["finishWorkingTime"] == null
            ? null
            : DateTime.parse(json["finishWorkingTime"]),
        isComplete: json["isComplete"] == null ? null : json["isComplete"],
        jobAssign: json["jobAssign"] == null
            ? null
            : List<dynamic>.from(json["jobAssign"].map((x) => x)),
        mode: json["mode"] == null ? null : json["mode"],
        dailyJobNo: json["dailyJobNo"] == null ? null : json["dailyJobNo"],
        isCheckIn: json["isCheckIn"] == null ? null : json["isCheckIn"],
        isCheckOut: json["isCheckOut"] == null ? null : json["isCheckOut"],
      );

  Map<String, dynamic> toJson() => {
        "dwNo": dwNo == null ? null : dwNo,
        "startWorkingTime": startWorkingTime == null
            ? null
            : startWorkingTime.toIso8601String(),
        "finishWorkingTime": finishWorkingTime == null
            ? null
            : finishWorkingTime.toIso8601String(),
        "isComplete": isComplete == null ? null : isComplete,
        "jobAssign": jobAssign == null
            ? null
            : List<dynamic>.from(jobAssign.map((x) => x)),
        "mode": mode == null ? null : mode,
        "dailyJobNo": dailyJobNo == null ? null : dailyJobNo,
        "isCheckIn": isCheckIn == null ? null : isCheckIn,
        "isCheckOut": isCheckOut == null ? null : isCheckOut,
      };
}
