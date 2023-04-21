import 'package:flutter/material.dart';

class customTextFormField extends StatelessWidget {
  int? maxLine;
  int? minLine;
  Widget? suuf;
  Widget? prifix;
  String? hint;
  String? lable;
  Function(String)? onChange;
  bool? obscure;
  TextStyle? textStyle;
  String? Function(String?)? validate;
  VoidCallback? ontabSuffixIcon;
  VoidCallback? ontabPrifixIcon;
  TextEditingController? textEditingController;
  customTextFormField(
      {super.key,
      this.textStyle,
      this.suuf,
      this.ontabSuffixIcon,
      this.prifix,
      this.ontabPrifixIcon,
      this.hint,
      this.lable,
      this.onChange,
      this.obscure = false,
      this.maxLine,
      this.minLine,
      this.textEditingController,
      this.validate});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextFormField(
        maxLines: maxLine,
        minLines: minLine,
        style: textStyle,
        obscureText: obscure!,
        onChanged: onChange,
        controller: textEditingController,
        validator: validate,
        decoration: InputDecoration(
          suffixIcon: InkWell(onTap: ontabSuffixIcon, child: suuf),
          prefixIcon: InkWell(onTap: ontabPrifixIcon, child: prifix),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          hintText: hint,
          labelText: lable,
          labelStyle: const TextStyle(color: Colors.red),
          hintStyle: const TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
