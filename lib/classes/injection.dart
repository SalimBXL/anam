enum injectLoc { BDR, BGA }

Map<injectLoc, String> injectLocDescr = {
  injectLoc.BDR: "Bras droit",
  injectLoc.BGA: "Bras gauche"
};

class Injection {
  Injection(this._radioTraceur, this._activityScheduled,
      this._injectionScheduled, this._length);

  double _activityScheduled;
  double _activityReal;
  double _activityReste;
  double _activityAppreciated;

  DateTime _injectionScheduled;
  DateTime _injectionReal;

  int _length;
  String _radioTraceur;
  double _glycemie;
  String _autre;
  String _nurseID;
  injectLoc _injectionLocalisation;

  DateTime get injectionScheduled => this._injectionScheduled;

  set injectionScheduled(DateTime value) => this._injectionScheduled = value;

  DateTime get injectionReal => this._injectionReal;

  set injectionReal(DateTime value) => this._injectionReal = value;

  double get activityScheduled => this._activityScheduled;

  set activityScheduled(double value) => this._activityScheduled = value;

  double get activityReal => this._activityReal;

  set activityReal(double value) => this._activityReal = value;

  double get activityReste => this._activityReste;

  set activityReste(double value) => this._activityReste = value;

  double get activityAppreciated => this._activityAppreciated;

  set activityAppreciated(double value) => this._activityAppreciated = value;

  String get radioTraceur => this._radioTraceur;

  set radioTraceur(String value) => this._radioTraceur = value;

  double get glycemie => this._glycemie;

  set glycemie(double value) => this._glycemie = value;

  String get autre => this._autre;

  set autre(String value) => this._autre = value;

  String get nurseID => this._nurseID;

  set nurseID(String value) => this._nurseID = value;

  injectLoc get injectionLocalisation => this._injectionLocalisation;

  String get injectLocalisationDescription =>
      injectLocDescr[this._injectionLocalisation];

  set injectLocalisation(injectLoc value) =>
      this._injectionLocalisation = value;

  int get length => this._length;

  set length(int value) => this._length = value;
}
