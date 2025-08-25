# ميزة تأكيد المبلغ المدفوع

## نظرة عامة
تم إضافة ميزة جديدة لتأكيد المبلغ المدفوع عند إنهاء الخدمة في صفحة الحجوزات. هذه الميزة تسمح للمزود بتأكيد المبلغ النهائي مع إمكانية إضافة تكلفة إضافية.

## الملفات المضافة/المعدلة

### 1. ملفات الترجمة
- `lib/l10n/app_en.arb` - النصوص الإنجليزية
- `lib/l10n/app_ar.arb` - النصوص العربية  
- `lib/l10n/app_ku.arb` - النصوص الكردية

### 2. نافذة تأكيد المبلغ
- `lib/presentation/widgets/payment_confirmation_dialog.dart` - النافذة الجديدة

### 3. صفحة الحجوزات
- `lib/screens/bookings_screen.dart` - تم تحديث منطق إنهاء الخدمة

## النصوص المضافة

### الإنجليزية
```json
{
  "confirm_payment": "Confirm Payment",
  "service_price": "Service Price", 
  "additional_cost": "Additional Cost",
  "total_amount": "Total Amount",
  "enter_additional_cost": "Enter additional cost (optional)",
  "confirm_payment_amount": "Please confirm the payment amount for this service",
  "payment_confirmed": "Payment confirmed successfully"
}
```

### العربية
```json
{
  "confirm_payment": "تأكيد الدفع",
  "service_price": "سعر الخدمة",
  "additional_cost": "تكلفة إضافية", 
  "total_amount": "المبلغ الإجمالي",
  "enter_additional_cost": "أدخل التكلفة الإضافية (اختياري)",
  "confirm_payment_amount": "يرجى تأكيد مبلغ الدفع لهذه الخدمة",
  "payment_confirmed": "تم تأكيد الدفع بنجاح"
}
```

### الكردية
```json
{
  "confirm_payment": "دڵنیاکردنەوەی پارەدان",
  "service_price": "نرخی خزمەتگوزاری",
  "additional_cost": "تێچووی زیادە",
  "total_amount": "کۆی بڕی پارە", 
  "enter_additional_cost": "تێچووی زیادە بنووسە (هەڵبژاردەیی)",
  "confirm_payment_amount": "تکایە بڕی پارەدان بۆ ئەم خزمەتگوزارییە دڵنیابکەوە",
  "payment_confirmed": "پارەدان بە سەرکەوتوویی دڵنیاکرایەوە"
}
```

## كيفية العمل

### 1. تدفق العمل
1. المستخدم يضغط على زر "إنهاء الخدمة" للحجز الذي في حالة "قيد التنفيذ"
2. تظهر نافذة تأكيد إنهاء الخدمة
3. عند الضغط على "مكتمل"، تظهر نافذة تأكيد المبلغ
4. يمكن إضافة تكلفة إضافية (اختياري)
5. يتم عرض المبلغ الإجمالي تلقائياً
6. عند الضغط على "تأكيد"، يتم إغلاق النافذة وعرض رسالة نجاح

### 2. ميزات النافذة
- **عرض معلومات الخدمة**: اسم الخدمة والعميل
- **سعر الخدمة الأصلي**: يعرض السعر المتفق عليه
- **حقل التكلفة الإضافية**: إدخال اختياري لتكلفة إضافية
- **حساب تلقائي**: يتم حساب المبلغ الإجمالي تلقائياً
- **تنسيق العملة**: عرض الأسعار بتنسيق العملة (د.ع)
- **تحقق من المدخلات**: يقبل الأرقام العشرية فقط
- **دعم الوضع المظلم**: يتكيف مع إعدادات الثيم

### 3. التصميم
- تصميم حديث ومتجاوب
- ألوان متناسقة مع باقي التطبيق
- أيقونات واضحة ومعبرة
- تخطيط منطقي وسهل الاستخدام

## الاستخدام التقني

### استدعاء النافذة
```dart
final paymentResult = await PaymentConfirmationDialog.show(
  context,
  servicePrice: booking.price,
  serviceName: booking.service,
  clientName: booking.clientName,
);
```

### معالجة النتيجة
```dart
if (paymentResult != null && paymentResult['confirmed'] == true) {
  final totalAmount = paymentResult['totalAmount'] as double;
  final additionalCost = paymentResult['additionalCost'] as double;
  
  // معالجة النتيجة هنا
}
```

## المخرجات
- `confirmed`: boolean - هل تم التأكيد أم لا
- `servicePrice`: double - سعر الخدمة الأصلي
- `additionalCost`: double - التكلفة الإضافية المدخلة
- `totalAmount`: double - المبلغ الإجمالي

## ملاحظات تقنية
- النافذة لا يمكن إغلاقها بالضغط خارجها (barrierDismissible: false)
- يتم التحقق من صحة المدخلات في الوقت الفعلي
- يدعم الأرقام العشرية حتى منزلتين
- يتم تنظيف الذاكرة تلقائياً عند إغلاق النافذة
- **العملة**: جميع الأسعار معروضة بالدينار العراقي (د.ع)

## التوافق
- يعمل مع جميع اللغات المدعومة (العربية، الإنجليزية، الكردية)
- متوافق مع الوضع المظلم والفاتح
- يعمل على جميع أحجام الشاشات
- يدعم إمكانية الوصول (accessibility)
