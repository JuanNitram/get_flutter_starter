import 'package:flutter/material.dart';

import 'package:get_flutter_starter/components/button_styles/elevated_button_primary_style.dart';
import 'package:get_flutter_starter/components/field_decorations/text_form_field_primary_decoration.dart';

Form loginForm({viewModel, formKey, emailCtr, passwordCtr, rememberMe}) {
  return Form(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    key: formKey,
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextFormField(
        controller: emailCtr,
        validator: (value) {
          return (value == null || value.isEmpty) ? 'Please Enter Email' : null;
        },
        decoration: textFormFieldPrimaryDecoration('E-mail', Icons.person),
      ),
      const SizedBox(
        height: 8,
      ),
      TextFormField(
        validator: (value) {
          return (value == null || value.isEmpty) ? 'Please Enter Password' : null;
        },
        controller: passwordCtr,
        decoration: textFormFieldPrimaryDecoration('Password', Icons.lock),
      ),
      const SizedBox(
        height: 30,
      ),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      onChanged: (bool? value) {},
                      value: rememberMe,
                    ),
                  ),
                  const Text("Remember Me")
                ],
              ),
              const Text("Forget Password")
            ],
          )),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: ElevatedButton(
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  await viewModel.loginUser(emailCtr.text, passwordCtr.text);
                }
              },
              child: const Text('Login'),
              style: elevatedButtonPrimaryStyle(),
            ),
          )),
    ]),
  );
}
