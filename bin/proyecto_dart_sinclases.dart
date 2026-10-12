import 'dart:io';

import 'package:proyecto_dart_sinclases/utilidades.dart';

void main(List<String> args) {
  final almacen = <int, Map<String, dynamic>>{};
  var codigo = 1;

  while (true) {
    mostrarMenu();
    final entrada = stdin.readLineSync();
    final opcion = int.tryParse(entrada?.trim() ?? '') ?? -1;

    if (opcion == -1) {
      print('Saliendo del programa...');
      break;
    }

    if (opcion == 1) {
      almacen[codigo] = anadirDispositivo();
      codigo++;
      print('Dispositivo añadido correctamente');
      continue;
    }

    if (opcion == 2) {
      print('Introduzca el código del objeto que quiere eliminar');
      final eliminar = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (almacen.remove(eliminar) != null) {
        print('Dispositivo eliminado correctamente');
      } else {
        print('El dispositivo no existe');
      }
      continue;
    }

    if (opcion == 3) {
      print('Introduzca el código del dispositivo que quiere modificar');
      final modificar = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (almacen.containsKey(modificar)) {
        almacen[modificar] = modificarDispositivo();
        print('Dispositivo modificado correctamente');
      } else {
        print('El dispositivo no existe');
      }
      continue;
    }

    if (opcion == 4) {
      listarDispositivos(almacen);
      continue;
    }

    if (opcion == 5) {
      print('Introduzca el nombre del dispositivo que quiere buscar');
      final nombre = stdin.readLineSync() ?? '';
      final resultados = buscarDispositivo(almacen, nombre);

      if (resultados.isEmpty) {
        print('No se encontraron dispositivos con ese nombre');
      } else {
        print('Resultados de la búsqueda:');
        listarDispositivos(resultados);
      }
      continue;
    }

    print('Opción no válida. Inténtelo de nuevo.');
  }

  print('Almacén final: $almacen');
}
