# 📲 Receipt OCR & Warranty Tracker App

A Flutter-based mobile application designed to **scan**, **analyze**, and **organize** purchase receipts. Users can upload an image or PDF of a receipt, and the app extracts key fields using the **Mindee OCR API**. After extraction, the data is displayed in editable form fields, and can be converted into a **QR code** for future use.

---

## 🌟 Features

- 📤 Upload receipt from:
  - Camera
  - Gallery
  - Files (PDF/image)
- 🧠 Extracts data using **Mindee API**:
  - Store Name
  - Receipt Number
  - Total, Net, Tax
  - Phone Number
  - Date & Time
  - Category & Subcategory
- 📝 Pre-filled editable fields using `TextEditingController`
- 🔄 Converts the receipt data into a **QR Code**
- 🌐 **Supports both Arabic and English languages**
- 📂 Keeps track of warranty durations and receipt info

---

## 📦 Packages Used

| Package              | Description                              |
|----------------------|------------------------------------------|
| `image_picker`       | Select image from camera or gallery      |
| `http`               | Send API requests to Mindee              |
| `shimmer`            | Skeleton loaders while loading data      |
| `google_fonts`       | Stylish fonts with `GoogleFonts`         |
| `flutter_svg`        | Render SVG images in UI                  |
| `smooth_page_indicator` | Onboarding indicator UI              |
| `pinput`             | Beautiful PIN input for auth             |
| `easy_localization`  | **Arabic & English** language support    |
| `qr_flutter`         | Generate QR codes from receipt data      |

---

## 🧠 How It Works

1. **Upload Receipt**  
   The user uploads a receipt image or PDF.

2. **OCR Analysis**  
   The file is sent to the **Mindee OCR API**. It returns structured receipt data in JSON format.

3. **Auto-fill Form**  
   The JSON is parsed into a `ReceiptModel`, and values are auto-populated into the `CustomTextFormField`.

4. **QR Code Generation**  
   Extracted data is converted into a string and turned into a **QR code**. This allows the user to re-access receipt details later with ease.

---
## 🛠 Setup
- git clone https://github.com/your-repo/receipt-ocr-app.git
- cd receipt-ocr-app
- flutter pub get
- flutter run
---
## 🗒️ Notes
✅ Works with Arabic receipts (right-to-left) and English

✅ Fully editable fields after scanning

✅ QR code generation for easy retrieval

✅ Multi-language support using easy_localization

❗ Internet connection is required for OCR API
---
## Author
- Name:Wafa Alsibyani
- Github: https://github.com/Wafaa-20/capstone-one.git

