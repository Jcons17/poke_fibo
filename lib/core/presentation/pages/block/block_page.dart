import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/core/app_routes.gr.dart';
import '../../../application/bloc/bloc.dart';

@RoutePage()
class BlockPage extends StatelessWidget {
  const BlockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.itWasUsedLocalAuth) {
            context.router.replace(MainRoute());
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                "To make more secure your data, you need to make a local auth.",
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().localAuth(false);
              },
              child: SizedBox(
                width: 200,
                child: Center(
                  child: Text(
                    "Continue",
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().localAuth(true);
              },
              child: SizedBox(
                width: 200,
                child: Center(
                  child: Text(
                    "Continue without security",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
