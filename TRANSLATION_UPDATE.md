# تحديث الترجمات

## تم إضافة ترجمة جديدة

تم إضافة ترجمة جديدة `end_service_confirmation` في ملفات الترجمة:

### الإنجليزية (app_en.arb):
```json
"end_service_confirmation": "Are you sure you want to end this service?"
```

### العربية (app_ar.arb):
```json
"end_service_confirmation": "هل أنت متأكد من إنهاء هذه الخدمة؟"
```

### الكردية (app_ku.arb):
```json
"end_service_confirmation": "دڵنیای لە کۆتایی هێنانی ئەم خزمەتگوزارییە؟"
```

## لتوليد الترجمات:

بعد إضافة الترجمات الجديدة، يجب تشغيل الأمر التالي لتوليد ملفات الترجمة:

```bash
flutter gen-l10n
```

أو

```bash
dart run intl_utils:generate
```

## بعد التوليد:

يمكن استخدام الترجمة الجديدة في الكود:

```dart
AppLocalizations.of(context)!.end_service_confirmation
```

## ملاحظة:

حالياً يتم استخدام النص الإنجليزي مباشرة في الكود حتى يتم توليد الترجمات الجديدة.




