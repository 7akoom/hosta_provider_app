# ترجمة نوافذ Accept و Reject في bookings_screen

## ✅ تم إنجاز الترجمة بنجاح

تم ترجمة النوافذ المنبثقة التي تظهر عند الضغط على زر "Accept" و "Reject" في صفحة `bookings_screen`.

## 🔧 الكود المحدث:

### نافذة Reject:
```dart
final confirmed = await ConfirmationDialog.show(
  context,
  title: AppLocalizations.of(context)!.reject_booking,
  message: AppLocalizations.of(context)!.reject_booking_confirmation,
  confirmText: AppLocalizations.of(context)!.reject,
  confirmColor: const Color(0xFFdc3545),
  icon: Icons.close,
  iconBackground: Colors.red,
);
```

### نافذة Accept:
```dart
final confirmed = await ConfirmationDialog.show(
  context,
  title: AppLocalizations.of(context)!.accept_booking,
  message: AppLocalizations.of(context)!.accept_booking_confirmation,
  confirmText: AppLocalizations.of(context)!.accept,
  confirmColor: const Color(0xFF28a745),
  icon: Icons.check,
  iconBackground: Colors.green,
);
```

## 🧪 للاختبار:

### 1. **تأكد من وجود حجز بحالة `pending`:**
في ملف `bookings_screen.dart`، تأكد من وجود حجز بحالة `BookingStatus.pending`

### 2. **تشغيل التطبيق:**
```bash
flutter run
```

### 3. **الذهاب إلى صفحة الحجوزات:**
- اذهب إلى صفحة الحجوزات
- ابحث عن حجز بحالة "معلق" (Pending)
- ستجد زرين: "Accept" و "Reject"

### 4. **اختبار النوافذ:**
- **اضغط على زر "Reject"** - ستظهر نافذة "Reject Booking"
- **اضغط على زر "Accept"** - ستظهر نافذة "Accept Booking"

## 📱 النتائج المتوقعة:

### نافذة Reject Booking:

#### الإنجليزية:
- العنوان: "Reject Booking"
- الرسالة: "Are you sure you want to reject this booking?"
- زر Cancel: "Cancel"
- زر Reject: "Reject"

#### العربية:
- العنوان: "رفض الحجز"
- الرسالة: "هل أنت متأكد من رفض هذا الحجز؟"
- زر Cancel: "إلغاء"
- زر Reject: "رفض"

#### الكردية:
- العنوان: "ڕەتکردنەوەی پێشوەختەکردن"
- الرسالة: "دڵنیای لە ڕەتکردنەوەی ئەم پێشوەختەکردنە؟"
- زر Cancel: "هەڵوەشاندنەوە"
- زر Reject: "ڕەتکردنەوە"

### نافذة Accept Booking:

#### الإنجليزية:
- العنوان: "Accept Booking"
- الرسالة: "Are you sure you want to accept this booking?"
- زر Cancel: "Cancel"
- زر Accept: "Accept"

#### العربية:
- العنوان: "قبول الحجز"
- الرسالة: "هل أنت متأكد من قبول هذا الحجز؟"
- زر Cancel: "إلغاء"
- زر Accept: "قبول"

#### الكردية:
- العنوان: "وەرگرتنی پێشوەختەکردن"
- الرسالة: "دڵنیای لە وەرگرتنی ئەم پێشوەختەکردنە؟"
- زر Cancel: "هەڵوەشاندنەوە"
- زر Accept: "وەرگرتن"

## 🔍 التفاصيل التقنية:

### الترجمات الجديدة المضافة:
1. **`accept_booking`** - عنوان نافذة قبول الحجز
2. **`reject_booking`** - عنوان نافذة رفض الحجز
3. **`accept_booking_confirmation`** - رسالة تأكيد قبول الحجز
4. **`reject_booking_confirmation`** - رسالة تأكيد رفض الحجز

### الترجمات المستخدمة مسبقاً:
1. **`accept`** - زر القبول
2. **`reject`** - زر الرفض
3. **`cancel`** - زر الإلغاء (يتم قراءته تلقائياً من `ConfirmationDialog`)

### الملفات المحدثة:
- ✅ `lib/l10n/app_en.arb` - الترجمة الإنجليزية
- ✅ `lib/l10n/app_ar.arb` - الترجمة العربية
- ✅ `lib/l10n/app_ku.arb` - الترجمة الكردية
- ✅ `lib/screens/bookings_screen.dart` - الكود المحدث
- ✅ `lib/generated/app_localizations_*.dart` - ملفات الترجمة المولدة

## 🎉 النتيجة النهائية:

الآن نوافذ "Accept Booking" و "Reject Booking" في صفحة الحجوزات ستظهر مترجمة بالكامل حسب اللغة المحددة في التطبيق!




