import 'package:bill_wiz/splash_page.dart';
import 'package:go_router/go_router.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart'; 
import '../../features/billing/presentation/pages/home_page.dart';
import '../../features/product/presentation/pages/product_list_page.dart';
import '../../features/product/presentation/pages/add_product_page.dart';
import '../../features/product/presentation/pages/edit_product_page.dart';
import '../../features/shop/presentation/pages/shop_details_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/billing/presentation/pages/scanner_page.dart';
import '../../features/billing/presentation/pages/checkout_page.dart';
import '../../features/product/domain/entities/product.dart';

final router = GoRouter(
  initialLocation: '/', 
  routes: [
    // 1. Splash Page (Startup)
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),

    // 2. Main Dashboard (Splash ke baad yahan land karega)
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const DashboardPage(),
    ),

    // 3. Billing & Transactions
    GoRoute(
      path: '/billing',
      name: 'billing',
      builder: (context, state) => const HomePage(), // Purani home page ab billing page hai
    ),

    GoRoute(
      path: '/scanner',
      name: 'scanner',
      builder: (context, state) => const ScannerPage(),
    ),
    
    GoRoute(
      path: '/checkout',
      name: 'checkout',
      builder: (context, state) => const CheckoutPage(),
    ),

    // 4. Settings & Shop
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsPage(),
    ),
    
    GoRoute(
      path: '/shop',
      name: 'shop',
      builder: (context, state) => const ShopDetailsPage(),
    ),
    
    // 5. Product Management
    GoRoute(
      path: '/products',
      name: 'products',
      builder: (context, state) => const ProductListPage(),
      routes: [
        GoRoute(
          path: 'add',
          name: 'add_product',
          builder: (context, state) => const AddProductPage(),
        ),
        GoRoute(
          path: 'edit/:id',
          name: 'edit_product',
          builder: (context, state) {
            final product = state.extra as Product?;
            if (product == null) {
              return const ProductListPage();
            }
            return EditProductPage(product: product);
          },
        ),
      ],
    ),
  ],
);