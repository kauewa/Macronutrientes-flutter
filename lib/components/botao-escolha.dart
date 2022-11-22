import 'package:flutter/material.dart';

estiloBotao(Function){
  return ElevatedButton.styleFrom(
    backgroundColor: Function,
    elevation: 10,
    shadowColor: Function,
    padding: EdgeInsets.all(15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    )
  );
}

Color? corBotaoUm(int c){
  if(c == 1){
    return Colors.lightGreen;
  }else{
    return Colors.green;
  }
}

Color? corBotaoDois(int c){
  if(c == 2){
    return Colors.lightGreen;
  }else{
    return Colors.green;
  }
}

Color? corBotaoTres(int c){
  if(c==3){
    return Colors.lightGreen;
  }else{
    return Colors.green;
  }
}