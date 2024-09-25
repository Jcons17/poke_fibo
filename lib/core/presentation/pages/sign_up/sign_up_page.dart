import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/core.dart';
import 'package:gap/gap.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0, bottom: 32),
            child: Column(
              children: [
                Text(
                  "Signup",
                  style: context.theme.textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    label: Text(
                      "First Name",
                    ),
                    hintText: "Put your first name",
                  ),
                  keyboardType: TextInputType.text,
                ),
                Gap(16),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text(
                      "Last name",
                    ),
                    hintText: "Put your last name",
                  ),
                  keyboardType: TextInputType.text,
                ),
                Gap(16),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text(
                      "Password",
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                Gap(16),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text(
                      "Confirm your password",
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Sign up",
                  ),
                ),
                Gap(32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
