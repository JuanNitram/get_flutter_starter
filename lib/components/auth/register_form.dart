import 'package:flutter/material.dart';

import 'package:get_flutter_starter/components/button_styles/elevated_button_primary_style.dart';
import 'package:get_flutter_starter/components/field_decorations/text_form_field_primary_decoration.dart';

Form registerForm({
  viewModel,
  formKey,
  emailCtr,
  passwordCtr,
}) {
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
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty || value != passwordCtr.text) ? 'Passwords does not match' : null;
          },
          decoration: textFormFieldPrimaryDecoration('Retype Password', Icons.lock),
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    await viewModel.registerUser(emailCtr.text, passwordCtr.text);
                  }
                },
                style: elevatedButtonPrimaryStyle(),
                child: const Text('Register'),
              ),
            )),
      ]));
}
