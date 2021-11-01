/*import 'package:trade_result/utils/font.dart';*/

import 'package:reven/global/utility/index.dart';

class ForgotPasswordValidation {
  emailValidator(String value) {
    String val = '';
    // print(value);
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty)
      return val = 'Email is Required';
    else if (!regex.hasMatch(value))
      return val = "Please Enter valid Email";
    else
      return val;

  }

  String isEmail(String input) {
    String val='';
    val = emailValidator(input);
    return val;
  }

  String isPhone(String input) {
    String val = '';
    val = checkPhoneValidation(input);
    return val;
  }

  //Check for email or phone
  checkForEmailOrPhone(value) {
    print(value);
    print(isEmail(value));
    String emailValid = isEmail(value);
    String phoneValid = isPhone(value);
    if (emailValid != '' && phoneValid != '') {
      if(helper.isNumeric(value) && value.length > 10){
        return phoneValid;
      }else{
        return emailValid;
      }
    }
    return null;
  }

// Check Phone Validation
  checkPhoneValidation(value) {
    String val = '';
    RegExp regex = new RegExp(
        r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');

    if (value!.isEmpty)
      return val = 'Required';
    else if (value.length > 10)
      return val = 'Please enter 10 digit mobile number';
    else if (!regex.hasMatch(value))
      return val  = 'Please enter valid Phone No.';
    else
      return val;
  }
}
