/*import 'package:trade_result/utils/font.dart';*/

class LoginValidation {

  String emailValidator(String value) {
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty) return '*Required';
    if (!regex.hasMatch(value))
      return '*Enter a valid email';
    else
      return '';
  }

// Check Id Validation
  String checkEmailIDValidation(value) {
    if (value.isEmpty) {
      return 'Email Required';
    }else{
      return emailValidator(value);
    }
    return '';
  }

// Check Phone Validation
  String checkPhoneValidation(value) {
    if (value!.isEmpty)
      return "Phoneno is Required";
    else
      return '';
  }

// Check Password Validation
  String checkPasswordValidation(value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern.toString());

    if (value!.isEmpty)
      return "Password contain at least 8 characters,one lower case(a-z),one upper case(A-Z),one number(0-9) or a symbol(!,@,#,%,&)";
    else if (!regex.hasMatch(value))
      return "Password contain at least 8 characters,one lower case(a-z),one upper case(A-Z),one number(0-9) or a symbol(!,@,#,%,&)";
    else
      return '';
  }
}