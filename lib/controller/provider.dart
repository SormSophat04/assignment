import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends Notifier<Map<String , dynamic>>{
  @override
  Map<String , dynamic> build() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    
    return {};
  }
}