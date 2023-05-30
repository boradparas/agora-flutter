import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/hello.dart';

/// Collection: hellos
CollectionReference hellosCollection(FirebaseFirestore firestore) =>
    firestore.collection('hellos').withConverter<Hello>(
          fromFirestore: (snapshot, _) => Hello.fromJson(
              snapshot.data()!..putIfAbsent('id', () => snapshot.id)),
          toFirestore: (hello, _) => hello.toJson(),
        );
