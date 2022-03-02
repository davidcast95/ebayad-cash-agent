import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _isMerchant = prefs.getBool('ff_isMerchant') ?? _isMerchant;
    _isRestricted = prefs.getBool('ff_isRestricted') ?? _isRestricted;
    _email = prefs.getString('ff_email') ?? _email;
    _fullName = prefs.getString('ff_fullName') ?? _fullName;
  }

  SharedPreferences prefs;

  bool _isMerchant = true;
  bool get isMerchant => _isMerchant;
  set isMerchant(bool _value) {
    _isMerchant = _value;
    prefs.setBool('ff_isMerchant', _value);
  }

  bool _isRestricted = false;
  bool get isRestricted => _isRestricted;
  set isRestricted(bool _value) {
    _isRestricted = _value;
    prefs.setBool('ff_isRestricted', _value);
  }

  String _email = '';
  String get email => _email;
  set email(String _value) {
    _email = _value;
    prefs.setString('ff_email', _value);
  }

  String _fullName = '';
  String get fullName => _fullName;
  set fullName(String _value) {
    _fullName = _value;
    prefs.setString('ff_fullName', _value);
  }

  bool isSecurityCodeVerified = false;

  String transactionID = '';

  bool transactionDoesntExist = false;
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
