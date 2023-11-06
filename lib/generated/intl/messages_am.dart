// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'am';

  static String m0(count) =>
      "${Intl.plural(count, one: 'Կոճակ', other: 'Կոճակ')}";

  static String m1(count) =>
      "${Intl.plural(count, one: 'Գույն', other: 'Գույներ')}";

  static String m2(count) =>
      "${Intl.plural(count, one: 'Երկխոսություն', other: 'Երկխոսություններ')}";

  static String m3(value) => "Այս դաշտի արժեքը պետք է հավասար լինի ${value}.";

  static String m4(count) =>
      "${Intl.plural(count, one: 'Ընդլայնումը', other: 'Ընդլայնումներ')}";

  static String m5(count) =>
      "${Intl.plural(count, one: 'Ձև', other: 'Ձևաթղթեր')}";

  static String m6(max) => "Արժեքը պետք է լինի փոքր կամ հավասար ${max}";

  static String m7(maxLength) =>
      "Արժեքը պետք է ունենա փոքր կամ հավասար երկարություն ${maxLength}";

  static String m8(min) => "Արժեքը պետք է լինի ավելի մեծ կամ հավասար ${min}.";

  static String m9(minLength) =>
      "Արժեքը պետք է ունենա ավելի մեծ կամ հավասար երկարություն ${minLength}";

  static String m10(count) =>
      "${Intl.plural(count, one: 'Նոր Պատվեր', other: 'Նոր Պատվերներ')}";

  static String m11(count) =>
      "${Intl.plural(count, one: 'Նոր օգտատեր', other: 'Նոր օգտվողներ')}";

  static String m12(value) => "Այս դաշտի արժեքը չպետք է հավասար լինի ${value}.";

  static String m13(count) =>
      "${Intl.plural(count, one: 'Էջ', other: 'Էջեր')}";

  static String m14(count) =>
      "${Intl.plural(count, one: 'Սպասող խնդիր', other: 'Սպասող հարցեր')}";

  static String m15(count) =>
      "${Intl.plural(count, one: 'Վերջին պատվերը', other: 'Վերջին պատվերներ')}";

  static String m16(count) =>
      "${Intl.plural(count, one: 'UI տարր', other: 'UI տարրեր')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "account": MessageLookupByLibrary.simpleMessage("Հաշիվ"),
    "adminPortalLogin":
    MessageLookupByLibrary.simpleMessage("Մուտք գործել ձեր հաշիվ:"),
    "appTitle": MessageLookupByLibrary.simpleMessage("Housenet-ի ադմին"),
    "backToLogin": MessageLookupByLibrary.simpleMessage("Վերադարձ դեպի Մուտք"),
    "buttonEmphasis":
    MessageLookupByLibrary.simpleMessage("Կոճակի շեշտադրում"),
    "buttons": m0,
    "cancel": MessageLookupByLibrary.simpleMessage("Չեղարկել"),
    "closeNavigationMenu":
    MessageLookupByLibrary.simpleMessage("Փակել նավիգացիոն ընտրացանկը"),
    "colorPalette": MessageLookupByLibrary.simpleMessage("Գունավոր գունապնակ"),
    "colorScheme": MessageLookupByLibrary.simpleMessage("Գունային սխեման"),
    "colors": m1,
    "confirmDeleteRecord":
    MessageLookupByLibrary.simpleMessage("Հաստատե՞լ ջնջել այս գրառումը:"),
    "confirmSubmitRecord":
    MessageLookupByLibrary.simpleMessage("Հաստատե՞լ այս գրառումը ներկայացնելը:"),
    "copy": MessageLookupByLibrary.simpleMessage("Պատճենել"),
    "creditCardErrorText": MessageLookupByLibrary.simpleMessage(
        "Այս դաշտը պահանջում է վավեր վարկային քարտի համար:"),
    "crudBack": MessageLookupByLibrary.simpleMessage("Հետ"),
    "crudDelete": MessageLookupByLibrary.simpleMessage("Ջնջել"),
    "crudDetail": MessageLookupByLibrary.simpleMessage("Մանրամասն"),
    "crudNew": MessageLookupByLibrary.simpleMessage("Նոր"),
    "darkTheme": MessageLookupByLibrary.simpleMessage("Մութ ռեժիմ"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Որոնել ծառայությունը"),
    "dateStringErrorText": MessageLookupByLibrary.simpleMessage(
        "Այս դաշտը պահանջում է վավեր ամսաթվի տող:"),
    "dialogs": m2,
    "dontHaveAnAccount":
    MessageLookupByLibrary.simpleMessage("Չունե՞ք հաշիվ:"),
    "email": MessageLookupByLibrary.simpleMessage("էլ.փոստ"),
    "emailErrorText": MessageLookupByLibrary.simpleMessage(
        "Այս դաշտը պահանջում է վավեր էլփոստի հասցե:"),
    "equalErrorText": m3,
    "error404": MessageLookupByLibrary.simpleMessage("Error 404"),
    "error404Message": MessageLookupByLibrary.simpleMessage(
        "Ներեցեք, ձեր որոնած էջը հեռացվել է կամ գոյություն չունի:"),
    "error404Title": MessageLookupByLibrary.simpleMessage("Էջը չի գտնվել"),
    "example": MessageLookupByLibrary.simpleMessage("Օրինակ"),
    "extensions": m4,
    "forms": m5,
    "generalUi": MessageLookupByLibrary.simpleMessage("Ընդհանուր UI"),
    "hi": MessageLookupByLibrary.simpleMessage("Ողջու՜յն"),
    "homePage": MessageLookupByLibrary.simpleMessage("Գլխաոր"),
    "iframeDemo": MessageLookupByLibrary.simpleMessage("IFrame Demo"),
    "integerErrorText": MessageLookupByLibrary.simpleMessage(
        "Այս դաշտը պահանջում է վավեր ամբողջ թիվ:"),
    "ipErrorText": MessageLookupByLibrary.simpleMessage(
        "Այս դաշտը պահանջում է վավեր IP:"),
    "language": MessageLookupByLibrary.simpleMessage("Լեզու"),
    "lightTheme": MessageLookupByLibrary.simpleMessage("Լույսի ռեժիմ"),
    "login": MessageLookupByLibrary.simpleMessage("Մուտք գործել"),
    "loginNow": MessageLookupByLibrary.simpleMessage("Մուտք գործեք հիմա:"),
    "logout": MessageLookupByLibrary.simpleMessage("Դուրս գալ"),
    "loremIpsum": MessageLookupByLibrary.simpleMessage(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
    "matchErrorText": MessageLookupByLibrary.simpleMessage(
        "Արժեքը չի համապատասխանում օրինաչափությանը:"),
    "maxErrorText": m6,
    "maxLengthErrorText": m7,
    "minErrorText": m8,
    "minLengthErrorText": m9,
    "myProfile": MessageLookupByLibrary.simpleMessage("Իմ Հաշիվ"),
    "newOrders": m10,
    "newUsers": m11,
    "notEqualErrorText": m12,
    "numericErrorText":
    MessageLookupByLibrary.simpleMessage("Արժեքը պետք է լինի թվային:"),
    "openInNewTab": MessageLookupByLibrary.simpleMessage("Բացեք նոր ներդիրում"),
    "pages": m13,
    "password": MessageLookupByLibrary.simpleMessage("Գաղտնաբառ"),
    "passwordHelperText":
    MessageLookupByLibrary.simpleMessage("* 6 - 18 նիշ"),
    "passwordNotMatch":
    MessageLookupByLibrary.simpleMessage("Գաղտնաբառը չի համընկնում:"),
    "pendingIssues": m14,
    "recentOrders": m15,
    "recordDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
        "Ձայնագրությունը հաջողությամբ ջնջվեց:"),
    "recordSavedSuccessfully":
    MessageLookupByLibrary.simpleMessage("Ձայնագրությունը հաջողությամբ պահպանվեց:"),
    "recordSubmittedSuccessfully": MessageLookupByLibrary.simpleMessage(
        "Record submitted successfully."),
    "register": MessageLookupByLibrary.simpleMessage("Գրանցվել"),
    "registerANewAccount":
    MessageLookupByLibrary.simpleMessage("Գրանցեք նոր հաշիվ"),
    "registerNow": MessageLookupByLibrary.simpleMessage("Գրանցվիր հիմա!"),
    "requiredErrorText":
    MessageLookupByLibrary.simpleMessage("Այս դաշտը չի կարող դատարկ լինել:"),
    "retypePassword":
    MessageLookupByLibrary.simpleMessage("Կրկին մուտքագրեք գաղտնաբառը"),
    "save": MessageLookupByLibrary.simpleMessage("Պահպանել"),
    "search": MessageLookupByLibrary.simpleMessage("Որոնում"),
    "submit": MessageLookupByLibrary.simpleMessage("Ներկայացնել"),
    "text": MessageLookupByLibrary.simpleMessage("Տեքստ"),
    "textEmphasis": MessageLookupByLibrary.simpleMessage("Տեքստի շեշտադրումs"),
    "textTheme": MessageLookupByLibrary.simpleMessage("Տեքստի ռեժիմ"),
    "todaySales": MessageLookupByLibrary.simpleMessage("Այսօր Վաճառք"),
    "typography": MessageLookupByLibrary.simpleMessage("Տպագրություն"),
    "uiElements": m16,
    "urlErrorText": MessageLookupByLibrary.simpleMessage("Այս դաշտը պահանջում է վավեր URL հասցե:"),
    "username": MessageLookupByLibrary.simpleMessage("Օգտագործողի անունը"),
    "yes": MessageLookupByLibrary.simpleMessage("Այո՛"),
    "sakagin": MessageLookupByLibrary.simpleMessage("Սակագին՛"),
  };
}
