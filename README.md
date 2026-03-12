# 🛒 Bill Wiz - Professional POS App

**Bill Wiz** is a high-performance, professional Point of Sale (POS) application built with Flutter. It is designed for small to medium-sized retail businesses, featuring lightning-fast barcode scanning, thermal printing, and offline-first data management.

---

## 🚀 Key Features

* 🔍 **Smart Barcode Scanner:** Integrated `mobile_scanner` for rapid product entry and billing.
* 🖨️ **Thermal Printer Support:** Connect to Bluetooth thermal printers to print professional receipts.
* 📦 **Inventory Management:** Track stock levels, prices, and product details efficiently.
* 💾 **Offline-First (Hive):** Uses Hive NoSQL database for ultra-fast local storage. Works 100% offline.
* 🏷️ **Shop Branding:** Configure shop name, address, phone number, and UPI ID for personalized invoices.
* 📱 **Premium UX/UI:** Minimalist, pixel-perfect design with haptic feedback.
* 🏗️ **Clean Architecture:** Scalable structure (Data, Domain, Presentation layers).

---

## 🛠️ Tech Stack

| Category                 | Technology                        |
| ------------------------ | --------------------------------- |
| **Framework**            | Flutter                           |
| **State Management**     | Flutter BLoC                      |
| **Local Database**       | Hive                              |
| **Dependency Injection** | GetIt                             |
| **Navigation**           | GoRouter                          |
| **Architecture**         | Clean Architecture (DDD inspired) |
| **UI Components**        | Google Fonts                      |

---

## 🏗️ Project Structure

The project follows the **Clean Architecture** pattern:

```text
lib/
├── core/                     # App-wide constants, themes, utilities
├── data/                     # Models, Data Sources, Repository Implementations
├── domain/                   # Entities, Repository Interfaces, Use Cases
├── presentation/             # BLoC, Pages, Widgets
└── injection_container.dart  # Dependency Injection Setup
```

---

## ⚙️ Getting Started

### Prerequisites

* Flutter SDK (Latest Version)
* Java 17+
* VS Code or Android Studio

---

## 📥 Installation

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/usama-devv/bill_wiz.git
cd bill_wiz
```

### 2️⃣ Install Dependencies

```bash
flutter pub get
```

### 3️⃣ Run Code Generation (Hive & Models)

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4️⃣ Run the App

```bash
flutter run
```

---

## 📜 Permissions Required

* **Camera** – For scanning barcodes
* **Bluetooth** – For connecting to thermal printers
* **Storage** – For saving product and shop data locally

---

## 🤝 Contribution

Contributions are welcome. If you find a bug or want to suggest a feature, please open an issue or submit a pull request.

---

## 📄 License

This project is for personal use and development.
(Add MIT/GPL license if needed.)

---

Developed with ❤️ by **Usama**
