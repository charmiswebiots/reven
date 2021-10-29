/*import 'package:trade_result/utils/font.dart';*/

class SignupValidation {
  //Check name Validation
  checkNameValidation(value) {
    if (value!.isEmpty)
      return "Name is Required";
    else
      return null;
  }

  // Check Phone Validation
  checkPhoneValidation(value) {
    if (value!.isEmpty)
      return "Phoneno is Required";
    else
      return null;
  }

  // Check Email Validation
  checkEmailValidation(e) {
    if (e.isEmpty) {
      return 'Emil is Required';
    } else {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);
      if (!regExp.hasMatch(e))
        return "Enter Valid Email";
      else
        return null;
    }
  }

// Check Password Validation
  checkPasswordValidation(value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern.toString());

    if (value!.isEmpty)
      return "Password contain at least 8 characters,one lower case(a-z),one upper case(A-Z),one number(0-9) or a symbol(!,@,#,%,&)";
    else if (!regex.hasMatch(value))
      return "Password contain at least 8 characters,one lower case(a-z),one upper case(A-Z),one number(0-9) or a symbol(!,@,#,%,&)";
    else
      return null;
  }

// Check Confirm Password Validation
  checkConfirmPasswordValidation(value, confirmPassword) {
    print(value);
    print(confirmPassword);
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern.toString());

    if (value.isEmpty)
      return "Password contain at least 8 characters,one lower case(a-z),one upper case(A-Z),one number(0-9) or a symbol(!,@,#,%,&)";
    else if (!regex.hasMatch(value))
      return "Password contain at least 8 characters,one lower case(a-z),one upper case(A-Z),one number(0-9) or a symbol(!,@,#,%,&)";
    else if (value != confirmPassword)
      return 'Passwod Not Match';
    else
      return null;
  }
}
