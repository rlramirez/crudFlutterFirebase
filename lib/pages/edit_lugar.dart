import 'package:flutter/material.dart';
import 'package:flutter_colombia/services/firebase_service.dart';

class EditLugar extends StatefulWidget {
  const EditLugar({super.key});

  @override
  State<EditLugar> createState() => _EditLugarState();
}

class _EditLugarState extends State<EditLugar> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController imgController = TextEditingController(text: "");
  TextEditingController descController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments['nombre'];
    imgController.text = arguments['img'];
    descController.text = arguments['descripcion'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Editar el lugar a la DB'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Ingree el nombre'),
            ),
            TextField(
              controller: imgController,
              decoration:
                  const InputDecoration(hintText: 'Ingree la url de la img'),
            ),
            TextField(
              controller: descController,
              decoration:
                  const InputDecoration(hintText: 'Ingree la descripción'),
            ),
            //Divider(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  await updateLugar(arguments['uid'], nameController.text,
                          imgController.text, descController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text("ACTUALIZAR"))
          ],
        ),
      ),
    );
  }
}
