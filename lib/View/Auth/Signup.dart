// ignore_for_file: body_might_complete_normally_nullable, deprecated_member_use, must_be_immutable, unused_local_variable

import '../../export/AllExport.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    var authController = Get.put(AuthController());
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
                  "Register Account",
                  style: TextStyle(fontSize: 28.h, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          TextFieldWidget(
            keyboardtype: TextInputType.name,
            prefixicon: Icon(Icons.person_outline),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Your name";
              } else {
                return null;
              }
            },
            labeltext: 'Name',
            controller: authController.signUpName,
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
            controller: authController.signUpEmail,
          ),
          Obx(()=> TextFieldWidget(
            obscurepass: !authController.showsignuppassword.value,
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
              controller: authController.signUpPassword,
              suffixicon: IconButton(onPressed: (){
                authController.showsignuppassword.value = !authController.showsignuppassword.value;
              },icon :Icon(authController.showsignuppassword.value ?Icons.visibility_outlined : Icons.visibility_off_outlined)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(()=> AppButton(
              child: authController.isloading.value ? CircularProgressIndicator(
                color: Colors.white,
              ):
               Text("SignUp", style: TextStyle(color: Colors.white)),
              onpress: () {
                if (_formkey.currentState!.validate()) {
                  authController.userRegister(
                      authController.signUpName.text,
                      authController.signUpEmail.text,
                      authController.signUpPassword.text);
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
