import 'package:flutter/material.dart';
import 'package:macronutrientes/components/alert.dart';
import 'package:macronutrientes/components/icone.dart';
import 'package:macronutrientes/components/repostas.dart';
import 'package:macronutrientes/components/vai-volta.dart';
import 'package:macronutrientes/data/inherited.dart';
import 'package:macronutrientes/screen/horas_atividade.dart';

//Quinta página para capturar peso
class PesoWidget extends StatelessWidget {
  PesoWidget({super.key, required this.contextPeso});
  final BuildContext contextPeso;

  //Variável para capturar o valor que for digitado na caixa
  TextEditingController txtPeso = TextEditingController();

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
        'Qual seu peso?',
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
          controller: txtPeso,
          keyboardType: TextInputType.number,
          decoration: respostaDecoracao("Peso"),
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
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
                  InfosWidget.of(contextPeso).peso = null;
                  Navigator.pop(context);
                },
                style: estiloVaiVolta(),
                child: iconeVolta()),
            ElevatedButton(
               //Verificação se o valor for digitado para poder prosseguir e armazenar o peso no inherited, se não aparece uma mensagem de erro
                onPressed: () {
                  if (txtPeso.text == "") {
                    ShowAlertDialog(context);
                  } else {
                    InfosWidget.of(contextPeso).peso =
                        double.parse(txtPeso.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contextnew) => HorasAtividadeWidget(
                                  contextHoras: contextPeso,
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
