import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financial Goal Tracker',
      home: FinancialGoalDetailScreen(),
    );
  }
}

class FinancialGoalDetailScreen extends StatefulWidget {
  @override
  _FinancialGoalDetailScreenState createState() =>
      _FinancialGoalDetailScreenState();
}

class _FinancialGoalDetailScreenState extends State<FinancialGoalDetailScreen> {
  // Variables for goal details
  double _targetAmount = 100000;
  double _totalAmountSaved = 25000;
  double _progressPercentage = 0.25;
  DateTime _expectedCompletionDate = DateTime(2023, 12, 31);

  // Contribution history
  List<Map<String, dynamic>> _contributionHistory = [
    {'date': DateTime(2022, 1, 1), 'amount': 5000},
    {'date': DateTime(2022, 2, 1), 'amount': 3000},
    {'date': DateTime(2022, 3, 1), 'amount': 2000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financial Goal Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Goal progress
            Text(
              'Goal Progress',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 200,
              height: 200,
              child: CircularProgressIndicator(
                value: _progressPercentage,
              ),
            ),
            SizedBox(height: 24),
            // Goal details
            Text(
              'Goal Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text('Total Amount Saved: $_totalAmountSaved'),
            Text('Target Amount: $_targetAmount'),
            Text('Expected Completion Date: $_expectedCompletionDate'),
            SizedBox(height: 24),
            // Contribution history
            Text(
              'Contribution History',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _contributionHistory.length,
              itemBuilder: (context, index) {
                final contribution = _contributionHistory[index];
                return ListTile(
                  leading: Text(contribution['date'].toString()),
                  title: Text('Amount: ${contribution['amount']}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}