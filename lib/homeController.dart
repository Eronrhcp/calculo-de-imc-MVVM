import 'package:flutter/material.dart';
import 'person_model.dart';

class HomeController extends ChangeNotifier{
  ///Colocamos as Ações, intermedia a view e o model
  double _altura = 0;
  double _massa = 0;
  String result = '';

  void setAltura(String value) => _altura = double.tryParse(value) ?? 0;
  void setMassa(String value) => _massa = double.tryParse(value) ?? 0;

  void callateIMC(){
    final imcResult = PersonModel(altura: _altura, massa: _massa).getIMC();
    final imcArredondado = imcResult.toStringAsFixed(2);
    if(imcResult < 18.5){
      result = 'Abaixo do Peso! Seu IMC é ${imcArredondado}';
    }if(imcResult < 25){
      result = 'Peso normal! Seu IMC é ${imcArredondado}';
    }else{
      result = 'Sobrepeso! Seu IMC é ${imcArredondado}';
    };
    notifyListeners();
  }
}