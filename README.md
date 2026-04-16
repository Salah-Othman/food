# Food App

# Folder Structure

lib/
├── core/                         # الحاجات المشتركة اللي بتخدم على المشروع كله
│   ├── network/                  # DioFactory, ApiService, Interceptors
│   ├── theme/                    # AppColors, AppTheme (Light/Dark), TextStyles
│   ├── utils/                    # Constants, Helpers, Validations
│   ├── routing/                  # AppRouter, Routes names
│   ├── di/                       # Service Locator (GetIt)
│   └── common_widgets/           # الـ Widgets اللي بتكرر (CustomButton, CustomTextField)
│
├── features/                     # كل "ميزة" في التطبيق ليها الفولدر بتاعها
│   ├── onboarding/               # شاشات البداية
│   ├── auth/                     # الـ Login والـ Register
│   ├── home/                     # المنيو الرئيسي
│   │   ├── data/                 # الـ Models والـ Data Sources والـ Repos
│   │   ├── logic/                # الـ Cubits والـ States
│   │   └── ui/                   # الـ Screens والـ Widgets الخاصة بالهوم
│   ├── food_details/             # تفاصيل الأكلة
│   ├── cart/                     # سلة التسوق
│   ├── location_picker/          # الخريطة وتحديد الموقع
│   ├── payment/                  # الدفع (اختيار الوسيلة + إضافة كارت)
│   ├── order_tracking/           # تتبع الأوردر (الخريطة والـ Stepper)
│   └── profile/                  # الملف الشخصي والإعدادات
│
├── generated/                    # الصور والـ Assets (لو بتستخدم flutter_gen)
└── main.dart                     # نقطة الانطلاق