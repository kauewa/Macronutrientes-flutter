import 'package:flutter/material.dart';
import 'package:macronutrientes/components/alert.dart';
import 'package:macronutrientes/components/botao-escolha.dart';
import 'package:macronutrientes/components/icone.dart';
import 'package:macronutrientes/components/vai-volta.dart';
import 'package:macronutrientes/data/inherited.dart';
import 'package:macronutrientes/screen/resultado.dart';

//Oitava página para capturar o objetivo e executar as funções do inherited
class ObjetivoWidget extends StatefulWidget {
  const ObjetivoWidget({super.key, required this.contextObjetivo});
  final BuildContext contextObjetivo;

  @override
  State<ObjetivoWidget> createState() => _ObjetivoWidgetState();
}

class _ObjetivoWidgetState extends State<ObjetivoWidget> {
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
            'Qual seu objetivo?',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                decoration: TextDecoration.none),
            textAlign: TextAlign.center,
          ),


          //coluna - botao -perder
          ElevatedButton(
            onPressed: () {
              InfosWidget.of(widget.contextObjetivo).objetivo = 1;
              setState(() {
                color = 1;
              });
            },
            style: estiloBotao(corBotaoUm(color)),
            child: const Text('Perder peso'),
          ),


          //coluna - botao -manter
          ElevatedButton(
            onPressed: () {
              InfosWidget.of(widget.contextObjetivo).objetivo = 2;
              setState(() {
                color = 2;
              });
            },
            style: estiloBotao(corBotaoDois(color)),
            child: const Text('Manter peso'),
          ),


          //coluna - botao -ganhar
          ElevatedButton(
            onPressed: () {
              InfosWidget.of(widget.contextObjetivo).objetivo = 3;
              setState(() {
                color = 3;
              });
            },
            style: estiloBotao(corBotaoTres(color)),
            child: const Text('Ganhar peso'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  //botão para voltar a página e zerar o valor dessa página
                    onPressed: () {
                      InfosWidget.of(widget.contextObjetivo).objetivo = null;
                      Navigator.pop(context);
                    },
                    style: estiloVaiVolta(),
                    child: iconeVolta()),
                ElevatedButton(
                  //Verificação se o valor for digitado para poder prosseguir e armazenar o objetivo no inherited e executar as funções de cálculo, se não exibe mensagem de erro
                    onPressed: () {
                      if (InfosWidget.of(widget.contextObjetivo).objetivo == null) {
                        ShowAlertDialog(context);
                      } else {
                        InfosWidget.of(widget.contextObjetivo).IMC();
                        InfosWidget.of(widget.contextObjetivo).GORDURACORPORAL();
                        InfosWidget.of(widget.contextObjetivo).BASAL();
                        InfosWidget.of(widget.contextObjetivo).GASTOTOTAL();
                        InfosWidget.of(widget.contextObjetivo).CONSUMO();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contextnew) => ResultadoWidget(
                                      contextResultado: widget.contextObjetivo,
                                    )));
                      }
                    },
                    style: estiloVaiVolta(),
                    child: const Text('Calcular')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
