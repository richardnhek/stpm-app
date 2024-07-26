import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'km'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? kmText = '',
  }) =>
      [enText, kmText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'qbbm0we8': {
      'en': 'សម្តេចមហាបវរធិបតី ហ៊ុន ម៉ាណែត',
      'km': 'សម្តេចមហាបវរធិបតី ហ៊ុន ម៉ាណែត',
    },
    '3gidbe6l': {
      'en': 'នាយករដ្ឋមន្ត្រី នៃព្រះរាជាណាចក្រកម្ពុជា',
      'km': 'នាយករដ្ឋមន្ត្រី នៃព្រះរាជាណាចក្រកម្ពុជា',
    },
    'vzttds5r': {
      'en': 'Search latest news, announcements....',
      'km': 'ស្វែងរកព័ត៌មានថ្មីៗ សេចក្តីប្រកាស....',
    },
    'm5x8qyie': {
      'en': 'Announcements',
      'km': 'សេចក្តីប្រកាស',
    },
    '4a82si37': {
      'en': 'Other Events',
      'km': 'ព្រឹត្តិការណ៍ផ្សេងៗ',
    },
    'wras4997': {
      'en': 'Announcements',
      'km': 'សេចក្តីប្រកាស',
    },
    'kb2oilf2': {
      'en': 'Events',
      'km': 'ព្រឹត្តិការណ៍',
    },
    'na343fpe': {
      'en': 'Home',
      'km': 'Home',
    },
  },
  // LoginPage
  {
    'pijuhek1': {
      'en': 'EN',
      'km': 'EN',
    },
    '41wiu1t2': {
      'en': 'KH',
      'km': 'KH',
    },
    'hzo8fapw': {
      'en': 'សម្តេចមហាបវរធិបតី ហ៊ុន ម៉ាណែត',
      'km': 'សម្តេចមហាបវរធិបតី ហ៊ុន ម៉ាណែត',
    },
    'fzik6dkq': {
      'en': 'នាយករដ្ឋមន្ត្រី នៃព្រះរាជាណាចក្រកម្ពុជា',
      'km': 'នាយករដ្ឋមន្ត្រី នៃព្រះរាជាណាចក្រកម្ពុជា',
    },
    'cau522dr': {
      'en': 'Email',
      'km': 'អ៊ីមែល',
    },
    'n5fhgibo': {
      'en': 'Password',
      'km': 'ពាក្យសម្ងាត់',
    },
    '7ql55x8s': {
      'en': 'Sign in with email',
      'km': 'ចូលដោយប្រើអ៊ីមែល',
    },
    'd6x5wzwk': {
      'en': 'Create Account',
      'km': 'បង្កើតគណនី',
    },
    'qaed6y4n': {
      'en': 'Or',
      'km': 'ឬ',
    },
    'kss7goon': {
      'en': 'Sign in with Apple',
      'km': 'ចូលជាមួយ Apple',
    },
    'jz5ybf2z': {
      'en': 'Sign in with Phone',
      'km': 'ចូលដោយប្រើទូរស័ព្ទ',
    },
    'smzn6utj': {
      'en': 'Sign in with Google',
      'km': 'ចូលជាមួយ Google',
    },
    '2z75k1ri': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // CreateAccountPage
  {
    'xuig66dr': {
      'en': 'EN',
      'km': 'EN',
    },
    'm9fs4njk': {
      'en': 'KH',
      'km': 'KH',
    },
    '3y2havyn': {
      'en': 'សម្តេចមហាបវរធិបតី ហ៊ុន ម៉ាណែត',
      'km': 'មហាសេនាបតី ហ៊ុន ម៉ាណែត',
    },
    'euixrek9': {
      'en': 'នាយករដ្ឋមន្ត្រី នៃព្រះរាជាណាចក្រកម្ពុជា',
      'km': 'នាយករដ្ឋមន្ត្រីនៃព្រះរាជាណាចក្រកម្ពុជា។',
    },
    'uvrr8gkj': {
      'en': 'Email',
      'km': 'អ៊ីមែល',
    },
    'yz2c6qyp': {
      'en': 'Password',
      'km': 'ពាក្យសម្ងាត់',
    },
    'j4oe5jdi': {
      'en': 'Confirm Password',
      'km': 'បញ្ជាក់ពាក្យសម្ងាត់',
    },
    'tzpqj9kq': {
      'en': 'Create Account',
      'km': 'បង្កើតគណនី',
    },
    's8xwehzo': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
    },
    '04qe3met': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
    },
    'sgml0ozk': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
    },
    'kfodyyoi': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
    },
    'ka6s5q4x': {
      'en': 'Field is required',
      'km': 'វាលត្រូវបានទាមទារ',
    },
    'hafs2nsy': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើសមួយពីបញ្ជីទម្លាក់ចុះ',
    },
    'oijf8zsm': {
      'en': 'Enter your PIN below',
      'km': 'បញ្ចូលកូដ PIN របស់អ្នកខាងក្រោម',
    },
    'vsjvitmq': {
      'en': 'Your project has been created, now invite your team to continue.',
      'km':
          'គម្រោងរបស់អ្នកត្រូវបានបង្កើត ឥឡូវនេះសូមអញ្ជើញក្រុមរបស់អ្នកឱ្យបន្ត។',
    },
    '1ytyvtq5': {
      'en': 'Back',
      'km': 'ត្រឡប់មកវិញ',
    },
    'lz1uwwa6': {
      'en': 'Verify Code',
      'km': 'ផ្ទៀងផ្ទាត់លេខកូដ',
    },
    'aatniabc': {
      'en': 'Already have an account?',
      'km': 'មានគណនីរួចហើយ?',
    },
    'ia7wb0ss': {
      'en': 'Or',
      'km': 'ឬ',
    },
    'ps45ynra': {
      'en': 'Sign in with Email',
      'km': 'ចូលដោយប្រើអ៊ីមែល',
    },
    'jz5ybf2z': {
      'en': 'Sign in with Google',
      'km': 'ចូលដោយប្រើទូរស័ព្ទ',
    },
    'kbgzcbaz': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // SettingsPage
  {
    'qnh4mxsg': {
      'en': 'My Account Information',
      'km': 'ព័ត៌មានគណនីរបស់ខ្ញុំ',
    },
    'a5e8vw6p': {
      'en': 'Change Phone Number',
      'km': 'ផ្លាស់ប្តូរពាក្យសម្ងាត់',
    },
    'skwziew6': {
      'en': 'Edit Profile',
      'km': 'កែសម្រួលព័ត៌មាន',
    },
    '2sr519o5': {
      'en': 'Language',
      'km': 'ភាសា',
    },
    't8c3lmh6': {
      'en': 'Support',
      'km': 'គាំទ្រ',
    },
    '6ticp4dj': {
      'en': 'Tutorial',
      'km': 'ការបង្រៀន',
    },
    'qf9q3rjq': {
      'en': 'Submit a Bug',
      'km': 'ដាក់ស្នើកំហុស',
    },
    '2o1pqc8s': {
      'en': 'Submit a Feature Request',
      'km': 'ដាក់ស្នើសំណើលក្ខណៈពិសេស',
    },
    '658eg0py': {
      'en': 'Log Out',
      'km': 'ចាកចេញ',
    },
    'tuqv72uu': {
      'en': 'My Account Information',
      'km': 'ព័ត៌មានគណនីរបស់ខ្ញុំ',
    },
    'a27x97t9': {
      'en': 'Change Password',
      'km': 'ផ្លាស់ប្តូរពាក្យសម្ងាត់',
    },
    'h7qv0hh1': {
      'en': 'Edit Profile',
      'km': 'កែសម្រួលប្រវត្តិរូប',
    },
    'zxugobqm': {
      'en': 'Language',
      'km': 'ភាសា',
    },
    'hnroy7ma': {
      'en': 'English',
      'km': 'ភាសាអង់គ្លេស',
    },
    'stzjuf11': {
      'en': 'English',
      'km': 'ភាសាអង់គ្លេស',
    },
    '7d1b5wd0': {
      'en': 'Khmer',
      'km': 'ខ្មែរ',
    },
    '8pwf9bhi': {
      'en': 'Search for an item...',
      'km': 'ស្វែងរកធាតុ...',
    },
    'ygfm51og': {
      'en': 'Support',
      'km': 'គាំទ្រ',
    },
    'm4ortvr8': {
      'en': 'Tutorial',
      'km': 'ការបង្រៀន',
    },
    'mt7fetl9': {
      'en': 'Submit a Bug',
      'km': 'ដាក់ស្នើកំហុស',
    },
    'ae75bouh': {
      'en': 'Submit a Feature Request',
      'km': 'ដាក់ស្នើសំណើលក្ខណៈពិសេស',
    },
    'lpi9yock': {
      'en': 'Log Out',
      'km': 'ចាកចេញ',
    },
    '1w5klsv2': {
      'en': 'My Profile',
      'km': 'ព័ត៌មានរបស់ខ្ញុំ',
    },
    '5zepnghm': {
      'en': 'Account',
      'km': 'Account',
    },
  },
  // VideoPage
  {
    'omye96le': {
      'en': 'Videos',
      'km': 'វីដេអូ',
    },
    'yqh7eu9o': {
      'en': 'Search latest videos....',
      'km': 'ស្វែងរកវីដេអូថ្មីៗ....',
    },
    'l3oz3r0k': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // PhotosPage
  {
    'kwj0h8a2': {
      'en': 'Photos',
      'km': 'រូបថត',
    },
    'mu0cl2se': {
      'en': 'Search latest photos....',
      'km': 'ស្វែងរករូបថតថ្មីៗ....',
    },
    'gieca2ot': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // TelegramPage
  {
    '46u5e4gg': {
      'en': 'Telegram',
      'km': 'តេឡេក្រាម',
    },
  },
  // NewsDetail
  {
    'p0mzvwkc': {
      'en': 'Featured News',
      'km': 'ព័ត៌មានពិសេស',
    },
    '0zqz51jm': {
      'en': 'Follow Us:',
      'km': 'បណ្តាញសង្គម',
    },
    '5kg744pm': {
      'en': 'View On STPM Website',
      'km': 'មើលនៅលើគេហទំព័រ STPM',
    },
    '3wv8pinb': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // LiveStreamPage
  {
    '5x6y3igi': {
      'en': 'Livestream',
      'km': 'ផ្សាយ​ផ្ទាល់',
    },
    'n033e8sh': {
      'en': 'Follow Us',
      'km': 'តាមដាន​ពួក​យើង',
    },
    'slzmwis5': {
      'en': 'Contact',
      'km': 'ទំនាក់ទំនង',
    },
    'gwwup8zj': {
      'en': 'info@co-army.com',
      'km': 'info@co-army.com',
    },
    'kf52dc1j': {
      'en':
          'No SD0001 Street 2004 Ta Nguon 1 Village Sangkat Kakab 1 Khan Pur Senchey 120912 Phnom Penh',
      'km':
          ' SD0001 ផ្លូវ 2004 ភូមិ តាងួន 1 សង្កាត់ កាកាប 1 ខណ្ឌ ពោធិ៍សែនជ័យ 120912 ភ្នំពេញ',
    },
    '66pkn06c': {
      'en': 'LiveStream',
      'km': 'LiveStream',
    },
  },
  // SocialPageDup
  {
    'yo30etsl': {
      'en': 'Social',
      'km': 'បណ្តាយសង្គម',
    },
    'ct35ynnv': {
      'en':
          'I\'m back with a super quick Instagram redesign just for the fan. Rounded corners and cute icons, what else do we need, haha.⁣ ',
      'km': '',
    },
    'svqa8a57': {
      'en': 'Social',
      'km': 'បណ្តាយសង្គម',
    },
  },
  // MediaPage
  {
    '0vj0jcjq': {
      'en': 'Media',
      'km': 'ប្រព័ន្ធផ្សព្វផ្សាយ',
    },
    '4enhkil9': {
      'en': 'Search latest videos or photos....',
      'km': 'ស្វែងរកវីដេអូ ឬរូបថតចុងក្រោយបង្អស់....',
    },
    'bsjhuygv': {
      'en': 'Videos',
      'km': 'វីដេអូ',
    },
    'y5ynozhu': {
      'en': 'Photos',
      'km': 'រូបថត',
    },
    'ckpiu1dm': {
      'en': 'Media',
      'km': 'Media',
    },
  },
  // PublicProfile
  {
    's7i78yby': {
      'en': 'Page Title',
      'km': 'ចំណងជើងទំព័រ',
    },
    'vnhgiyto': {
      'en': 'Page Details',
      'km': 'ព័ត៌មានលម្អិតទំព័រ',
    },
    'jyxfvudz': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // postDetail_Page
  {
    '7cf8dqh3': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // createPost
  {
    'bkvng1qz': {
      'en': 'Create Post',
      'km': 'បង្កើតមាតិការ',
    },
    '03w46axj': {
      'en': 'Create Post',
      'km': 'បង្កើតមាតិការ',
    },
    'n0xdw1pv': {
      'en': 'Please upload an image or video',
      'km': 'សូមរើសរូប​ ឬ​ វីដេអូ',
    },
    'zlkt765f': {
      'en': 'Add image or video here.',
      'km': 'បន្ថែមរូបភាព ឬវីដេអូនៅទីនេះ',
    },
    'w6ph1wq8': {
      'en': 'Put your Title and Description Below',
      'km': 'ដាក់ចំណងជើង និងការពិពណ៌នាពីមាតិការរបស់អ្នកខាងក្រោម',
    },
    'rhcnnmb7': {
      'en': 'Title',
      'km': 'ចំណងជើង',
    },
    '05ypksyy': {
      'en': 'Post Description...',
      'km': 'ការ​ពិពណ៌នា...',
    },
    'zy2avtgp': {
      'en': '',
      'km': '',
    },
    'mlionn6k': {
      'en': 'Create Post',
      'km': 'បង្កើតមាតិការ',
    },
    '8hsa4ex6': {
      'en': 'Create Post',
      'km': '',
    },
    '4ge0ii4t': {
      'en': 'Please upload an image or video',
      'km': '',
    },
    'nokuyvhf': {
      'en': 'Put your Title and Description Below',
      'km': '',
    },
    'ya58dio1': {
      'en': 'Title',
      'km': '',
    },
    'm72d18wb': {
      'en': 'Post Description...',
      'km': '',
    },
    'c29e4gkm': {
      'en': '',
      'km': '',
    },
    'ujch2q3p': {
      'en': 'Update Post',
      'km': '',
    },
    'tqvfxqc0': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // SuccessfulCreatePost
  {
    'enurud4v': {
      'en': 'Congrats!',
      'km': 'អបអរសាទរ!',
    },
    'yc5hrsmr': {
      'en': 'You have Successfully Create a Post',
      'km': 'អ្នកបានបង្កើតមាតិការដោយជោគជ័យ',
    },
    'd1yrkf6v': {
      'en': 'GO HOME',
      'km': 'ទៅទំព័រដើម',
    },
    '27gju19p': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // SocialPage
  {
    'fo1bettm': {
      'en': 'Social',
      'km': 'បណ្ដាញសង្គម',
    },
    'koys8cif': {
      'en': 'Social',
      'km': 'Social',
    },
  },
  // EditProfileRefine
  {
    'pijuhek1': {
      'en': 'EN',
      'km': 'EN',
    },
    '41wiu1t2': {
      'en': 'KH',
      'km': 'KH',
    },
    'culvlakq': {
      'en': 'សម្តេចមហាបវរធិបតី ហ៊ុន ម៉ាណែត',
      'km': 'សម្តេចមហាបវរធិបតី ហ៊ុន ម៉ាណែត',
    },
    'ebu8h5mo': {
      'en': 'នាយករដ្ឋមន្ត្រី នៃព្រះរាជាណាចក្រកម្ពុជា',
      'km': 'នាយករដ្ឋមន្ត្រី នៃព្រះរាជាណាចក្រកម្ពុជា',
    },
    'yevpstiy': {
      'en': 'First Name',
      'km': 'ឈ្មោះដំបូង',
    },
    'kw32ho6n': {
      'en': '',
      'km': '',
    },
    '0dyqnupf': {
      'en': 'Last Name',
      'km': 'នាមត្រកូល',
    },
    'izunwefu': {
      'en': '',
      'km': '',
    },
    '4l56y2s2': {
      'en': 'Display Name',
      'km': 'ឈ្មោះបង្ហាញ',
    },
    '7mjxsj38': {
      'en': 'Bio',
      'km': 'ជីវប្រវត្តិ',
    },
    'ftcmc4lx': {
      'en': '',
      'km': '',
    },
    'xvovrst6': {
      'en': 'Complete Setup',
      'km': 'បញ្ចប់ការដូរ',
    },
    'usny6es8': {
      'en': '__',
      'km': '__',
    },
  },
  // PhoneAuthPage
  {
    'pijuhek1': {
      'en': 'EN',
      'km': 'EN',
    },
    '41wiu1t2': {
      'en': 'KH',
      'km': 'KH',
    },
    '3emzc1sd': {
      'en': 'សម្តេចមហាបវរធិបតី ហ៊ុន ម៉ាណែត',
      'km': 'សម្តេចមហាបវរធិបតី ហ៊ុន ម៉ាណែត',
    },
    'kbi62bzl': {
      'en': 'នាយករដ្ឋមន្ត្រី នៃព្រះរាជាណាចក្រកម្ពុជា',
      'km': 'នាយករដ្ឋមន្ត្រី នៃព្រះរាជាណាចក្រកម្ពុជា',
    },
    'wkbc9vf0': {
      'en': '',
      'km': '',
    },
    '38wnk1hn': {
      'en': 'Phone Number',
      'km': 'លេខទូរសព្ទ',
    },
    'l2akuzfr': {
      'en': 'Field is required',
      'km': 'ត្រូវបំពេញចន្លោះ',
    },
    'ho0x7o17': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
    },
    '2k73k1vo': {
      'en': 'Field is required',
      'km': '',
    },
    'ppvfz6kr': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
    },
    'lewmpbes': {
      'en': 'Field is required',
      'km': '',
    },
    'zazgodk6': {
      'en': 'Please choose an option from the dropdown',
      'km': '',
    },
    'x4ci03qz': {
      'en': 'Send Code',
      'km': 'ផ្ញើលេខកូដ',
    },
    'trco3e8k': {
      'en': 'or',
      'km': 'ឬ',
    },
    'yb4t819r': {
      'en': 'Or',
      'km': '',
    },
    '5fhvhmdj': {
      'en': 'Sign in with email',
      'km': 'ចូលដោយប្រើអ៊ីមែល',
    },
    'jz5ybf2z': {
      'en': 'Sign in with Google',
      'km': 'ចូលដោយប្រើទូរស័ព្ទ',
    },
    '2z75k1ri': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // EmailVerification
  {
    'pijuhek1': {
      'en': 'EN',
      'km': 'EN',
    },
    '41wiu1t2': {
      'en': 'KH',
      'km': 'KH',
    },
    'culvlakq': {
      'en': 'សម្តេចមហាបវរធិបតី ហ៊ុន ម៉ាណែត',
      'km': 'សម្តេចមហាបវរធិបតី ហ៊ុន ម៉ាណែត',
    },
    'ebu8h5mo': {
      'en': 'នាយករដ្ឋមន្ត្រី នៃព្រះរាជាណាចក្រកម្ពុជា',
      'km': 'នាយករដ្ឋមន្ត្រី នៃព្រះរាជាណាចក្រកម្ពុជា',
    },
    'oijf8zsm': {
      'en': 'Enter your PIN below',
      'km': 'បញ្ចូលកូដ PIN របស់អ្នកខាងក្រោម',
    },
    'vsjvitmq': {
      'en': 'Your project has been created, now invite your team to continue.',
      'km':
          'គម្រោងរបស់អ្នកត្រូវបានបង្កើត ឥឡូវនេះសូមអញ្ជើញក្រុមរបស់អ្នកឱ្យបន្ត។',
    },
    'dybipwmt': {
      'en': 'Back',
      'km': 'បោះបង់',
    },
    'lz1uwwa6': {
      'en': 'Verify Code',
      'km': 'ផ្ទៀងផ្ទាត់លេខកូដ',
    },
    '2z75k1ri': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // LiveStreamPageRefine
  {
    '5r5p2t8w': {
      'en': 'Livestream',
      'km': '',
    },
    'n033e8sh': {
      'en': 'Follow Us',
      'km': 'តាមដាន​ពួក​យើង',
    },
    'slzmwis5': {
      'en': 'Contact',
      'km': 'ទំនាក់ទំនង',
    },
    'gwwup8zj': {
      'en': 'info@co-army.com',
      'km': 'info@co-army.com',
    },
    'kf52dc1j': {
      'en':
          'No SD0001 Street 2004 Ta Nguon 1 Village Sangkat Kakab 1 Khan Pur Senchey 120912 Phnom Penh',
      'km':
          ' SD0001 ផ្លូវ 2004 ភូមិ តាងួន 1 សង្កាត់ កាកាប 1 ខណ្ឌ ពោធិ៍សែនជ័យ 120912 ភ្នំពេញ',
    },
    '2z75k1ri': {
      'en': 'Home',
      'km': 'ទំព័រដើម',
    },
  },
  // postDetails_Base
  {
    'br07o48n': {
      'en': 'Comments',
      'km': 'មតិយោបល់',
    },
    'xr4jv28y': {
      'en': 'Posted',
      'km': 'មាតិការ',
    },
    'x0y9de9g': {
      'en': 'Posted',
      'km': '',
    },
    '7s3vqv0l': {
      'en': 'Comment here...',
      'km': 'បញ្ចេញមតិនៅទីនេះ...',
    },
    'nybe04xd': {
      'en': 'Post',
      'km': 'បង្ហោះ',
    },
    'xz6qjy8b': {
      'en': 'Please fill in the comment...',
      'km': 'សូមបំពេញមតិ...',
    },
    'akgsnrdr': {
      'en': 'Please choose an option from the dropdown',
      'km': 'សូមជ្រើសរើសជម្រើស',
    },
  },
  // Emptylist
  {
    'bqzife00': {
      'en': 'No Comment',
      'km': 'មិន​មាន​ការបញ្ចែញមតិ',
    },
    'xh8unh2m': {
      'en': 'It seems that you don\'t have any recent comments.',
      'km': 'ដូចជាគ្មានអ្នកមាន​ការបញ្ចែញមតិទេ',
    },
  },
  // PublicProfileComponents
  {
    '22i1r919': {
      'en': 'Posts',
      'km': 'បង្ហោះ',
    },
    'esez1oq5': {
      'en': 'Followers',
      'km': 'អ្នកដើរតាម',
    },
    'rbdden3r': {
      'en': 'Following',
      'km': 'អ្នកកំពុងតាម',
    },
    'ox8n47vb': {
      'en': 'Follow',
      'km': 'តាមដាន',
    },
    'jpekzoka': {
      'en': 'Unfollow',
      'km': 'ឈប់តាមដាន',
    },
  },
  // EmptyNewsComponent
  {
    '7mf5p7i3': {
      'en': 'No News',
      'km': 'គ្មានព័ត៌មាន',
    },
    'r4yx7ale': {
      'en': 'It seems that there is no news',
      'km': 'វា​​ដូច​ជា​មិន​មាន​ដំណឹង​ព័ត៌មាន',
    },
  },
  // OtpConfirm
  {
    'sfgcdo9x': {
      'en': 'Enter your PIN below',
      'km': 'បញ្ចូលកូដ PIN របស់អ្នកខាងក្រោម',
    },
    'z09q0tsk': {
      'en': 'Your project has been created, now invite your team to continue.',
      'km':
          'គម្រោងរបស់អ្នកត្រូវបានបង្កើតឡើង ឥឡូវនេះសូមអញ្ជើញក្រុមរបស់អ្នកឱ្យបន្ត។',
    },
    'rc6b20pr': {
      'en': 'Cancel',
      'km': 'បោះបង់',
    },
    'mm7u234h': {
      'en': 'Verify Code',
      'km': 'ផ្ទៀងផ្ទាត់លេខកូដ',
    },
  },
  // OTPConfirmDialog
  {
    'oijf8zsm': {
      'en': 'Enter your PIN below',
      'km': 'បញ្ចូលកូដ PIN របស់អ្នកខាងក្រោម',
    },
    'dybipwmt': {
      'en': 'Cancel',
      'km': 'បោះបង់',
    },
    'lz1uwwa6': {
      'en': 'Verify Code',
      'km': 'ផ្ទៀងផ្ទាត់លេខកូដ',
    },
  },
  // VerifyByEmail
  {
    'oijf8zsm': {
      'en': 'Enter your PIN below',
      'km': 'បញ្ចូលកូដ PIN របស់អ្នកខាងក្រោម',
    },
    'vsjvitmq': {
      'en': 'Your project has been created, now invite your team to continue.',
      'km':
          'គម្រោងរបស់អ្នកត្រូវបានបង្កើត ឥឡូវនេះសូមអញ្ជើញក្រុមរបស់អ្នកឱ្យបន្ត។',
    },
    'dybipwmt': {
      'en': 'Cancel',
      'km': 'បោះបង់',
    },
    'lz1uwwa6': {
      'en': 'Verify Code',
      'km': 'ផ្ទៀងផ្ទាត់លេខកូដ',
    },
  },
  // MoreAboutPost
  {
    'xzn98mo1': {
      'en': 'Options',
      'km': '',
    },
    '42spf4t1': {
      'en': 'Edit',
      'km': '',
    },
    '7svav97o': {
      'en': 'Share',
      'km': '',
    },
    'lfdxx21u': {
      'en': 'Delete',
      'km': '',
    },
  },
  // Miscellaneous
  {
    'ghdaagw7': {
      'en': '',
      'km': '',
    },
    '79m0rbds': {
      'en': '',
      'km': '',
    },
    'qaie7knb': {
      'en': '',
      'km': '',
    },
    'v6wcsdou': {
      'en': '',
      'km': '',
    },
    'cl3vor0c': {
      'en': '',
      'km': '',
    },
    'cqcyvb7i': {
      'en': '',
      'km': '',
    },
    'vxj3cf8z': {
      'en': '',
      'km': '',
    },
    't1ujhzt8': {
      'en': '',
      'km': '',
    },
    'tna9aqph': {
      'en': '',
      'km': '',
    },
    'd7mm7oul': {
      'en': '',
      'km': '',
    },
    'n1my7iyj': {
      'en': '',
      'km': '',
    },
    '7shp2pr3': {
      'en': '',
      'km': '',
    },
    'f4s0mlqp': {
      'en': '',
      'km': '',
    },
    'zng60iag': {
      'en': '',
      'km': '',
    },
    'oc17e7c5': {
      'en': '',
      'km': '',
    },
    '3dpfvlr1': {
      'en': '',
      'km': '',
    },
    'q4q6l9xz': {
      'en': '',
      'km': '',
    },
    'e4llg2ht': {
      'en': '',
      'km': '',
    },
    'k2z8xggk': {
      'en': '',
      'km': '',
    },
    'axvn7vhy': {
      'en': '',
      'km': '',
    },
    '8gl2jx7f': {
      'en': '',
      'km': '',
    },
    'owtkpgb7': {
      'en': '',
      'km': '',
    },
    'whvyvhv9': {
      'en': '',
      'km': '',
    },
    'm6ji4g5n': {
      'en': '',
      'km': '',
    },
    '2zy1lxb0': {
      'en': '',
      'km': '',
    },
    'mzuq2c78': {
      'en': '',
      'km': '',
    },
    'xhavavkp': {
      'en': '',
      'km': '',
    },
    'u0tg4kz2': {
      'en': '',
      'km': '',
    },
  },
].reduce((a, b) => a..addAll(b));
