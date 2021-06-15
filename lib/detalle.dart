import 'package:app_pokedex/objeto.dart';
import 'package:flutter/material.dart';

// detalhe do Pokemon

class Detalle extends StatelessWidget {  
  final Pokemon itemPokemonDetalle;

  const Detalle({Key? key, required this.itemPokemonDetalle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemPokemonDetalle.name ?? ''), //* nombre del pokemon desde item de la lista
      ),
      body: SafeArea(
        child: Container( //!...//
          height: 500,
          child: Card( //* formato de tarjeta
            margin: const EdgeInsets.all(10),
            child: ListView( //* formato de lista
              padding: const EdgeInsets.all(20),
              children: <Widget>[ //* coloco varios widget juntos
                Stack(children: <Widget>[ //* para superponer el numero en la imagen
                  Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerRight, //* numero en la derecha
                    child: Text(
                      '#${itemPokemonDetalle.number ?? ''}',
                    ),
                  ),
                  Container(
                    alignment: Alignment.center, //* imagen en el centro
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), //* bordes de la imagen
                      color: Colors.black12, //* color de fondo de la imagen
                    ),
                    child: Image.network(itemPokemonDetalle.thumbnailImage ?? ''),
                  ),
                ]),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  itemPokemonDetalle.description ?? '',
                  ),
                const Divider(
                  height: 30,
                  thickness: 1,
                ),
                const Text(
                  'Tipo:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text (
                  itemPokemonDetalle.type
                    .toString() //* contenido para string
                    .replaceAll('[', '') //* reemplazando corchetes y comas de la lista por vacio
                    .replaceAll(']', '')
                    .replaceAll(',', ''),
                ),
                const Divider(
                  height: 30,
                  thickness: 1, //* grosura de la linea
                ),
                const Text(
                  'Fraquezas:',
                  style: TextStyle(fontWeight: FontWeight.bold), //* texto en negita
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  itemPokemonDetalle.weakness
                    .toString()
                    .replaceAll('[', '')
                    .replaceAll(']', '')
                    .replaceAll(',', ''),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}  