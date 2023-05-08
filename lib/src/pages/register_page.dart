import 'package:flutter/material.dart';

import '../common/custom_button.dart';
import '../common/custom_text_form_field.dart';
import '../const/colors/colors.dart';
import '../const/string/string.dart';
import '../utils/navigation/navitaion.dart';
import '../widgets/custom_icon.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                color: AppColor.kCard, borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width * 0.8,
            //         height: 200,
            child: Form(
              key: _registerFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomIcon(),
                  CustomTextFormField(
                    label: 'User Name',
                    suffixIcon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      if (value.length < 8) {
                        return 'Password should be atleast 8 character';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: 'Email',
                    suffixIcon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: 'Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      if (value.length < 8) {
                        return 'Password should be atleast 8 character';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: 'Re-Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      if (value.length < 8) {
                        return 'Password should be atleast 8 character';
                      }
                      return null;
                    },
                  ),
                  CustomButton(
                    onPress: () {
                      if (_registerFormKey.currentState!.validate()) {
                        print('woooooooooooooooooooooooo');
                      }
                    },
                    text: AppString.register,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('Already have an Account, '),
                      GestureDetector(
                        onTap: () => navigateBackTo(context),
                        child: const Text(
                          'Login in',
                          style: TextStyle(color: AppColor.kPrimary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
