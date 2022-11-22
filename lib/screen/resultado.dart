import 'package:flutter/material.dart';
import 'package:macronutrientes/components/botao-escolha.dart';
import 'package:macronutrientes/components/icone.dart';
import 'package:macronutrientes/data/inherited.dart';
import 'package:restart_app/restart_app.dart';

//ultima pagina - resultados
class ResultadoWidget extends StatefulWidget {
  const ResultadoWidget({super.key, required this.contextResultado});
  final BuildContext contextResultado;


  @override
  State<ResultadoWidget> createState() => _ResultadoWidgetState();
}

class _ResultadoWidgetState extends State<ResultadoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //coluna
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            //coluna - respostas      ------       ****colocar unidades de medida****
            Text('IMC: ${InfosWidget.of(widget.contextResultado).imc}',style: const TextStyle(color: Colors.white, fontSize: 12, decoration: TextDecoration.none), textAlign: TextAlign.start),
            Text('Gordura corporal: ${InfosWidget.of(widget.contextResultado).gorduraCorporal} %',style: const TextStyle(color: Colors.green, fontSize: 12, decoration: TextDecoration.none), textAlign: TextAlign.start),
            Text('Gasto calórico basal: ${InfosWidget.of(widget.contextResultado).gastoCaloricoBasal} Kcal',style: const TextStyle(color: Colors.white, fontSize: 12, decoration: TextDecoration.none), textAlign: TextAlign.start),
            Text('Gasto calórico total: ${InfosWidget.of(widget.contextResultado).gastoCaloricoTotal} Kcal',style: const TextStyle(color: Colors.green, fontSize: 12, decoration: TextDecoration.none), textAlign: TextAlign.start),
            Text('Quantidade sujerida de consumo diário: ${InfosWidget.of(widget.contextResultado).quantidadeConsumo} Kcal',style: const TextStyle(color: Colors.white, fontSize: 12, decoration: TextDecoration.none), textAlign: TextAlign.start),
            Text('Proteínas: ${InfosWidget.of(widget.contextResultado).proteina} g',style: const TextStyle(color: Colors.green, fontSize: 12, decoration: TextDecoration.none), textAlign: TextAlign.start),
            Text('Carboidrato: ${InfosWidget.of(widget.contextResultado).carboidrato} g',style: const TextStyle(color: Colors.white, fontSize: 12, decoration: TextDecoration.none), textAlign: TextAlign.start),
            Text('Gordura: ${InfosWidget.of(widget.contextResultado).gordura} g',style: const TextStyle(color: Colors.green, fontSize: 12, decoration: TextDecoration.none), textAlign: TextAlign.start),
          ],
        ),
        
        //coluna - icone
        iconePrincipal(),

        //coluna - botao-recomeçar
        ElevatedButton(onPressed: (){
          Restart.restartApp();
        },
        style: estiloBotao(corBotaoUm(2)),         
        child: const Text('Inicio')),
      ],
    );
  }
}