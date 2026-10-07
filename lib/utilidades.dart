import 'dart:io';

void  mostrarMenu(){
  print("1.- Añadir Dispositivo");
  print("2.- Eliminar Dispositivo");
  print("3.- Modificar Dispositvo");
  print("4.- Listar Dispositivos");
  print("(-1 para salir)");
}

Map<String,dynamic> anadirDispositivo(){
  print("Introduzca el nombre del dispositivo");
  String nombre = stdin.readLineSync() ?? "";
  print("Introduzca el almacenamiento del dispositivo");
  String almacenamiento = stdin.readLineSync() ?? "";


  var dispositivo = {"Nombre" : nombre, "Almacenamiento" : almacenamiento};

  return dispositivo;

}

