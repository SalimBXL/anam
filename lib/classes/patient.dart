import 'package:anam/classes/acquisition.dart';
import 'package:flutter/material.dart';

import 'injection.dart';

enum PatientStatus { all, todo, active, done }
enum Sex { male, female }

Map<PatientStatus, Color> patientStatusColor = {
  PatientStatus.all: Colors.blue,
  PatientStatus.todo: Colors.amber,
  PatientStatus.active: Colors.green,
  PatientStatus.done: Colors.red
};

Map<PatientStatus, Icon> patientStatusIcon = {
  PatientStatus.all: Icon(Icons.people),
  PatientStatus.todo: Icon(Icons.hourglass_full),
  PatientStatus.active: Icon(Icons.healing),
  PatientStatus.done: Icon(Icons.done),
};

class Patient {
  Patient(this._npp, this._fullname, this._status) {
    _npp.substring(6, 7).toUpperCase() == "M"
        ? this._sex = Sex.male
        : this._sex = Sex.female;
    this._injection = Injection("FDG-F18", 120, DateTime.now(), 60);
    this._acquisition = Acquisition(
        "VEREOS",
        this
            ._injection
            .injectionScheduled
            .add(Duration(minutes: this._injection.length)),
        15);
  }

  Injection _injection;
  Acquisition _acquisition;
  String _npp;
  String _fullname;
  PatientStatus _status;
  Sex _sex;

  DateTime _accueilTimeScheduled;
  DateTime _accueilTimeReal;
  DateTime _cameraTimeScheduled;
  DateTime _cameraTimeReal;

  String get npp => this._npp;

  String get fullname => this._fullname;

  PatientStatus get status => this._status;

  Sex get sex => this._sex;

  bool get isFemale => (this._sex == Sex.female);

  DateTime get accueilTime {
    return this._accueilTimeReal == null
        ? this._accueilTimeScheduled
        : this._accueilTimeReal;
  }

  DateTime get cameraTime {
    return this._cameraTimeReal == null
        ? this._cameraTimeScheduled
        : this._cameraTimeReal;
  }

  set status(PatientStatus newStatus) => this._status = newStatus;

  Injection get injection => this._injection;

  Acquisition get acquisition => this._acquisition;
}
