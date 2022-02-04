import 'package:flutter/material.dart';
import 'package:not_ortalama/constants/app_constants.dart';
import 'package:not_ortalama/helper/data_helper.dart';
import 'package:not_ortalama/models/ders.dart';
import 'package:not_ortalama/widgets/ders_listesi_widget.dart';
import 'package:not_ortalama/widgets/harf_dropdown_widget.dart';
import 'package:not_ortalama/widgets/krediler_dropdown_widget.dart';
import 'package:not_ortalama/widgets/ortalama_goster_widget.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  double secilenDegerHarfler=4;
  double secilenDegerKrediler=1;
  String girilenDersAdi="";

  var _formKey=GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
       
      backgroundColor: Colors.transparent,
      
      elevation: 0,
      centerTitle: true,
      title: Text(Constants.baslik,style: Constants.baslikStyle,),
    ),
    body: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      //form
       Row(
      children: [
      Expanded(
      flex: 2,
      child: Container(
      
      child: BuildForm(),
      )),
      Expanded(
      flex: 1,
      child: Container(
      
      child: OrtalamaGoster(dersSayisi: 3, ortalama: 2.32),
      )),
      ],),
      
      //liste
       Expanded(
         
         child: Container(
          
          child: DersListesi(onDissmiss: (index){
          DataHelper.tumDersler.removeAt(index);
          DataHelper.dersAdlari.removeAt(index);
          setState(() {
            
          });
          },) ,
             ),
       )
    ],
    ),
    );
  }

 Widget BuildForm() {
  return Form(
    
    key: _formKey,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Padding(padding: EdgeInsets.only(left: 0),child: _buildTextFormField()),
      SizedBox(height: 8,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Expanded(
          child: Padding(
            padding:  Constants.Padding1,
            child: HarfDropDownWidget(onSelection: (deger){
            secilenDegerHarfler=deger;
            },),
          ),
        ),
        Expanded(
          child: Padding(
           padding: Constants.Padding1,
            child: KredilerDropDown(onSelection: (deger){
            setState(() {
            secilenDegerKrediler=deger;
            });  
            })
          ),
        ),
        IconButton(onPressed: (){
        _dersEkleVeOrtalamaHesapla();
        
        }, icon: Icon(Icons.arrow_forward_ios,color: Constants.anaRenk,size: 30,))
    ],
    ),
    SizedBox(height: 8,)
    ],
    ),
  );
  }

  _buildTextFormField() {
  return Container(
    margin: EdgeInsets.only(left: 10),
    child: TextFormField(

      onSaved: (deger){
        setState(() {
        girilenDersAdi=deger!;
        });
      },
      validator: (s){
        if(s!.length <= 0){
          return "Ders Adını Giriniz";
        }else if(DataHelper.dersAdlari.contains(s)){
        return "Ders Mevcut";
        }else return null;
      },
      decoration: InputDecoration(
       
        hintText: "Ders Adı",
        filled: true,
        fillColor: Constants.anaRenk.shade100.withOpacity(0.2),
        border: OutlineInputBorder(
        borderRadius: Constants.borderRadius,
        borderSide: BorderSide.none
        )
      ),
    ),
  );
  }

 

  

  void _dersEkleVeOrtalamaHesapla() {

     if(_formKey.currentState!.validate()){
       _formKey.currentState!.save();
       var eklenecekDers=Ders(ad: girilenDersAdi,harfDegeri: secilenDegerHarfler,krediDegeri: secilenDegerKrediler);
       DataHelper.dersEkle(eklenecekDers);
       setState(() {
         
       });
     }
  }

}

