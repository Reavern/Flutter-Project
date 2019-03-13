import 'package:cloud_firestore/cloud_firestore.dart';

import 'firestore_provider.dart';

class Repository {

  final _firestoreProvider = FirestoreProvider();

  Stream<QuerySnapshot> nameList() =>
    _firestoreProvider.nameList();
}