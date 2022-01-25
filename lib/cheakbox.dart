import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheakBox extends FormField<bool>{
  CheakBox(
      {
        Widget title,
        FormFieldSetter<bool> onSaved,
        FormFieldValidator<bool> validator,
      bool initialValue = false,//
       bool autovalidate = false//

      }
        )
      : super//replecre "Form"
      (
      autovalidateMode: AutovalidateMode.onUserInteraction,//
      onSaved: onSaved,
      validator: validator,
     initialValue: initialValue,//
      //state >>state of box depend to validitor and saved
      builder: (FormFieldState<bool> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
                title: title,
                value: state.value,
                onChanged: (v) {
                  state.didChange(v);
                }),
            Text
              (
              //errorText from validitor
              state.errorText ?? '',
              style: TextStyle(color: Colors.red),
            )
          ],
        );
      });

}