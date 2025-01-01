class EPlatformException implements Exception {
  final String code;

  EPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials.please double-check your information';
      case 'too-many-requests':
        return 'Too many requests.please try again later';
      case 'Invalid-argument':
        return 'Invalid argument provided to the authentication method';
      case 'invalid-password':
        return 'Incorrect password. please try again.';
      case 'Invalid-phone-number':
        return 'The provided phone number is invalid.';
      case 'operation-not -allowed':
        return 'The sign-in provider is disabled for your firebase project.';
      case 'session-cookie-expired':
        return 'The firebase session cookies has expired.please sign in again.';
      case 'uid-already-exists':
        return 'The provider user Id is already in use by another user.';
      case 'sign-in-failed':
        return 'Sign-in failed.please try again.';
      case 'network-request-failed':
        return 'Network request failed.please check your internet connection.';
      case 'internal-error':
        return 'Internal error.please try again later.';
      case 'invalid-verification-code':
        return 'Invalid verification code.please enter a valid code.';
      case 'Invalid_verification-id':
        return 'Invalid Verification ID. please request a new verification code';
      case 'quote-exceeded':
        return 'Quote Exceeded. please try again later.';
      default:
        return 'A platform error occurred. Please try again.';
    }
  }
}