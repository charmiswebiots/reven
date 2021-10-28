import 'package:flutter/material.dart';
import 'package:reven/global/commonWidget/common/custom_textformfield.dart';

class Tab2 extends StatelessWidget {
  final TextEditingController? txtPhoneno;
  final TextEditingController? txtpassword;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool? obscuredText;
  GestureTapCallback? onTap;
  final bool? isValidate;

  Tab2({Key? key, this.txtPhoneno, this.onSaved, this.validator, this.onChanged, this.txtpassword, this.obscuredText,this.onTap, this.isValidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Phone'),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            padding: 20,
            borderRadis: 60,
            controller: txtPhoneno,
            hintText: 'Ex : 9316140133',
            keyboardType: TextInputType.phone,
            maxLength: 10,
            validator: (value) {
              if (value!.isEmpty)
                return "Phoneno is Required";
              else
                return null;
            },
            onChanged: onChanged,
            suffixIcon: isValidate!
                ? Icon(
              Icons.check_circle,
              color: Colors.green,
            )
                : Icon(
              Icons.cancel,
              color: Colors.red,
            ),
            prefixIcon: Icon(
              Icons.phone_android,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Password'),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            padding: 20,
            borderRadis: 60,
            controller: txtpassword,
            keyboardType: TextInputType.visiblePassword,
            hint: 'Enter your Password',
            obscureText: obscuredText!,
            prefixIcon: Icon(
              Icons.vpn_key,
              color: Colors.grey,
            ),
            suffixIcon: InkWell(
              onTap: onTap,
              child: obscuredText!
                  ? Icon(Icons.visibility_off, color: Colors.black54)
                  : Icon(Icons.visibility, color: Colors.black54),
            ),
            validator: (value) {
              Pattern pattern =
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
              RegExp regex = new RegExp(pattern.toString());

              if (value!.isEmpty)
                return "Password contain at least 8 characters,one lower case(a-z),one upper case(A-Z),one number(0-9) or a symbol(!,@,#,%,&)";
              else if (!regex.hasMatch(value))
                return "Password contain at least 8 characters,one lower case(a-z),one upper case(A-Z),one number(0-9) or a symbol(!,@,#,%,&)";
              else
                return null;
            },
          ),
        ],
      ),
    );
  }
}
