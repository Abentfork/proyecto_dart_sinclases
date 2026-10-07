import 'dart:io';


import 'package:proyecto_dart_sinclases/utilidades.dart';

void main(List<String> args) {
  Map<int,Map<String, dynamic>> almacen = {};
  
  int opcion = 0;
  int codigo = 1;

  while(opcion != -1){
    
    mostrarMenu();
    String entrada = stdin.readLineSync() ?? "";
    opcion = int.tryParse(entrada) ?? -1;

    if(opcion == 1){
      var entrada = {codigo : anadirDispositivo()};
    
      almacen.addAll(entrada);
      codigo++;
      print("Dispositivo añadido correctamente");
    }

    if(opcion == 2){
      print("Introduzca el codigo del objeto que quiere eliminar");
      int eliminar = int.tryParse(stdin.readLineSync() ?? "") ?? -1;
        if(almacen.remove(eliminar) != null){
          print("Dispositivo eliminado Correctamente");
        }else{
          print("El dispositivo no existe");
        }

    }
  }


  print(almacen);



}