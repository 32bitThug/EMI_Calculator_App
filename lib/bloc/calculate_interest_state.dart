part of 'calculate_interest_bloc.dart';

abstract class CalculateInterestState {
  final double loanAmount;
  final double interest;
  final double tenure;
  CalculateInterestState({required this.loanAmount, required this.interest,required this.tenure});
}

class CalculateInterestInitial extends CalculateInterestState {
  CalculateInterestInitial(
      {required super.loanAmount, required super.interest,required super.tenure});
}
