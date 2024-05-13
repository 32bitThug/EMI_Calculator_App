import 'package:emi_calculator/ui/widgets/interest_widget.dart';
import 'package:emi_calculator/ui/widgets/loan_amount_widget.dart';
import 'package:emi_calculator/ui/widgets/pie_chart.dart';
import 'package:emi_calculator/ui/widgets/tenure_widget.dart';
import 'package:flutter/material.dart';

import 'package:emi_calculator/ui/screens/results_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Loan EMI Calculator'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            LoanAmount(),
            Tenure(),
            Interest(),
            MyPieChart(),
            Results(),
          ],
        ),
      ),
    );
  }
}
