import 'package:flutter/material.dart';
import 'package:flutter_colombia/services/firebase_service.dart';

class AddLugar extends StatefulWidget {
  const AddLugar({super.key});

  @override
  State<AddLugar> createState() => _AddLugarState();
}

class _AddLugarState extends State<AddLugar> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController imgController = TextEditingController(text: "");
  TextEditingController descController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Agregar nuevo lugar de Colombia",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 1, 169, 184),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Ingrese el nombre'),
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
                  //print(nameController.text);
                  //print(imgController.text);
                  //print(descController.text);
                  await addLugar(nameController.text, imgController.text,
                          descController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Guardar"))
          ],
        ),
      ),
    );
  }
}
