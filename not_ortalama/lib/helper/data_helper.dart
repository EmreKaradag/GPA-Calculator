import 'package:flutter/material.dart';
import 'package:not_ortalama/constants/app_constants.dart';
import 'package:not_ortalama/models/ders.dart';

class DataHelper{

  static List<Ders> tumDersler=[];
  static List<String> dersAdlari=[];

  static dersEkle(Ders ders){
  tumDersler.add(ders);
  dersAdlari.add(ders.ad);
  }
  
  static double ortalamaHesapla(){
  double toplamNot=0;
  double toplamKredi=0;

  tumDersler.forEach((element) {
    toplamNot=toplamNot+(element.krediDegeri*element.harfDegeri);
    toplamKredi+=element.krediDegeri;
    
  
  });
  return toplamNot / toplamKredi;
  }


  static List<String> _tumDerslerinHarfleri(){
    return ['AA','BA','CB','CC','DC','DD','FD','FF'];
  }
  
  static List<int> _tumKrediler(){
    return List.generate(5, (index) => index+1);
  }

  static List<DropdownMenuItem<double>> tumdDerslerinKredileri(){
  return _tumKrediler().map((e) => DropdownMenuItem(
  child: Text(e.toString()),
  value: e.toDouble(),
  )).toList();
  }

  static double _harfiNotaCevir(String harf){
    switch(harf){
    case 'AA':
     return 4;
    case 'BA':
     return 3.5;
    case 'BB':
    return 3;
    case 'CB':
     return 2.5;
    case 'CC':
     return 2;
    case 'DC':
     return 1.5;
    case 'DD':
     return 1;
    case 'FD':
     return 0.5;
    case 'FF':
     return 0;
    default:
    return 0;
  
    }
    
  }
  
  static List<DropdownMenuItem<double>> tumDerslerinHarfleri(){
  return _tumDerslerinHarfleri().map(
    (e) => DropdownMenuItem(
    child: Text(e),
    value: _harfiNotaCevir(e),
    )).toList();
  }

  static Widget placeholder1(){
    return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Lütfen Ders Ekleyiniz",style: Constants.baslikStyle,)
            ],
            ));
  }
  
 

}