import 'package:flutter/material.dart';
import 'package:foodhub/models/order_model.dart';
import 'package:foodhub/views/rider/provider/rider_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final riderProvider = Provider.of<RiderProvider>(context, listen: false);
    final Color primaryColor = Colors.deepOrange;
    final Color accentColor = Colors.deepOrange;
    final Color cardColor = Colors.white;
    final Size size = MediaQuery.of(context).size;
    final double baseFont = size.width * 0.04;

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7FA),
        body: StreamBuilder<List<OrderModel>>(
          stream: riderProvider.listenCompletedOrders(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.deepOrange),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error: ${snapshot.error}',
                      style: GoogleFonts.poppins(color: Colors.red),
                    ),
                  ],
                ),
              );
            }

            final orders = snapshot.data ?? [];
            final riderId = riderProvider.riderId;

            double allTimeEarnings = 0;
            double monthlyEarnings = 0;
            final now = DateTime.now();
            final currentMonth = now.month;
            final currentYear = now.year;

            for (var order in orders) {
              if (order.status == OrderStatus.delivered) {
                // Get bid amount for this rider from the order's bids map
                double amount = 0;
                if (order.bids != null && order.bids!.containsKey(riderId)) {
                  final bidData = order.bids![riderId] as Map<String, dynamic>;
                  amount = (bidData['amount'] as num?)?.toDouble() ?? 0.0;
                }

                allTimeEarnings += amount;

                // Check monthly earnings
                if (order.completedAt != null) {
                  if (order.completedAt!.month == currentMonth &&
                      order.completedAt!.year == currentYear) {
                    monthlyEarnings += amount;
                  }
                }
              }
            }

            return SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // All-Time Earnings Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepOrange, Colors.orangeAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "All-Time Earnings",
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: baseFont * 0.8,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "\$${allTimeEarnings.toStringAsFixed(2)}",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: baseFont * 2.1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Monthly Earnings Card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${DateFormat('MMMM').format(now)} Earnings",
                                style: GoogleFonts.poppins(
                                  color: Colors.grey[600],
                                  fontSize: baseFont * 0.8,
                                ),
                              ),
                              Text(
                                "\$${monthlyEarnings.toStringAsFixed(2)}",
                                style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontSize: baseFont * 1.2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.trending_up,
                              color: primaryColor,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Recent Payouts Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Recent Payouts",
                      style: GoogleFonts.poppins(
                        fontSize: baseFont,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Orders List
                  orders.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.account_balance_wallet_outlined,
                                  size: 64,
                                  color: Colors.grey[300],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "No earnings yet",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey[500],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: orders.length,
                            itemBuilder: (context, index) {
                              final order = orders[index];
                              double amount = 0;
                              if (order.bids != null &&
                                  order.bids!.containsKey(riderId)) {
                                final bidData =
                                    order.bids![riderId]
                                        as Map<String, dynamic>;
                                amount =
                                    (bidData['amount'] as num?)?.toDouble() ??
                                    0.0;
                              }

                              final dateStr = order.completedAt != null
                                  ? DateFormat(
                                      'dd MMM, yyyy',
                                    ).format(order.completedAt!)
                                  : 'N/A';

                              return Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: cardColor,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.04),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.1),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: primaryColor.withOpacity(
                                              0.1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.delivery_dining,
                                            color: primaryColor,
                                            size: 24,
                                          ),
                                        ),
                                        const SizedBox(width: 14),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Order #${order.id.substring(0, 8)}",
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: baseFont * 0.9,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            Text(
                                              "Delivered • $dateStr",
                                              style: GoogleFonts.poppins(
                                                color: Colors.grey[600],
                                                fontSize: baseFont * 0.7,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "+\$${amount.toStringAsFixed(2)}",
                                      style: GoogleFonts.poppins(
                                        color: Colors.green[600],
                                        fontSize: baseFont * 0.95,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
