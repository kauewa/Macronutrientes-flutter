import 'package:flutter/material.dart';

// transformação dos dados


class InfosWidget extends InheritedWidget{
  InfosWidget({
    super.key,
    required Widget child
  }) : super(child: child);
  
  

  //Dados coletados
  int? genero;
  double? peso;
  double? altura;
  int? idade;
  int? horas;
  int? dia;
  int? objetivo;

  //Dados de saída
  double? imc;
  double? gorduraCorporal;
  double? gastoCaloricoBasal;
  double? gastoCaloricoTotal;
  double? quantidadeConsumo;
  double? carboidrato;
  double? proteina;
  double? gordura;

  //Funções para atribuição dos dados de saída
  void IMC(){
    imc = peso!/(altura!*altura!);
  }

  void GORDURACORPORAL(){
    gorduraCorporal = (1.2*imc!)+(0.23*idade!)-(10.8*genero!)-5.4;
  }

  void BASAL(){
    switch (genero!) {
      case 0:
        if(idade! >= 18 && idade! <=30){
          gastoCaloricoBasal = (0.062*peso!+2.036)*239;
        }else if(idade! >= 31 && idade! <= 40){
          gastoCaloricoBasal = (0.034*peso!+3.538)*239;
        }
        break;
      case 1:
        if(idade! >= 18 && idade! <=30){
          gastoCaloricoBasal = (0.063*peso!+2.896)*239;
        }else if(idade! >= 31 && idade! <= 40){
          gastoCaloricoBasal = (0.048*peso!+3.653)*239;
        }
        break;
      default:
        return null;
    }
  }

  void GASTOTOTAL(){
    if(dia==1)
        {
            gastoCaloricoTotal = (0.9*(horas!/7)*peso!)+gastoCaloricoBasal!+50;
        }else if(dia==2)
        {
            gastoCaloricoTotal = (0.9*(horas!/7)*peso!)+gastoCaloricoBasal!+100;
        }else if(dia==3)
        {
            gastoCaloricoTotal = (0.9*(horas!/7)*peso!)+gastoCaloricoBasal!+150;
        }
  }

  void CONSUMO(){
    if(objetivo==1)
        {
            quantidadeConsumo = gastoCaloricoTotal!-300;
            proteina = ((50*quantidadeConsumo!)/100)/4;
            carboidrato = ((25*quantidadeConsumo!)/100)/4;
            gordura = ((25*quantidadeConsumo!)/100)/9;
        }else if(objetivo==2)
        {
            quantidadeConsumo = gastoCaloricoTotal!;
            proteina = ((40*quantidadeConsumo!)/100)/4;
            carboidrato = ((40*quantidadeConsumo!)/100)/4;
            gordura = ((20*quantidadeConsumo!)/100)/9;
        }else if(objetivo==3)
        {
            quantidadeConsumo = gastoCaloricoTotal!+300;
            proteina = ((30*quantidadeConsumo!)/100)/4;
            carboidrato = ((50*quantidadeConsumo!)/100)/4;
            gordura = ((20*quantidadeConsumo!)/100)/9;
        } 
  }


  
  static InfosWidget of(BuildContext context) {
    final InfosWidget? result = context.dependOnInheritedWidgetOfExactType<InfosWidget>();
    assert(result != null, 'No InfosWidget found in context');
    return result!;
  }
    
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
  



  




}