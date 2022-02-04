import 'package:flutter/material.dart';
import 'package:not_ortalama/constants/app_constants.dart';
import 'package:not_ortalama/helper/data_helper.dart';

class KredilerDropDown extends StatefulWidget {
  final Function onSelection;
  KredilerDropDown({required this.onSelection,Key? key}) : super(key: key);
 
  @override
  _KredilerDropDownState createState() => _KredilerDropDownState();
}

class _KredilerDropDownState extends State<KredilerDropDown> {
  double secilenDegerKrediler=1;
  @override
  Widget build(BuildContext context) {
    return Container(
    width: 55,
    alignment: Alignment.center,
    decoration: BoxDecoration(
    color: Constants.anaRenk.shade100.withOpacity(0.3),
    borderRadius: Constants.borderRadius
    ),
    child: DropdownButton<double>(
    underline: SizedBox(),
    elevation: 16,
    iconEnabledColor: Constants.anaRenk.shade200,
    value: secilenDegerKrediler,
    onChanged: (deger){
    setState(() {
    secilenDegerKrediler=deger!;
    widget.onSelection(deger);

    }); 
    },
    items: DataHelper.tumdDerslerinKredileri()
   
    ),  
    );
  }
}