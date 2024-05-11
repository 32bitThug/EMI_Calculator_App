import 'package:flutter_bloc/flutter_bloc.dart';

part 'calculate_interest_event.dart';
part 'calculate_interest_state.dart';

class CalculateInterestBloc
    extends Bloc<CalculateInterestEvent, CalculateInterestState> {
  CalculateInterestBloc()
      : super(CalculateInterestInitial(
            loanAmount: 2500000, interest: 8.75, tenure: 30)) {
    on<CalculateInterestEvent>((event, emit) {
      if (event is LoanAmountUpdated) {
        emit(CalculateInterestInitial(
            loanAmount: event.loanAmount,
            interest: state.interest,
            tenure: state.tenure));
      } else if (event is InterestUpdated) {
        emit(CalculateInterestInitial(
            loanAmount: state.loanAmount,
            interest: event.interest,
            tenure: state.tenure));
      } else if (event is TenureUpdated) {
        emit(CalculateInterestInitial(
            loanAmount: state.loanAmount,
            interest: state.interest,
            tenure: event.tenure));
      }
    });
  }
}
