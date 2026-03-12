import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';
import '../bloc/dashboard_bloc.dart';
import '../../../../core/service_locator.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DashboardBloc>()..loadStats(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text("BillWiz Dashboard", 
            style: TextStyle(fontWeight: FontWeight.bold)),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
        ),
        body: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            
            if (state is DashboardLoaded) {
              return RefreshIndicator(
                onRefresh: () async => context.read<DashboardBloc>().loadStats(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildTopStats(state.stats),
                      const SizedBox(height: 20),
                      _buildSalesChart(context, state.stats.weeklySales),
                      const SizedBox(height: 20),
                      // Ab hum category list ki jagah simple warning card dikhayenge
                      _buildStockWarning(context, state.stats.lowStockCount),
                      const SizedBox(height: 80), 
                    ],
                  ),
                ),
              );
            }
            
            if (state is DashboardError) {
              return Center(child: Text(state.message));
            }

            return const Center(child: Text("Data load nahi ho saka"));
          },
        ),
      ),
    );
  }

  Widget _buildTopStats(stats) {
    return Row(
      children: [
        _statCard("Total Sales", "Rs. ${stats.totalSales}", Icons.payments, Colors.green),
        const SizedBox(width: 12),
        _statCard("Low Stock", "${stats.lowStockCount}", Icons.inventory_2, Colors.orange),
      ],
    );
  }

  Widget _statCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
            Text(value, style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold, 
                color: color
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesChart(BuildContext context, List<double> data) {
    return Container(
      height: 250,
      padding: const EdgeInsets.fromLTRB(10, 20, 20, 10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Weekly Sales Report", 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: data.asMap().entries
                        .map((e) => FlSpot(e.key.toDouble(), e.value))
                        .toList(),
                    isCurved: true,
                    color: Theme.of(context).primaryColor,
                    barWidth: 4,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true, 
                      color: Theme.of(context).primaryColor.withOpacity(0.1)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStockWarning(BuildContext context, int lowStockCount) {
    if (lowStockCount == 0) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.red.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 30),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Inventory Alert", 
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                Text("There are $lowStockCount items running low on stock.", 
                  style: TextStyle(color: Colors.red.withOpacity(0.8), fontSize: 13)),
              ],
            ),
          ),
          TextButton(
            onPressed: () => context.push('/products'), 
            child: const Text("View"),
          )
        ],
      ),
    );
  }
}