import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _apikey = prefs.getString('ff_apikey') ?? _apikey;
    });
    _safeInit(() {
      _isdarkmode = prefs.getBool('ff_isdarkmode') ?? _isdarkmode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _pics = '';
  String get pics => _pics;
  set pics(String _value) {
    _pics = _value;
  }

  String _apikey = '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';
  String get apikey => _apikey;
  set apikey(String _value) {
    _apikey = _value;
    prefs.setString('ff_apikey', _value);
  }

  bool _isdarkmode = false;
  bool get isdarkmode => _isdarkmode;
  set isdarkmode(bool _value) {
    _isdarkmode = _value;
    prefs.setBool('ff_isdarkmode', _value);
  }

  List<dynamic> _currentconversation = [];
  List<dynamic> get currentconversation => _currentconversation;
  set currentconversation(List<dynamic> _value) {
    _currentconversation = _value;
  }

  void addToCurrentconversation(dynamic _value) {
    _currentconversation.add(_value);
  }

  void removeFromCurrentconversation(dynamic _value) {
    _currentconversation.remove(_value);
  }

  void removeAtIndexFromCurrentconversation(int _index) {
    _currentconversation.removeAt(_index);
  }

  void updateCurrentconversationAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _currentconversation[_index] = updateFn(_currentconversation[_index]);
  }

  void insertAtIndexInCurrentconversation(int _index, dynamic _value) {
    _currentconversation.insert(_index, _value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
