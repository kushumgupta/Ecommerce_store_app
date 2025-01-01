
class EFormatException implements Exception {

  final String message ;
  const EFormatException([this.message ='An unexpected format error occurred.please check your input.']);

  factory EFormatException.fromMessage(String message){
    return EFormatException(message);

  }
  String get formattedMessage => message;

  factory EFormatException.fromCode(String code){
    switch (code){
      case' invalid-email-format':
        return const EFormatException('The email address format is invalid. please enter a valid email.');
      case'invalid-phone-number-format':
        return const EFormatException('The provided phone number is invalid .please enter a valid number');
      case'invalid=date-format':
        return const EFormatException('the date format is invalid .please enter a valid date');
      case'invalid-url-format':
        return const EFormatException('The URL format is invalid.please enter a valid URL.');
      case'invalid-credit-card-format':
        return const EFormatException('The credit card format is invalid.please enter a valid credit card number');
      case'invalid-numeric-format':
        return const EFormatException('The inputs should be a valid numeric format');
        default:
          return const EFormatException('A Firebase error occurred. Please try again.');

    }
  }
}

