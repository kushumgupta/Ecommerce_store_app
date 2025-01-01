class EFirebaseException implements Exception {
  final String code;

  EFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occurred. please try again.';
      case 'invalid-custom-token':
        return'the custom token format is incorrect. please check your custom token';
      case 'permission-denied':
        return 'You do not have permission to perform this action.';
      case 'unavailable':
        return 'The server is currently unavailable. Please try again later.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'invalid-email':
        return 'The email address is malformed.';
      default:
        return 'A Firebase error occurred. Please try again.';
    }
  }
}


