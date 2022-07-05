import 'dart:math' as math;
///regras de negócio

class PersonModel{
  final double altura;
  final double massa;

  PersonModel({required this.altura, required this.massa});

  getIMC(){
    return massa / math.pow(altura, 2);
  }
}