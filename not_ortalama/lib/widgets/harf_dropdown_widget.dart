import 'package:flutter/material.dart';
import 'package:not_ortalama/constants/app_constants.dart';
import 'package:not_ortalama/helper/data_helper.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onSelection;
  HarfDropDownWidget({required this.onSelection,Key? key}) : super(key: key);

  @override
  _HarfDropDownWidgetState createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double secilenDegerHarfler=4;
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
    value: secilenDegerHarfler,
    onChanged: (deger){
    setState(() {
    secilenDegerHarfler=deger!;
    widget.onSelection(deger);
    });
    },
    items: DataHelper.tumDerslerinHarfleri()
   
    ),  
    );
  }
}