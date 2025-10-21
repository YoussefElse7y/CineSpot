// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get locale_language => 'ar';

  @override
  String get native_language => 'العربية';

  @override
  String get appTitle => 'سين سبوت';

  @override
  String get welcome => 'مرحباً';

  @override
  String hello(String name) {
    return 'مرحباً، $name!';
  }

  @override
  String get lets_you_in => 'دعنا ندخلك';

  @override
  String get settings => 'الإعدادات';

  @override
  String get language => 'اللغة';

  @override
  String get theme => 'السمة';

  @override
  String get lightTheme => 'الوضع الفاتح';

  @override
  String get darkTheme => 'الوضع الداكن';

  @override
  String get systemTheme => 'سمة النظام';

  @override
  String get editProfile => 'تعديل الملف الشخصي';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get help => 'مساعدة';

  @override
  String get download => 'Download';

  @override
  String get about => 'حول';

  @override
  String get security => 'الأمان';

  @override
  String get english => 'الإنجليزية';

  @override
  String get arabic => 'العربية';

  @override
  String get french => 'الفرنسية';

  @override
  String get myList => 'قائمتي';

  @override
  String get explore => 'استكشاف';

  @override
  String get downloads => 'التنزيلات';

  @override
  String get joinPremium => 'اشترك في بريميوم';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get termsOfService => 'شروط الخدمة';

  @override
  String get helpCenter => 'مركز المساعدة';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get topMoviesThisWeek => 'أفضل الأفلام هذا الأسبوع';

  @override
  String get topTvShowsThisWeek => 'أفضل المسلسلات هذا الأسبوع';

  @override
  String get popularMovies => 'الأفلام الشائعة';

  @override
  String get popularTvShows => 'المسلسلات الشائعة';

  @override
  String get trendingMovies => 'الأفلام الرائجة';

  @override
  String get trendingTvShows => 'المسلسلات الرائجة';

  @override
  String get topRatedMovies => 'الأفلام الأعلى تقييماً';

  @override
  String get nowPlaying => 'يعرض الآن';

  @override
  String get upcoming => 'قريباً';

  @override
  String get topRatedTvShows => 'المسلسلات الأعلى تقييماً';

  @override
  String get movies => 'أفلام';

  @override
  String get tvShows => 'مسلسلات';

  @override
  String get search => 'بحث';

  @override
  String get movie => 'فيلم';

  @override
  String get tvShow => 'مسلسل';

  @override
  String get movieDetails => 'تفاصيل الفيلم';

  @override
  String get tvShowDetails => 'تفاصيل المسلسل';

  @override
  String get play => 'تشغيل';

  @override
  String get seeAll => 'عرض الكل';

  @override
  String get home => 'الرئيسية';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get logoutConfirmation => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';

  @override
  String get save => 'حفظ';

  @override
  String get cancel => 'إلغاء';

  @override
  String get confirm => 'تأكيد';

  @override
  String get delete => 'حذف';

  @override
  String get suggested => 'مقترَح';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عناصر',
      one: 'عنصر واحد',
      zero: 'لا توجد عناصر',
    );
    return '$_temp0';
  }

  @override
  String get continue_with_facebook => 'المتابعة باستخدام فيسبوك';

  @override
  String get continue_with_google => 'المتابعة باستخدام جوجل';

  @override
  String get continue_with_apple => 'المتابعة باستخدام أبل';
}
