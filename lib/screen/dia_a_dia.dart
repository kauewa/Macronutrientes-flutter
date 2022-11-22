import 'package:flutter/material.dart';
import 'package:macronutrientes/components/alert.dart';
import 'package:macronutrientes/components/botao-escolha.dart';
import 'package:macronutrientes/components/icone.dart';
import 'package:macronutrientes/components/vai-volta.dart';
import 'package:macronutrientes/data/inherited.dart';
import 'package:macronutrientes/screen/objetivo.dart';

//Sétima página para capturar dia a dia
class DiaADiaWidget extends StatefulWidget {
  const DiaADiaWidget({super.key, required this.contextDia});
  final BuildContext contextDia;

  @override
  State<DiaADiaWidget> createState() => _DiaADiaWidgetState();
}

class _DiaADiaWidgetState extends State<DiaADiaWidget> {
  //varíavel para alteração de cor na hora da escolha da opção
  int color = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,

      //coluna
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [



          //coluna - icone
          iconePrincipal(),


          //coluna - texto
          const Text(
            'Você passa a maior parte do seu dia:',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                decoration: TextDecoration.none),
            textAlign: TextAlign.center,
          ),


          //coluna - botao -sentado
          ElevatedButton(
            onPressed: () {
              InfosWidget.of(widget.contextDia).dia = 1;
              setState(() {
                color = 1;
              });
            },
            style: estiloBotao(corBotaoUm(color)),
            child: const Text('Sentado'),
          ),



          //coluna - botao -em movimento
          ElevatedButton(
            onPressed: () {
              InfosWidget.of(widget.contextDia).dia = 2;
              setState(() {
                color = 2;
              });
            },
            style: estiloBotao(corBotaoDois(color)),
            child: const Text('Em movimento'),
          ),


          //coluna - botao -em movimento com intensidade
          ElevatedButton(
            onPressed: () {
              InfosWidget.of(widget.contextDia).dia = 3;
              setState(() {
                color = 3;
              });
            },
            style: estiloBotao(corBotaoTres(color)),
            child: const Text('Em movimento com intensidade'),
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
                      InfosWidget.of(widget.contextDia).dia = null;
                      Navigator.pop(context);
                    },
                    style: estiloVaiVolta(),
                    child: iconeVolta()),
                ElevatedButton(
                    //Verificação se o valor for digitado para poder prosseguir e armazenar o dia a dia no inherited, se não aparece uma mensagem de erro
                    onPressed: () {
                      if (InfosWidget.of(widget.contextDia).dia == null) {
                        ShowAlertDialog(context);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contextnew) => ObjetivoWidget(
                                      contextObjetivo: widget.contextDia,
                                    )));
                      }
                    },
                    style: estiloVaiVolta(),
                    child: iconeVai()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
