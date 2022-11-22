import 'package:flutter/material.dart';
import 'package:macronutrientes/components/alert.dart';
import 'package:macronutrientes/components/icone.dart';
import 'package:macronutrientes/components/repostas.dart';
import 'package:macronutrientes/components/vai-volta.dart';
import 'package:macronutrientes/data/inherited.dart';
import 'package:macronutrientes/screen/peso.dart';


//Quarta página para capturar idade
class IdadeWidget extends StatelessWidget {
  IdadeWidget({super.key, required this.contextIdade});
  final BuildContext contextIdade;


 //Variável para capturar o valor que for digitado na caixa
  TextEditingController txtIdade = TextEditingController();

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
        'Qual sua idade?',
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
          controller: txtIdade,
          keyboardType: TextInputType.number,
          decoration: respostaDecoracao("Idade"),
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
                  InfosWidget.of(contextIdade).idade = null;
                  Navigator.pop(context);
                },
                style: estiloVaiVolta(),
                child: iconeVolta()),
            ElevatedButton(
              //Verificação se o valor for digitado para poder prosseguir e armazenar a idade no inherited, se não aparece uma mensagem de erro
                onPressed: () {
                  if (txtIdade.text == "") {
                    ShowAlertDialog(context);
                  } else {
                    InfosWidget.of(contextIdade).idade =
                        int.parse(txtIdade.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contextnew) => PesoWidget(
                                  contextPeso: contextIdade,
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
