import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultsWidget extends StatefulWidget {
  final String title;
  final int value;
  final bool? flag;
  const ResultsWidget(
      {super.key, required this.title, required this.value, this.flag});

  @override
  State<ResultsWidget> createState() => _ResultsWidgetState();
}

class _ResultsWidgetState extends State<ResultsWidget> {
  // get title => null;

  @override
  Widget build(BuildContext context) {
    final formattedValue = NumberFormat('##,##,##0').format(widget.value);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Transform.translate(
                  offset: const Offset(4, -2),
                  child: Text(
                    '₹ ',
                    style: widget.flag == true
                        ? const TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.bold)
                        : const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                  ),
                ),
              ),
              TextSpan(
                text: formattedValue,
                style: widget.flag == true
                    ? const TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)
                    : const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
