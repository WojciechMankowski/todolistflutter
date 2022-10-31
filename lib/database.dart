import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

// final DatabaseReference = FirebaseDatabase.instance.reference();
final docTaks = FirebaseFirestore.instance.collection('tasks').snapshots();

// final json = {'name': "Nauwka angielskiego", 'category': "Angielski"};
// docTaks.Set() zapi danych do db
//  zamianna klasy na jso nameclass.toJSon