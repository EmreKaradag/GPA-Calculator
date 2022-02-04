import 'package:flutter/material.dart';
import 'package:not_ortalama/helper/data_helper.dart';
import 'package:not_ortalama/constants/app_constants.dart';
import 'package:not_ortalama/models/ders.dart';

class DersListesi extends StatefulWidget {
  final Function onDissmiss;
  const DersListesi({required this.onDissmiss,Key? key}) : super(key: key);

  @override
  State<DersListesi> createState() => _DersListesiState();
}

class _DersListesiState extends State<DersListesi> {
  
 
  
  @override
  Widget build(BuildContext context) {
    return DataHelper.tumDersler .length >0 ? ListView.builder(
    itemCount: DataHelper.tumDersler .length,
    itemBuilder: (context,index){
     return Dismissible(
       key: UniqueKey(),
       direction: DismissDirection.startToEnd,
       onDismissed: (a){
       widget.onDissmiss(index);
       },
       child: Padding(
         padding: const EdgeInsets.all(2.0),
         child: Card(
           child: ListTile(
             title: Text(DataHelper.tumDersler [index].ad),
             subtitle: Text('${DataHelper.tumDersler [index].krediDegeri} Kredi,Not Değeri ${DataHelper.tumDersler [index].harfDegeri}'),
             leading: CircleAvatar(backgroundColor: Constants.anaRenk,
             child: Text((DataHelper.tumDersler [index].harfDegeri*DataHelper.tumDersler [index].krediDegeri).toString()),
             ),
             
           ),
         ),
       ),
     );
    
    }) :Center(child: Container(child: DataHelper.placeholder1(),)); 
    
    
      
    
  }
}