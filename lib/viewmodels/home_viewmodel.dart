import 'package:flutter/material.dart';
import '../model/person_model.dart';
import 'dart:math' as math;
import 'package:rx_notifier/rx_notifier.dart';

class HomeViewModel{
  ///Colocamos as Ações, intermedia a view e o model
  double _altura = 0;
  double _massa = 0;
  final _result = RxNotifier<String>('');
  String get result => _result.value;

  void setAltura(String value) => _altura = double.tryParse(value) ?? 0;
  void setMassa(String value) => _massa = double.tryParse(value) ?? 0;

  void callateIMC(){
    final imcResult = _massa / math.pow(_altura, 2);
    final imcArredondado = imcResult.toStringAsFixed(2);
    if(imcResult < 18.5){
      _result.value = 'Abaixo do Peso! Seu IMC é ${imcArredondado}';
    }if(imcResult < 25){
      _result.value = 'Peso normal! Seu IMC é ${imcArredondado}';
    }else{
      _result.value = 'Sobrepeso! Seu IMC é ${imcArredondado}';
    };
  }
}