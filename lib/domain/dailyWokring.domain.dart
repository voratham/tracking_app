import 'package:tracking_app/adapters/dailyWorking.service.dart';
import 'package:tracking_app/models/dailyWorking.model.dart';

import './auth.domain.dart';
import "../adapters/dailyWorking.service.dart";

class DailyWorkingDomain {
  AuthDomain _authDomain;
  DailyWorkingService _service;

  DailyWorkingDomain(AuthDomain authDomin, DailyWorkingService service) {
    this._authDomain = authDomain;
    this._service = service;
  }

  Future<DailyWorking> currentWorking() async {
    final user = await this._authDomain.getUser();
    final dailyWorking = await this._service.startWorking(user);
    return dailyWorking;
  }
}

final dailyWorkingDomain =
    DailyWorkingDomain(authDomain, DailyWorkingService());
