import 'package:flutter/material.dart';
import 'package:emi_calculator/widgets/interest_widget.dart';
import 'package:emi_calculator/widgets/loan_amount_widget.dart';
import 'package:emi_calculator/screens/results_screen.dart';
import 'package:emi_calculator/widgets/pie_chart.dart';
import 'package:emi_calculator/widgets/tenure_widget.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController loanAmountController = TextEditingController();

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
