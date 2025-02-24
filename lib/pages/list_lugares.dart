import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class ListLugares extends StatefulWidget {
  const ListLugares({
    Key? key,
  }) : super(key: key);

  @override
  State<ListLugares> createState() => _HomeState();
}

class _HomeState extends State<ListLugares> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getLugares(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) async {
                      await deleteLugar(snapshot.data?[index]['uid']);
                      snapshot.data?.removeAt(index);
                    },
                    confirmDismiss: (direction) async {
                      bool result = false;
                      result = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                  "Estas seguro de borrar a: ${snapshot.data?[index]['nombre']}?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      return Navigator.pop(context, false);
                                    },
                                    child: const Text("Cancelar")),
                                TextButton(
                                    onPressed: () {
                                      return Navigator.pop(context, true);
                                    },
                                    child: const Text("Aceptar"))
                              ],
                            );
                          });
                      return result;
                    },
                    background: Container(
                      color: Colors.red,
                      child: const Icon(Icons.delete),
                    ),
                    direction: DismissDirection.endToStart,
                    key: Key(
                      snapshot.data?[index]['uid'],
                    ),
                    child: Card(
                      child: Column(
                        children: [
                          Image(
                            // Como queremos traer una imagen desde un url usamos NetworkImage
                            image: NetworkImage(snapshot.data?[index]['img']),
                          ),
                          ListTile(
                            leading: const Icon(Icons.album),
                            title: Text(
                              snapshot.data?[index]['nombre'],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            subtitle:
                                Text(snapshot.data?[index]['descripcion']),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  child: const Text('EDITAR'),
                                  onPressed: () async {
                                    await Navigator.pushNamed(context, "/edit",
                                        arguments: {
                                          "nombre": snapshot.data?[index]
                                              ['nombre'],
                                          "img": snapshot.data?[index]['img'],
                                          "descripcion": snapshot.data?[index]
                                              ['descripcion'],
                                          "uid": snapshot.data?[index]['uid'],
                                        });
                                    setState(() {});
                                  },
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  child: const Text('ELIMINAR'),
                                  onPressed: () {
                                    deleteLugar(snapshot.data?[index]['uid']);
                                    snapshot.data?.removeAt(index);
                                    setState(() {});

                                    /* AlertDialog(
                                      title: Text(
                                          "Estas seguro de borrar a: ${snapshot.data?[index]['nombre']}?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              return Navigator.pop(
                                                  context, false);
                                            },
                                            child: const Text("Cancelar")),
                                        TextButton(
                                            onPressed: () {
                                              return Navigator.pop(
                                                  context, true);
                                            },
                                            child: const Text("Aceptar"))
                                      ],
                                    );*/
                                  },
                                ),
                                const SizedBox(width: 8),
                              ])
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
