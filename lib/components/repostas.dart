import 'package:flutter/material.dart';

respostaDecoracao(String texto){
  return InputDecoration(
            hintText: texto,
            fillColor: Colors.transparent,
            filled: true,
            hintStyle: TextStyle(color: Colors.green),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green)
            )
          );
}
