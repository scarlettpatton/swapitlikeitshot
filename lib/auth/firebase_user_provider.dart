import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class SwapItLikeItsHotFirebaseUser {
  SwapItLikeItsHotFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

SwapItLikeItsHotFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SwapItLikeItsHotFirebaseUser> swapItLikeItsHotFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SwapItLikeItsHotFirebaseUser>(
      (user) {
        currentUser = SwapItLikeItsHotFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
