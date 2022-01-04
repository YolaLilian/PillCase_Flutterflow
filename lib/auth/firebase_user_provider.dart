import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PillyCaseFirebaseUser {
  PillyCaseFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

PillyCaseFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PillyCaseFirebaseUser> pillyCaseFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<PillyCaseFirebaseUser>(
        (user) => currentUser = PillyCaseFirebaseUser(user));
