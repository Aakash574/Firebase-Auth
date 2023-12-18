import 'package:_firebase_auth/src/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.googleSignInValue.value == null
              ? FloatingActionButton.extended(
                  onPressed: () {
                    controller.login();
                  },
                  backgroundColor: Colors.white,
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  label: Text(
                    "Sign in with Google",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundImage: Image.network(
                        controller.googleSignInValue.value!.photoUrl ?? "",
                      ).image,
                      radius: 64,
                    ),
                    Text(controller.googleSignInValue.value!.displayName ?? ""),
                    Text(controller.googleSignInValue.value!.email)
                  ],
                ),
        ),
      ),
    );
  }
}
