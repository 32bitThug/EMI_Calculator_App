// import 'package:emi_calculator/bloc/loan_amount_bloc.dart';
import 'package:emi_calculator/bloc/calculate_interest_bloc.dart';
import 'package:emi_calculator/screens/home_screen.dart';
// import 'package:emi_calculator/theme/theme_data.dart'
// ;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => CalculateInterestBloc())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
