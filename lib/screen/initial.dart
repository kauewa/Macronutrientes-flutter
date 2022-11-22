import 'package:flutter/material.dart';
import 'package:macronutrientes/screen/genero.dart';


//Página inicial

class InitialWidget extends StatelessWidget {
  const InitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //Coluna - pai de todos
    return Container(
      color: Colors.white10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          

          //coluna - Icone
          const Icon(Icons.fitness_center, color: Colors.green, size: 200,),
          

          //coluna - Texto
          const Text('Calcule seus Macro-Nutrientes!', style: TextStyle(color: Colors.white, fontSize: 20, decoration: TextDecoration.none), textAlign: TextAlign.center, ),
          
          
          //coluna - Botão iniciar
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (contextnew) => GeneroWidget(contextGenero: context)));
          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            elevation: 10,
            shadowColor: Colors.greenAccent,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),       
          child: const Text('Começar', style: TextStyle(fontSize: 20),)),
        ],
      ),
    );
  }
}