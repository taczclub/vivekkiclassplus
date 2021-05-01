import 'package:flutter/material.dart';

class Plan extends StatelessWidget {
  final String activeDate;
  final String expiredDate;
  final String months;
  final String amount;
  final bool expired;

  Plan({
    @required this.activeDate,
    @required this.expiredDate,
    @required this.months,
    @required this.amount,
    @required this.expired,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            color: Colors.grey[400],
            child: Text(
              expired ? 'Expired Plan' : 'Active Plan',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        'No. of Months Plan: ${this.months} Months',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        'Total amount payed: ${this.amount}',
                        style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        'Active Date: ${this.activeDate}',
                        style: TextStyle(fontSize: 17, color: Colors.grey[700]),
                      ),
                    ),
                    Text(
                      'Expired Date: ${this.expiredDate}',
                      style: TextStyle(fontSize: 17, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
