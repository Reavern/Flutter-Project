import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'repository.dart';

class Bloc {

  final _repository = Repository();


  final _firestoreDataSubject = BehaviorSubject<QuerySnapshot>();

  Stream<QuerySnapshot> nameList() {
    return _repository.nameList();
  }


  void dispose() {
    _firestoreDataSubject?.close();
  }
}