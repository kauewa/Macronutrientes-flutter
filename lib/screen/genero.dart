import 'package:flutter/material.dart';
import 'package:macronutrientes/components/botao-escolha.dart';
import 'package:macronutrientes/components/icone.dart';
import 'package:macronutrientes/components/vai-volta.dart';
import 'package:macronutrientes/data/inherited.dart';
import 'package:macronutrientes/screen/altura.dart';
import '../components/alert.dart';

//Segunda página para capturar gênero
class GeneroWidget extends StatefulWidget {
  const GeneroWidget({super.key, required this.contextGenero});
  final BuildContext contextGenero;

  @override
  State<GeneroWidget> createState() => _GeneroWidgetState();
}

class _GeneroWidgetState extends State<GeneroWidget> {
  //varíavel para alteração de cor na hora da escolha da opção
  int color = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,

      //Coluna
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          

          //coluna - icone
          iconePrincipal(),


          //coluna - texto
          const Text(
            'Qual seu gênero?',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                decoration: TextDecoration.none),
            textAlign: TextAlign.center,
          ),


          //coluna - linha de opções
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [


              //coluna - linha de opções - botão masculino
              ElevatedButton(
                onPressed: () {
                  InfosWidget.of(widget.contextGenero).genero = 1;
                  print(InfosWidget.of(widget.contextGenero).genero);
                  setState(() {
                    color = 1;
                  });
                },
                style: estiloBotao(corBotaoUm(color)),
                child: const Text('Masculino'),
              ),


              //coluna - linha de opções - botão feminino
              ElevatedButton(
                  onPressed: () {
                    InfosWidget.of(widget.contextGenero).genero = 0;
                    print(InfosWidget.of(widget.contextGenero).genero);
                    setState(() {
                      color = 2;
                    });
                  },
                  style: estiloBotao(corBotaoDois(color)),
                  child: const Text('Feminino')),
            ],
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
                      InfosWidget.of(widget.contextGenero).genero = null;
                      Navigator.pop(context);
                    },
                    style: estiloVaiVolta(),
                    child: iconeVolta()),
                ElevatedButton(
                  //Verificação se o valor for digitado para poder prosseguir e armazenar o gênero no inherited, se não aparece uma mensagem de erro
                    onPressed: () {
                      if (InfosWidget.of(widget.contextGenero).genero == null) {
                        ShowAlertDialog(context);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contextnew) => AlturaWidget(
                                      contextAltura: widget.contextGenero,
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
