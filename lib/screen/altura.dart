import 'package:flutter/material.dart';
import 'package:macronutrientes/components/alert.dart';
import 'package:macronutrientes/components/icone.dart';
import 'package:macronutrientes/components/repostas.dart';
import 'package:macronutrientes/components/vai-volta.dart';
import 'package:macronutrientes/data/inherited.dart';
import 'package:macronutrientes/screen/idade.dart';


//Terceira página para capturar altura
class AlturaWidget extends StatelessWidget {
  AlturaWidget({super.key, required this.contextAltura});
  final BuildContext contextAltura;


    //Variável para capturar o valor que for digitado na caixa
  TextEditingController txtAltura = TextEditingController();


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
        'Qual sua altura?',
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
          controller: txtAltura,
          keyboardType: TextInputType.number,
          decoration: respostaDecoracao('Altura'),
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
                  InfosWidget.of(contextAltura).altura = null;
                  Navigator.pop(context);
                },
                style: estiloVaiVolta(),
                child: iconeVolta()),
            ElevatedButton(
              //Verificação se o valor for digitado para poder prosseguir e armazenar a altura no inherited, se não aparece uma mensagem de erro
                onPressed: () {
                  if (txtAltura.text == "") {
                    ShowAlertDialog(context);
                  } else {
                    InfosWidget.of(contextAltura).altura =
                        double.parse(txtAltura.text);
                        print(InfosWidget.of(contextAltura).altura);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contextnew) => IdadeWidget(
                                  contextIdade: contextAltura,
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
