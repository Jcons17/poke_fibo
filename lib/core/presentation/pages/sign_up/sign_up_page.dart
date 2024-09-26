import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpBloc(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.userSession.value != null) {
              context.router.replace(MainRoute());
              return;
            }

            if (state.userSession.errored) {
              Fluttertoast.showToast(
                msg: state.userSession.exception.toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red.shade300,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            }
          },
          child: Builder(
            builder: (context) {
              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Assets.images.ash.image(height: 100),
                          Gap(16),
                          Text(
                            "Signup",
                            style: context.theme.textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextFormField(
                              onChanged: (value) {
                                context.read<SignUpBloc>().setEmail(value);
                              },
                              decoration: InputDecoration(
                                label: Text(
                                  "Email",
                                ),
                                hintText: "Put your email",
                              ),
                              keyboardType: TextInputType.text,
                            ),
                            Gap(16),
                            TextFormField(
                              onChanged: (value) {
                                context.read<SignUpBloc>().setName(value);
                              },
                              decoration: InputDecoration(
                                label: Text(
                                  "Name",
                                ),
                                hintText: "Put your full name",
                              ),
                              keyboardType: TextInputType.text,
                            ),
                            Gap(16),
                            TextFormField(
                              onChanged: (value) {
                                context.read<SignUpBloc>().setCode(value);
                              },
                              decoration: InputDecoration(
                                label: Text(
                                  "Code",
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              maxLength: 6,
                              maxLines: 1,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                            ),
                            Spacer(),
                            BlocBuilder<SignUpBloc, SignUpState>(
                              builder: (context, state) {
                                return AbsorbPointer(
                                  absorbing: state.user == null,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.read<AuthBloc>().signUp(state.user!);
                                    },
                                    child: Text(
                                      "Sign up",
                                    ),
                                  ),
                                );
                              },
                            ),
                            Gap(32),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
