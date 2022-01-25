import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{
  Function validitorfun;
  Function savefun;
  TextEditingController controller;
  TextInputType type;
  String title;

  CustomTextField({this.title,this.controller,this.type,this.validitorfun,this.savefun});
  @override
  Widget build(BuildContext context) {
   return
     Container
       (
     margin: EdgeInsets.symmetric(vertical: 20),
     child:  TextFormField(
       decoration: InputDecoration(
         label: Text(title),
         border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))


       ),
       onSaved: (value)=>savefun(value),
       validator: (value)=>validitorfun(value),
       controller: controller,
       keyboardType: type,



     ),
   );
  }

}