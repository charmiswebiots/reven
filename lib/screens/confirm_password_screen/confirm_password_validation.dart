/*import 'package:trade_result/utils/font.dart';*/

class ConfirmPasswordValidation {


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
  checkConfirmPasswordValidation(value,confirmPassword) {
    print(value);
    print(confirmPassword);
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern.toString());

    if (value.isEmpty)
      return "Password contain at least 8 characters,one lower case(a-z),one upper case(A-Z),one number(0-9) or a symbol(!,@,#,%,&)";
    else if (!regex.hasMatch(value))
      return "Password contain at least 8 characters,one lower case(a-z),one upper case(A-Z),one number(0-9) or a symbol(!,@,#,%,&)";
    else if(value != confirmPassword)
      return 'Passwod Not Match';
    else
      return null;
  }
}
