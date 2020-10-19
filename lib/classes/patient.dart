import 'package:flutter/material.dart';

enum PatientStatus { all, todo, active, done }

Map<PatientStatus, Color> patientStatusColor = {
  PatientStatus.todo: Color(0xFFFFC107),
  PatientStatus.active: Color(0xFF4CAF50),
  PatientStatus.done: Color(0xFFF44336)
};

Map<PatientStatus, Icon> patientStatusIcon = {
  PatientStatus.all: Icon(Icons.people),
  PatientStatus.todo: Icon(Icons.hourglass_full),
  PatientStatus.active: Icon(Icons.healing),
  PatientStatus.done: Icon(Icons.done),
};

class Patient {
  String _npp;
  String _fullname;
  PatientStatus _status;
  bool _isMale;
  DateTime _injectionTimeScheduled = DateTime.now();
  DateTime _injectionTimeReal;
  DateTime _accueilTimeScheduled = DateTime.now();
  DateTime _accueilTimeReal;
  DateTime _cameraTimeScheduled = DateTime.now();
  DateTime _cameraTimeReal;

  Patient(this._npp, this._fullname, this._status) {
    _npp.substring(6, 7).toUpperCase() == "M"
        ? this._isMale = true
        : this._isMale = false;
  }

  String get npp => this._npp;
  String get fullname => this._fullname;
  PatientStatus get status => this._status;
  bool get isMale => this._isMale;

  DateTime get accueilTime {
    return this._accueilTimeReal == null
        ? this._accueilTimeScheduled
        : this._accueilTimeReal;
  }

  DateTime get injectionTime {
    return this._injectionTimeReal == null
        ? this._injectionTimeScheduled
        : this._injectionTimeReal;
  }

  DateTime get cameraTime {
    return this._cameraTimeReal == null
        ? this._cameraTimeScheduled
        : this._cameraTimeReal;
  }

  set status(PatientStatus newStatus) => this._status = newStatus;
}