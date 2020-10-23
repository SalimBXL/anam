import 'package:anam/classes/acquisition.dart';

import 'injection.dart';

enum PatientStatus { all, todo, active, done }
enum Sex { male, female }

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

  int get age {
    int annee = int.parse(this._npp.substring(0, 2));
    if (annee > DateTime.now().year)
      annee = 1900 + annee;
    else
      annee = 2000 + annee;
    int annees = DateTime.now().year - annee;
    int mois = int.parse(this._npp.substring(2, 4));
    int jour = int.parse(this._npp.substring(4, 6));
    DateTime dateAnniv = DateTime(DateTime.now().year, mois, jour);
    if (DateTime.now().isBefore(dateAnniv)) annees--;
    return annees;
  }
}
