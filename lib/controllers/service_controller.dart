import 'package:flutter/material.dart';

// -- External Package 
import 'package:easy_localization/easy_localization.dart';

/// A centralized controller that provides localized service information 
/// based on the current app locale (English or Arabic).
///
/// This class holds data for three different desert camp services:
/// 1. Matrah (Traditional seating setup)
/// 2. Samarah (Cozy fire, coffee, and snacks)
/// 3. M'azib (Full hospitality with dinner)
///
/// Each service includes:
/// - The localized service name with emoji.
/// - A list of included items (localized).
/// - Title and subtitle descriptions for display in the UI.
///
/// Additional helper methods:
/// - `getNumberOfPeople` returns a default number of people based on an index.
/// - `getServiceNameForCart` and `getServiceListItemsForCart` provide service info for cart display.
///
/// Note: `context` must be set before using this controller to ensure correct locale access.

class ServiceController {
  static late BuildContext context;

  // -- 1st Service
  static String get firstServiceName {
    if (context.locale.languageCode == 'en') {
      return '🪑 Matrah';
    } else {
      return '🪑 مطرح';
    }
  }

  static List<String> get firstService {
    if (context.locale.languageCode == 'en') {
      return ['Traditional seating setup', 'Cushions', 'Lighting'];
    } else {
      return ['مفارش', 'مراكي', 'إضاءة'];
    }
  }

  static String get firstServiceTitle {
    if (context.locale.languageCode == 'en') {
      return 'Camp is ready, your comfort comes first.';
    } else {
      return 'فرشنا لك البر ورتّبنا لك الراحة';
    }
  }

  static String get firstServiceSubtitle {
    if (context.locale.languageCode == 'en') {
      return 'We prepare the spot, so you arrive to find everything set and waiting for you';
    } else {
      return 'جلسة برّية مفروشة وجاهزة، مجهّزة بكل اللي تحتاجه للراحة والاستجمام. نجهّز المكان، وتجي تلقى كل شي مرتب بانتظارك.';
    }
  }

  // -- 2nd Service
  static String get secondServiceName {
    if (context.locale.languageCode == 'en') {
      return '🔥 Samrh';
    } else {
      return '🔥 سمّره';
    }
  }

  static List<String> get secondService {
    if (context.locale.languageCode == 'en') {
      return [
        'Traditional seating setup',
        'Cushions',
        'Lighting',
        'Saudi Coffee',
        'Dates',
        'Tea',
        'Nuts',
        'Water',
      ];
    } else {
      return [
        'مفارش',
        'مراكي',
        'إضاءة',
        'قهوة سعودية',
        'شاهي',
        'تمر',
        'مكسرات',
        'مياه',
      ];
    }
  }

  static String get secondServiceTitle {
    if (context.locale.languageCode == 'en') {
      return 'A cozy fire, coffee aroma, and a night under the stars';
    } else {
      return 'سمًره، نار، وقهوة تفوح ريحتها';
    }
  }

  static String get secondServiceSubtitle {
    if (context.locale.languageCode == 'en') {
      return 'Enjoy a cozy desert gathering with fire, Saudi coffee, tea, dates, fruits, water, and a host who cares';
    } else {
      return 'استمتع بجلسة دافئة وسط أجواء البر، مع شبة نار، قهوة سعودية، شاهي، تمر، فواكه ومياه.يخدمك مضيف متخصص يهتم بكل تفاصيل الضيافة لتقضي وقتًا ممتعًا دون أي عناء.';
    }
  }

  // -- 3rd Service

  static String get thirdServiceName {
    if (context.locale.languageCode == 'en') {
      return '🍽️ Mazib';
    } else {
      return '🍽️ معزّب';
    }
  }

  static List<String> get thirdService {
    if (context.locale.languageCode == 'en') {
      return [
        'Traditional seating setup',
        'Cushions',
        'Lighting',
        'Saudi Coffee',
        'Dates',
        'Tea',
        'Nuts',
        'Dinner',
        'Authentic Saudi Dishes',
        'Fruits',
        'Water',
      ];
    } else {
      return [
        'مفارش',
        'مراكي',
        'إضاءة',
        'قهوة سعودية',
        'شاهي',
        'تمر',
        'مكسرات',
        'اكلات شعبيه',
        'عشاء',
        'فواكه',
        'مياه',
      ];
    }
  }

  static String get thirdServiceTitle {
    if (context.locale.languageCode == 'en') {
      return 'Heartwarming hospitality from first spark to last bite';
    } else {
      return 'ضيافة تشرح الصدر، ونخدمك من أول جمره لآخر لقمه';
    }
  }

  static String get thirdSubtitle {
    if (context.locale.languageCode == 'en') {
      return 'Full hospitality: cozy setup, fire, authentic coffee, and lamb mandi served professionally. We handle everything for your comfort';
    } else {
      return 'خدمة ضيافة متكاملة… تبدأ من استقبال ضيوفك بجلسة مرتّبة، ونار مشتعلة، وقهوة على أصولها، وتنتهي بوليمة مندي لحم تُجهّز وتُقدَّم بكل احترافية. خدمه المعزّب يهتم بكل التفاصيل – من الطبخ حتى التقديم – علشان تعيش أجواء البر من دون أي عناء';
    }
  }

  // Getting number of people 
  static int getNumberOfPeople({required int index}) {
    switch (index) {
      case 0:
        return 5;

      case 1:
        return 10;

      case 2:
        return 15;

      default:
        return 20;
    }
  }


  // Deternime which service 

  static String getServiceNameForCart({required int index}){

    switch (index) {
      case 0:
        return ServiceController.firstServiceName;
      case 1: 
        return ServiceController.secondServiceName;
      default:
        return ServiceController.thirdServiceName;
    }
  }

    static List<String> getServiceListItemsForCart({required int index}){

    switch (index) {
      case 0:
        return ServiceController.firstService;
      case 1: 
        return ServiceController.secondService;
      default:
        return ServiceController.thirdService;
    }
  }

}
