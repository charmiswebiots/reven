/*import 'package:trade_result/utils/font.dart';*/

import 'package:reven/global/packages/config_package.dart';

class LoginValidation {
  emailValidator(String value) {
    String val = '';
    // print(value);
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty)
      return val = 'Email is Required';
    else if (!regex.hasMatch(value))
      return val = "Please Enter valid Email or Phone No";
    else
      return val;
  }

  String isEmail(String input) {
    String val = '';
    val = emailValidator(input);
    return val;
  }

  String isPhone(String input) {
    String val = '';
    val = checkPhoneValidation(input);
    return val;
  }

// Check Id Validation
  checkEmailIDValidation(value) {
    if (value.isEmpty) {
      return 'Email Required';
    } else {
      return emailValidator(value);
    }
    return '';
  }

  //Check for email or phone
  checkForEmailOrPhone(value) {
    print(value);
    print(isEmail(value));
    String emailValid = isEmail(value);
    String phoneValid = isPhone(value);
    if (emailValid != '' && phoneValid != '') {
      if (helper.isNumeric(value) && value.length > 10) {
        return phoneValid;
      } else {
        return emailValid;
      }
    }
    return null;
  }

  //Check Phone Validation
  checkPhoneValidation(value) {
    String val = '';
    RegExp regex = new RegExp(
        r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');

    if (value!.isEmpty)
      return val = 'Required';
    else if (value.length > 10)
      return val = 'Please enter 10 digit mobile number';
    else if (!regex.hasMatch(value))
      return val = 'Please enter valid Phone No.';
    else
      return val;
  }

  // Check Password Validation
  checkPasswordValidation(value) {
    print(value);
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern.toString());

    if (value.isEmpty)
      return "Password contain at least 8 characters,one lower case(a-z),one upper case(A-Z),one number(0-9) or a symbol(!,@,#,%,&)";
    else if (!regex.hasMatch(value))
      return "Password contain at least 8 characters,one lower case(a-z),one upper case(A-Z),one number(0-9) or a symbol(!,@,#,%,&)";
    else
      return null;
  }
}
