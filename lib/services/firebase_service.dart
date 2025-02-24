import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getLugares() async {
  List lugares = [];
  //CollectionReference collectionReferenceLugares = db.collection('lugares');
  QuerySnapshot queruLugares = await db.collection('lugares').get();
  for (var element in queruLugares.docs) {
    final Map<String, dynamic> data = element.data() as Map<String, dynamic>;
    final lugar = {
      "nombre": data['nombre'],
      "img": data['img'],
      "descripcion": data['descripcion'],
      "uid": element.id,
    };
    lugares.add(lugar);
  }
  return lugares;
}

Future<void> addLugar(String name, String img, String desc) async {
  await db
      .collection("lugares")
      .add({"nombre": name, "img": img, "descripcion": desc});
}

Future<void> updateLugar(
    String uid, String nname, String nimg, String ndesc) async {
  await db
      .collection("lugares")
      .doc(uid)
      .set({"nombre": nname, "img": nimg, "descripcion": ndesc});
}

Future<void> deleteLugar(String uid) async {
  await db.collection("lugares").doc(uid).delete();
}
