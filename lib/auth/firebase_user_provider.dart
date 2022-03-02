import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class EBayadCashAgentFirebaseUser {
  EBayadCashAgentFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

EBayadCashAgentFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<EBayadCashAgentFirebaseUser> eBayadCashAgentFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<EBayadCashAgentFirebaseUser>(
            (user) => currentUser = EBayadCashAgentFirebaseUser(user));
