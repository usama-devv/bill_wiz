import 'package:hive/hive.dart';
import '../../domain/entities/dashboard_stats.dart';

class DashboardRepository {
  static const String productBoxName = 'products'; 

  DashboardStats getDashboardData() {
    try {
      // Box safety check
      final Box box = Hive.box(productBoxName);
      
      // Product list nikali (Type cast ki zaroorat nahi agar masla ho)
      final List products = box.values.toList();

      // 1. Low Stock Calculation
      int lowStockCount = products.where((p) => (p.stock ?? 0) < 5).length;

      // 2. Sales Data (Static for now)
      double totalSales = 2540.0; 
      List<double> weeklySales = [1200, 1500, 800, 2200, 1900, 3000, 2500];

      return DashboardStats(
        totalSales: totalSales,
        lowStockCount: lowStockCount,
        weeklySales: weeklySales,
      );
    } catch (e) {
      return DashboardStats(
        totalSales: 0.0,
        lowStockCount: 0,
        weeklySales: List.filled(7, 0.0),
      );
    }
  }
}