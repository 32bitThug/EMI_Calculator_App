part of 'calculate_interest_bloc.dart';

abstract class CalculateInstallmentState {
  final double loanAmount;
  final double interest;
  final double tenure;
  CalculateInstallmentState({
    required this.loanAmount,
    required this.interest,
    required this.tenure,
  });
}

class CalculateInterestInitial extends CalculateInstallmentState {
  CalculateInterestInitial({
    required super.loanAmount,
    required super.interest,
    required super.tenure,
  });
}
