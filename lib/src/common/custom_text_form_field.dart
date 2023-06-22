import 'package:flutter/material.dart';

import '../const/colors/colors.dart';

final OutlineInputBorder enabledOutLineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: AppColor.kBlack),
);

final OutlineInputBorder focousedOutLineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: AppColor.kPrimary),
);

class CustomTextFormField extends StatelessWidget {
  final String label;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {Key? key, required this.label, this.suffixIcon, this.validator})
      : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: TextFormField(
        cursorColor: AppColor.kPrimary,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          label: Text(
            label,
            style: const TextStyle(color: AppColor.kBlack),
          ),
          suffixIcon: suffixIcon != null
              ? Icon(
                  suffixIcon,
                  color: AppColor.kPrimary,
                )
              : null,
          focusedBorder: focousedOutLineInputBorder,
          enabledBorder: enabledOutLineInputBorder,
          border: enabledOutLineInputBorder,
        ),
        validator: validator,
      ),
    );
  }
}
