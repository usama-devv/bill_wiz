# 🛒 Bill Wiz - Professional POS App

**Bill Wiz** is a high-performance, professional Point of Sale (POS) application built with Flutter. It is designed for small to medium-sized retail businesses, featuring lightning-fast barcode scanning, thermal printing, and offline-first data management.



[Image of Clean Architecture in Flutter]


---

## 🚀 Key Features

* **🔍 Smart Barcode Scanner:** Integrated `mobile_scanner` for rapid product entry and billing.
* **🖨️ Thermal Printer Support:** Seamlessly connect to Bluetooth thermal printers to print professional receipts.
* **📦 Inventory Management:** Track stock levels, prices, and product details with a dedicated management system.
* **💾 Offline-First (Hive):** Uses Hive NoSQL database for ultra-fast local storage. Works 100% offline.
* **🏷️ Shop Branding:** Configure your shop's name, address, phone number, and UPI ID for personalized invoices.
* **📱 Premium UX/UI:** Minimalist, pixel-perfect design with haptic feedback (vibration) for a professional feel.
* **🏗️ Clean Architecture:** Highly scalable and maintainable code structure (Data, Domain, and Presentation layers).

---

## 🛠️ Tech Stack

| Category | Technology |
| :--- | :--- |
| **Framework** | [Flutter](https://flutter.dev) |
| **State Management** | [Flutter BLoC](https://pub.dev/packages/flutter_bloc) |
| **Local Database** | [Hive](https://pub.dev/packages/hive) |
| **Dependency Injection** | [GetIt](https://pub.dev/packages/get_it) |
| **Navigation** | [GoRouter](https://pub.dev/packages/go_router) |
| **Architecture** | Clean Architecture (DDD inspired) |
| **UI Components** | Google Fonts, Tailwind-inspired styling |

---

## 🏗️ Project Structure

The project follows the **Clean Architecture** pattern to ensure independence of layers:

```text
lib/
├── core/               # App-wide constants, themes, and utilities
├── data/               # Models, Data Sources, and Repository Implementations (Hive)
├── domain/             # Entities, Repositories (Interface), and Use Cases
├── presentation/       # BLoC, Pages, and Widgets
└── injection_container.dart # Dependency Injection Setup

⚙️ Getting Started
Prerequisites
Flutter SDK (Latest Version)

Java 17+ (for Android builds)

VS Code or Android Studio

Installation
Clone the repository:

Bash
```
git clone [https://github.com/usama-devv/bill_wiz.git](https://github.com/usama-devv/bill_wiz.git)
```
cd bill_wiz
Install dependencies:

Bash
```
flutter pub get
```
Run Code Generation (for Hive & Models):

Bash
```
flutter pub run build_runner build --delete-conflicting-outputs
```
Run the App:

Bash
```
flutter run
```
📜 Permissions Required
Camera: For scanning barcodes.

Bluetooth: For connecting to thermal printers.

Storage: For saving product and shop data locally.

🤝 Contribution
Contributions are welcome! If you find a bug or want to suggest a feature, please open an issue or submit a pull request.

📄 License
This project is for personal use and development. (Optional: Specify MIT/GPL if needed).

Developed with ❤️ by Usama