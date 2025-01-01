//-- Custom exception class to handle various firebase authentication-related errors.

class EFirebaseAuthException implements Exception{
  final String code;

  EFirebaseAuthException(this.code);

  String get message {
    switch (code){
      case 'email-already-in-use':
      return 'the email address is already registered. please use a different email';
      case 'invalid-email':
        return 'the email address provide is invalid. please enter a valid email.';
        case 'weak-password':
          return 'The password is too weak.please choose a stronger password';
          case 'user-disabled':
            return 'The user account is disabled. please contact support for assistance.';
            case 'user-not-found':
              return 'Invalid login details. user not found.';
      case 'wrong password ':
        return 'the email address is already registered. please use a different email';
      default:
        return 'A Firebase error occurred. Please try again.';

    }
  }
}

