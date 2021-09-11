import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/global_widgets/input-field.dart';
import 'package:app_find_home/app/global_widgets/label-field.dart';
import 'package:app_find_home/app/global_widgets/primary_button.dart';
import 'package:app_find_home/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_controller.dart';

class ContentFormLogin extends StatefulWidget {

    @override
    ContentFormLoginState createState() => ContentFormLoginState();
}

class ContentFormLoginState extends State<ContentFormLogin>{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<LoginController>(
        builder: (_) => LayoutBuilder(
          builder: (context, constraint) {
            return Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 120.0,),
                    Text("Welcome",
                      style: TextStyle(
                          color: AppTheme.primaryDark,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                    Text(
                      "Login for enjoy findhome",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300
                      ),
                    ),

                    SizedBox(height: 40.0,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        width: double.infinity,
                        //height: 300.0,
                        child: Column(
                          children: [
                            LabelField(label: "Email"),
                            InputFieldCustom(
                              showSuffixIcon: true,
                              iconSuffix: Icons.home,
                              hintText: "Email",
                              controller: emailController,
                            ),
                            SizedBox(height: 10.0,),
                            LabelField(label: "Password"),
                            InputFieldCustom(
                              showSuffixIcon: true,
                              iconSuffix: Icons.visibility_outlined,
                              colorSuffix: Colors.black26,
                              obscureText: true,
                              hintText: "Password",
                              controller: passwordController,
                            ),
                            SizedBox(height: 25.0,),
                            //Expanded(child: Container()),
                            PrimaryButton(
                              text: "LOGIN",
                              onPressed: () {
                                _.onChangeEmail(emailController.text);
                                _.onChangePassword(passwordController.text);
                                _.auth();
                              },
                            ),
                            SizedBox(height: 25.0,),
                            Row(
                              children: [

                                Expanded(
                                  child: Text("Forgot password?",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 16.0
                                      )
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Get.offNamed(AppRoutes.SINGUP );
                                  },
                                  child: Text("Create new account",
                                      style: TextStyle(
                                          color: AppTheme.primaryDark,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold
                                      )
                                  )
                                )
                                
                              ],
                            ),


                          ],
                        )

                    )


                  ],
                )
            );
          }
        )
    );
  }

}