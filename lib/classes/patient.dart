import 'dart:math';

import 'package:anam/classes/acquisition.dart';

import 'injection.dart';

enum PatientStatus { all, todo, active, done }
enum Sex { male, female }
enum AmbuHospi { ambu, hospi }

class Patient {
  Patient(this._npp, this._fullname, this._status,
      {this.poidKg, this.tailleCm}) {
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
    if (this._ambulatoire == null) this._ambulatoire = AmbuHospi.ambu;
  }

  Injection _injection;
  Acquisition _acquisition;
  String _npp;
  String _fullname;
  PatientStatus _status;
  Sex _sex;

  int poidKg;
  int tailleCm;

  AmbuHospi _ambulatoire;

  DateTime _accueilTimeScheduled;
  DateTime _accueilTimeReal;
  DateTime _cameraTimeScheduled;
  DateTime _cameraTimeReal;

  String get npp => this._npp;

  String get fullname => this._fullname;

  Sex get sex => this._sex;

  bool get isFemale => (this._sex == Sex.female);

  AmbuHospi get ambulatoire => this._ambulatoire;
  set ambulatoire(AmbuHospi value) => this._ambulatoire = value;
  bool get isAmbulatoire => (this._ambulatoire == AmbuHospi.ambu);

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

  PatientStatus get status => this._status;
  set status(PatientStatus newStatus) => this._status = newStatus;

  Injection get injection => this._injection;

  Acquisition get acquisition => this._acquisition;

  int get age {
    int annee = int.parse(this._npp.substring(0, 2));
    if ((2000 + annee) > DateTime.now().year)
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

  double get tailleMetre =>
      (this.tailleCm == null) ? null : this.tailleCm / 100;

  String get bmi => (this.tailleCm == null || this.poidKg == null)
      ? ''
      : (this.poidKg / pow(this.tailleMetre, 2)).toStringAsFixed(1);
}
