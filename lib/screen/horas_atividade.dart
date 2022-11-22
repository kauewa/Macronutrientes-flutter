import 'package:flutter/material.dart';
import 'package:macronutrientes/components/alert.dart';
import 'package:macronutrientes/components/icone.dart';
import 'package:macronutrientes/components/repostas.dart';
import 'package:macronutrientes/components/vai-volta.dart';
import 'package:macronutrientes/data/inherited.dart';
import 'package:macronutrientes/screen/dia_a_dia.dart';


//Sexta página para capturar as horas de atividade
class HorasAtividadeWidget extends StatelessWidget {
  HorasAtividadeWidget({super.key, required this.contextHoras});
  final BuildContext contextHoras;


  //Variável para capturar o valor que for digitado na caixa
  TextEditingController txtHoras = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white10,


        //coluna
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [


        //coluna - icone
        iconePrincipal(),


        //coluna - texto
        const Text(
        'Quantas horas de atividade física você prática na semana?',
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            decoration: TextDecoration.none),
        textAlign: TextAlign.center,
        ),


        //coluna - caixa-resposta
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: TextFormField(
          controller: txtHoras,
          keyboardType: TextInputType.number,
          decoration:respostaDecoracao("Horas"),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        ),


        //coluna - row-vai-volta
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              //botão para voltar a página e zerar o valor dessa página
                onPressed: () {
                  InfosWidget.of(contextHoras).horas = null;
                  Navigator.pop(context);
                },
                style: estiloVaiVolta(),
                child: iconeVolta()),
            ElevatedButton(
              //Verificação se o valor for digitado para poder prosseguir e armazenar as horas de atividade no inherited, se não aparece uma mensagem de erro
                onPressed: () {
                  if (txtHoras.text == "") {
                    ShowAlertDialog(context);
                  } else {
                    InfosWidget.of(contextHoras).horas =
                        int.parse(txtHoras.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contextnew) => DiaADiaWidget(
                                  contextDia: contextHoras,
                                )));
                  }
                },
                style: estiloVaiVolta(),
                child: iconeVai()),
          ],
        ),
        )
      ]));
  }
}
