import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/data/model/user_model.dart';
import 'package:app_find_home/app/global_widgets/input-field.dart';
import 'package:app_find_home/app/global_widgets/label-field.dart';
import 'package:app_find_home/app/global_widgets/primary_button.dart';
import 'package:app_find_home/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../signup_controller.dart';


class FormSignup extends StatefulWidget {

  @override
  FormSignupState createState() => FormSignupState();
}

class FormSignupState extends State<FormSignup>{

  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _nameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<SingupController>(
        builder: (_) =>

            SingleChildScrollView(
                child:
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelField(label: "Name"),
                          InputFieldCustom(
                            showSuffixIcon: true,
                            iconSuffix: Icons.person_outline,
                            hintText: "Name",
                            controller: _nameController,
                          ),
                          SizedBox(height: 10.0,),
                          LabelField(label: "Last name"),
                          InputFieldCustom(
                            showSuffixIcon: true,
                            iconSuffix: Icons.bubble_chart_outlined,
                            hintText: "Last name",
                            controller: _lastNameController,
                          ),
                          SizedBox(height: 10.0,),
                          LabelField(label: "Address"),
                          InputFieldCustom(
                            showSuffixIcon: true,
                            iconSuffix: Icons.directions_outlined,
                            hintText: "Address",
                            controller: _addressController,
                          ),
                          SizedBox(height: 10.0,),
                          LabelField(label: "Email"),
                          InputFieldCustom(
                            showSuffixIcon: true,
                            iconSuffix: Icons.email_outlined,
                            hintText: "Email",
                            controller: _emailController,
                          ),
                          SizedBox(height: 10.0,),
                          LabelField(label: "Password"),
                          InputFieldCustom(
                            showSuffixIcon: true,
                            iconSuffix: Icons.lock_outline,
                            // colorSuffix: Colors.black26,
                            obscureText: true,
                            hintText: "Password",
                            controller: _passwordController,
                          ),
                          SizedBox(height: 25.0,),
                          //Expanded(child: Container()),
                          PrimaryButton(
                            text: "Sing Up",
                            onPressed: () {
                              UserModel userModel = new UserModel(
                                name: _nameController.text,
                                lastname: _lastNameController.text,
                                adress: _addressController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              _.singup(userModel);
                            },
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * .03),
                          Center(
                            child: Text(
                              "Already have an account",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                  color: Colors.black38, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () => Get.offNamed(AppRoutes.LOGIN),
                              child: Text(
                                "Sign In",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                    color: AppTheme.blueDark, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                        ]
                    )

            )
    );
  }

}