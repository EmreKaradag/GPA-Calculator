import 'package:flutter/material.dart';
import 'package:not_ortalama/constants/app_constants.dart';
import 'package:not_ortalama/helper/data_helper.dart';

class OrtalamaGoster extends StatelessWidget {
  late double ortalama;
  late int dersSayisi;


   OrtalamaGoster({required this.dersSayisi,required this.ortalama ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   ortalama=DataHelper.ortalamaHesapla();
   dersSayisi=DataHelper.tumDersler.length;
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(dersSayisi>0?"$dersSayisi ders girildi":"ders giriniz",style: Constants.dersSayisiStyle),
      Text(ortalama >= 0?"${ortalama.toStringAsFixed(2)}":"0",style: Constants.OrtalamaStyle,),
      Text("ortalama",style: Constants.dersSayisiStyle,)
    ],
    );
  }
}