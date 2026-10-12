import 'dart:io';

String _leerTexto(String mensaje, {String valorPorDefecto = ''}) {
  print(mensaje);
  final entrada = stdin.readLineSync();
  final texto = entrada?.trim() ?? '';
  return texto.isEmpty ? valorPorDefecto : texto;
}

void mostrarMenu() {
  print('');
  print('1.- Añadir Dispositivo');
  print('2.- Eliminar Dispositivo');
  print('3.- Modificar Dispositivo');
  print('4.- Listar Dispositivos');
  print('5.- Buscar Dispositivo');
  print('(-1 para salir)');
}

Map<String, dynamic> anadirDispositivo() {
  final nombre = _leerTexto(
    'Introduzca el nombre del dispositivo',
    valorPorDefecto: 'Sin nombre',
  );
  final almacenamiento = _leerTexto(
    'Introduzca el almacenamiento del dispositivo',
    valorPorDefecto: 'Sin almacenamiento',
  );

  return {'Nombre': nombre, 'Almacenamiento': almacenamiento};
}

Map<String, dynamic> modificarDispositivo() {
  final nombre = _leerTexto(
    'Introduzca el nuevo nombre del dispositivo',
    valorPorDefecto: 'Sin nombre',
  );
  final almacenamiento = _leerTexto(
    'Introduzca el nuevo almacenamiento del dispositivo',
    valorPorDefecto: 'Sin almacenamiento',
  );

  return {'Nombre': nombre, 'Almacenamiento': almacenamiento};
}

void listarDispositivos(Map<int, Map<String, dynamic>> almacen) {
  if (almacen.isEmpty) {
    print('No hay dispositivos en el almacén');
    return;
  }

  print('Listado de Dispositivos');
  almacen.forEach((codigo, dispositivo) {
    final nombre = dispositivo['Nombre'] ?? 'Sin nombre';
    final almacenamiento =
        dispositivo['Almacenamiento'] ?? 'Sin almacenamiento';

    print('Código: $codigo, Nombre: $nombre, Almacenamiento: $almacenamiento');
  });
}

Map<int, Map<String, dynamic>> buscarDispositivo(
  Map<int, Map<String, dynamic>> almacen,
  String nombre,
) {
  final busqueda = nombre.trim().toLowerCase();
  final resultados = <int, Map<String, dynamic>>{};

  if (busqueda.isEmpty) {
    return resultados;
  }

  almacen.forEach((codigo, dispositivo) {
    final nombreDispositivo = (dispositivo['Nombre'] ?? '').toString();
    if (nombreDispositivo.toLowerCase().contains(busqueda)) {
      resultados[codigo] = dispositivo;
    }
  });

  return resultados;
}
