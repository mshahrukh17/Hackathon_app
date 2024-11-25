// ignore_for_file: body_might_complete_normally_nullable

import '../../export/AllExport.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    final _formkey = GlobalKey<FormState>();
    return Form(
      key: _formkey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 22.w,
                ),
                Text(
                  "Login to your \nExisting Account",
                  style: TextStyle(fontSize: 28.h, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          TextFieldWidget(
            keyboardtype: TextInputType.emailAddress,
            prefixicon: Icon(Icons.email_outlined),
            validator: (value) {
              RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
              if (value == null || value.isEmpty) {
                return "Enter Your email";
              } else if (!regExp.hasMatch(value)) {
                return "Enter your valid gmail";
              }
            },
            labeltext: 'Email',
            controller: authController.loginemail,
          ),
          Obx(()=> TextFieldWidget(
                obscurepass: !authController.showloginpassword.value,
                keyboardtype: TextInputType.visiblePassword,
                prefixicon: Icon(Icons.lock_outline),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Your password";
                  } else if (value.length < 6) {
                    return "Password must be 6 letters or above";
                  }
                },
                labeltext: 'Password',
                controller: authController.loginpassword,
                suffixicon: IconButton(
                    onPressed: () {
                      authController.showloginpassword.value =
                          !authController.showloginpassword.value;
                    },
                    icon: Icon(authController.showloginpassword.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined))),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => AppButton(
              child: authController.isloading.value
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text("Login", style: TextStyle(color: Colors.white)),
              onpress: () {
                if (_formkey.currentState!.validate()) {
                  authController.userLogin(authController.loginemail.text,
                      authController.loginpassword.text);
                }
              },
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Divider(
                    endIndent: 10,
                    indent: 25,
                  ),
                ),
                Text(
                  "OR",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Flexible(
                  child: Divider(
                    endIndent: 25,
                    indent: 10,
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.facebook,
                  color: Colors.blueAccent,
                  size: 40.h,
                ),
                Icon(
                  Icons.apple,
                  size: 40.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
