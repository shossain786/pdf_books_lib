// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_books_lib/global/blocs/internet/cubit/internet_cubit.dart';
import 'package:pdf_books_lib/models/error/error_widget.dart';

class NetworkErrorScreen extends StatefulWidget {
  const NetworkErrorScreen({
    super.key,
  });

  @override
  State<NetworkErrorScreen> createState() => _NetworkErrorScreenState();
}

class _NetworkErrorScreenState extends State<NetworkErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      bloc: InternetCubit(),
      listener: (context, state) {
        if (state == InternetState.internetAvailable) {
          Navigator.pushReplacementNamed(context, '/');
        }
      },
      child: const Scaffold(
        body: Center(
          child: NetworkErrorWidget(),
        ),
      ),
    );
  }
}
