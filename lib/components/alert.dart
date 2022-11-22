import 'package:flutter/material.dart';

ShowAlertDialog (BuildContext context){
 

  AlertDialog alerta = AlertDialog(
    title: Text("Responda a pergunta para continuar com o cálculo!"),
    actions: [ElevatedButton(onPressed:(){Navigator.pop(context);},style: ElevatedButton.styleFrom(backgroundColor: Colors.green), child: Text("OK")),],
  );

  showDialog(context: context, builder: (BuildContext context) {return alerta;});
}