import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/core.dart';
import 'package:gap/gap.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  "Welcome to PokeFibo",
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
                      "Email",
                    ),
                    hintText: "Put your email",
                  ),
                  keyboardType: TextInputType.emailAddress,
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
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Login,",
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text("You don't have an account?"),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: context.theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
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
