import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/hello.dart';

class HelloRepository {
  HelloRepository();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<Hello>> helloStreams() {
    return firestore
        .collection('hellos')
        .withConverter<Hello>(
          fromFirestore: (snapshot, _) => Hello.fromJson(
              snapshot.data()!..putIfAbsent('id', () => snapshot.id)),
          toFirestore: (hello, _) => hello.toJson(),
        )
        .snapshots()
        .transform(StreamTransformer.fromHandlers(
      handleData: (QuerySnapshot<Hello> data, EventSink<List<Hello>> sink) {
        if (data.docs.isEmpty) {
          sink.addError(Exception('No data'));
          return;
        }
        sink.add(data.docs.map((e) => e.data()).toList());
      },
    ));
  }
}
