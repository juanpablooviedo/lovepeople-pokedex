import 'package:app_pokedex/detalle.dart';
import 'package:app_pokedex/objeto.dart';
import 'package:http/http.dart' as http; //* para conexion de mi app con internet
import 'dart:convert'; //* para convertir json para dart
import 'package:flutter/material.dart';

// lista de Pokemon

class Lista extends StatefulWidget {
  const Lista({Key? key}) : super(key: key);

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  List<Pokemon> listaPokemon = []; //* lista donde guardo objeto dart ya convertido de lista json
  bool loading = false; //* imagen animada de loading

  @override
  void initState() { //* incio la app cargando los pokemon con el metodo
    cargarPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        actions: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(12),
            child: Image.asset( //* imagen de pokebola
              'assets/imagens/pokebola.png',
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: listaPokemon.length, //* cantidad de la largura de la lista
            itemBuilder: (context, index) {
              return ListaWidget(
                itemPokemonLista: listaPokemon[index],
              );
            },
          ),
          if (loading) const Center(child: CircularProgressIndicator( //* loading
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            backgroundColor: Colors.black,
            strokeWidth: 12,
          )),
        ],
      ),
    );
  }

// metodo para carrregar pokemon desde api como lista json e converter para objeto dart

  void cargarPokemon() {
    setState(() {
      loading = true;
    });
    var url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');
    http.get(url).then((response) {
      if (response.statusCode == 200) {
        Map json = const JsonDecoder().convert(response.body);
        setState(() {
          listaPokemon = json['data'].map<Pokemon>((itemPokemonLista) {
            return Pokemon.fromJson(itemPokemonLista);
          }).toList();
        });
      } else {
        print(
            'ERROR! Status Code = ${response.statusCode}'); //* solo en consola para prueba //
      }
      setState(() {
        loading = false;
      });
    });
  }
}

// clase para complementar a construçao de layout e funcionamento da lista

class ListaWidget extends StatelessWidget {
  final Pokemon itemPokemonLista;
  const ListaWidget({Key? key, required this.itemPokemonLista})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: Image.network(itemPokemonLista.thumbnailImage ?? ''), //* ?? '' si viene null, colocar vacio
        title: Text(itemPokemonLista.name ?? ''),
        trailing: Text(
          '#${itemPokemonLista.number ?? ''}',
          style: TextStyle(color: Colors.black.withOpacity(0.4)),
        ),
        onTap: () {
          _irParaDetalle(context);
        },
      ),
    );
  }

// funçao para redirecionar para a pagina de detalhe de pokemon

  _irParaDetalle(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Detalle(itemPokemonDetalle: itemPokemonLista), //* me llevo las info para detalles
      ),
    );
  }
}
