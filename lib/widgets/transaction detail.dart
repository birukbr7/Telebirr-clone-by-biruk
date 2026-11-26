import 'package:flutter/material.dart';

class TransactionRecord {
  final String recipientName;
  final double amount;
  final String time;
  final String transactionNumber;

  TransactionRecord({
    required this.recipientName,
    required this.amount,
    required this.time,
    required this.transactionNumber,
  });
}

class TransactionHistoryNotifier {
  static final ValueNotifier<List<TransactionRecord>> records =
      ValueNotifier<List<TransactionRecord>>([
    TransactionRecord(
      recipientName: 'sanyii',
      amount: 2.00,
      time: '2026/11/26 15:48:11',
      transactionNumber: 'DKQ1OTJJI7',
    ),
  ]);

  static void add(TransactionRecord record) {
    records.value = [record, ...records.value];
  }
}

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({
    super.key,
  });

  void _showHistorySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Transaction Details',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Divider(height: 20),
              ValueListenableBuilder<List<TransactionRecord>>(
                valueListenable: TransactionHistoryNotifier.records,
                builder: (context, transactions, _) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: transactions.length,
                    separatorBuilder: (_, __) => const Divider(height: 16),
                    itemBuilder: (context, index) {
                      final tx = transactions[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Transfer to ${tx.recipientName}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${tx.time} • ${tx.transactionNumber}',
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '-${tx.amount.toStringAsFixed(2)} ETB',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showHistorySheet(context),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Transaction Details',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Color(0xFF008FD5),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            SizedBox(width: 2),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Color(0xFF008FD5),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
