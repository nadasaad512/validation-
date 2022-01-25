import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:validitor_code/TextFiled.dart';
import 'package:validitor_code/cheakbox.dart';

class RegisterScerrn extends StatefulWidget{
  @override
  State<RegisterScerrn> createState() => _RegisterScerrnState();
}

class _RegisterScerrnState extends State<RegisterScerrn> {

  GlobalKey<FormState> globalkey= GlobalKey<FormState>();
  TextEditingController  firstnameController = TextEditingController();
  TextEditingController  secondnameController = TextEditingController();
  TextEditingController  emailController = TextEditingController();
  TextEditingController  phoneController = TextEditingController();
  TextEditingController  passwordController = TextEditingController();
  bool acceptcondition =false;

  void SavFirstName(String value ){
    passwordController.text=value;
  }
  void SavSecondtName(String value ){
   secondnameController.text=value;
  }
  void SavEmaile(String value ){
   emailController.text=value;
  }
  void SavPassword(String value ){
    phoneController.text=value;
  }
  void SavPhone(String value ){
    passwordController.text=value;
  }


  String ValiditorName(String value) {
    if (value.isNotEmpty) {

      //return 'Please Enter Name';
    }
    return null;
  }
  String ValiditorEmail(String value) {
    if (value.isEmpty) {

     return null;
    }

    else if (!RegExp(  r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$").hasMatch(value)) {
      return 'Please a valid Email';
    }
    return null;
  }

  String ValiditorNumber(String value) {
    RegExp regex = RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');

    if (value.isEmpty) {
      return null;
    }
    else if (!regex.hasMatch(value)) {
      return 'Enter acorrect number ';
    } else {
      return null;
    }
  }
  String ValiditorPassword(String value) {
    bool hasUppercase = value.contains( RegExp(r'[A-Z]'));
    bool hasDigits = value.contains( RegExp(r'[0-9]'));
    bool hasLowercase = value.contains( RegExp(r'[a-z]'));
    bool hasSpecialCharacters = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = value.length > 6;




    if(value.isEmpty){

      return null;
    }
    else if((value.length<6)){
      return "your password very short ";
    }

    else if(!(hasDigits && hasUppercase && hasLowercase && hasSpecialCharacters && hasMinLength)){
      return 'Enter a valid Password';
    }

    else {
      return null;
    }
  }



  cheakvaliditor(){
    bool cheack= globalkey.currentState.validate();
    if(cheack){
      globalkey.currentState.save();
      print(firstnameController.text);
    }
  }
  String validateCheckBox(v) {
    if (v==false) {
      return 'you have to accept our conditions';
    }
    return null;
  }

  saveCheckBoxResult(bool x) {
    this.acceptcondition = x;
  }
  bool emptytext()

  {

    setState(() {

    });
    if(
    firstnameController.text.isEmpty||
        secondnameController.text.isEmpty||
        emailController.text.isEmpty||
        passwordController.text.isEmpty||
        phoneController.text.isEmpty
    ){

        return true;
      }else{
        return false;
      }

  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(
        title: Text("Register"),
      ),
      body: Form(
        key: globalkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child:  ListView(
            children: [
              CustomTextField
                (
                title: "Enter your firstname",
                controller: firstnameController,
                type: TextInputType.text,
                savefun: SavFirstName,
                validitorfun: ValiditorName,

              ),
              CustomTextField
                (
                title: "Enter your lastname",
                controller: secondnameController,
                type: TextInputType.text,
                savefun: SavSecondtName,
                validitorfun: ValiditorName,

              ),
              CustomTextField
                (
                title: "Enter your email",

                type: TextInputType.emailAddress,
                savefun: SavEmaile,
                validitorfun: ValiditorEmail,
                controller: emailController,

              ),
              CustomTextField
                (
                title: "Enter your phone",
                controller: phoneController,
                type: TextInputType.phone,
                savefun: SavPhone,
                validitorfun: ValiditorNumber,

              ),
              CustomTextField
                (
                title: "Enter your password",
                type: TextInputType.text,
                savefun: SavPassword,
                validitorfun: ValiditorPassword,
                controller: passwordController,

              ),
              CheakBox
                (
                onSaved: saveCheckBoxResult,
                validator: validateCheckBox,
                title: Text("Custom box"),

              ),
              FormField(
                validator: (v)=> validateCheckBox(v) ,
                 onSaved:(x)=>saveCheckBoxResult(x) ,
                 //autovalidateMode:AutovalidateMode.onUserInteraction ,

                  builder: (state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    CheckboxListTile(
                        title: Text('Accept conditions'),
                        value: acceptcondition,
                        onChanged: (v) {
                          this.acceptcondition = v;
                         state.didChange(v);//make a button interact
                         // setState(() {});
                        }),

                    Text(
                      state.errorText ?? '',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                );
              }
              ),


              InkWell(
                onTap: (){

                 // log(emptytext().toString());
                  cheakvaliditor();
                },
                child: Container(
                  alignment: Alignment.center,
                   height: 50,
                  decoration: BoxDecoration(
                    color:emptytext()? Colors.grey: Colors.blue,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Text("Register"),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}