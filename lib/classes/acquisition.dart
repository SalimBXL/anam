class Acquisition {
  Acquisition(this._camera, this._timeScheduled, this._length);

  String _camera;
  DateTime _timeScheduled;
  DateTime _timeReal;
  int _length;
  double _coincidence;
  double _singles;
  String _nurseID;

  String get camera => this._camera;

  set camera(String value) => this._camera = value;

  DateTime get timeScheduled => this._timeScheduled;

  set timeScheduled(DateTime value) => this._timeScheduled = value;

  DateTime get timeReal => this._timeReal;

  set timeReal(DateTime value) => this._timeReal = value;

  int get length => this._length;

  set length(int value) => this._length = value;

  double get coincidence => this._coincidence;

  set coincidence(double value) => this._coincidence = value;

  double get singles => this._singles;

  set singles(double value) => this._singles = value;

  String get nurseID => this._nurseID;

  set nurseID(String value) => this._nurseID = value;
}
