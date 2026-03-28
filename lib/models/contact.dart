import 'package:contacts/constant/color.dart';
import 'package:contacts/constant/random.dart';
import 'package:contacts/constant/telephon_code.dart';
import 'package:flutter/painting.dart';

class Contact {
  Contact({
    required this.firstName,
    required this.lastName,
    required this.number,
  }) {
    photoProfilColor = randomColor;
    id = myRandom.nextInt(1000000000);
    number = filterNumber(number);
  }
  int? id;
  String firstName;
  String lastName;

  /// 62102039232
  String number;

  Color? photoProfilColor;
  String? email;
  String? homeAddress;

  Color get randomColor =>
      profilBackgroundColorList[myRandom.nextInt(
        profilBackgroundColorList.length,
      )];

  String get initialName =>
      firstName[0].toUpperCase() + lastName[0].toUpperCase();

  String get fullName => firstName + ' ' + lastName;

  String filterNumber(String number) {
    if (number[0] == '+') {
      number = number.substring(1);
    }
    if (number[0] == '0') {
      number = countryCodeBase.toString() + number.substring(1);
    }
    // After the first digit of number have been filtered,
    // Assume that country code provided by user is correct.
    return number;
  }

  /// static method for validating user input number
  /// for further development
  /// set the condition of number validity on this method
  static bool isNumberProvidedByUserValid(String number) {
    return number
        .isNotEmpty; // you can add another condition like '&& number.length >= XX',
  }
}
