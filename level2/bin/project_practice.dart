import 'dart:io';

void mainSetwManipulator() {
  // تعريف العروض (Widths) كمتغيرات لسهولة التحكم
  const int codeWidth = 9;
  const int nameWidth = 32;
  const int markWidth = 9;

  String line = "---------|--------------------------------|---------|";

  // طباعة الهيدر
  print(line);
  // نستخدم padRight لمحاذاة النص لليسار (مثل الاسم)
  // و padLeft لمحاذاة النص لليمين (مثل الأرقام)
  print(
    " ${"Code".padRight(codeWidth - 1)}| ${"Name".padRight(nameWidth - 1)}| ${"Mark".padRight(markWidth - 1)}|",
  );
  print(line);

  // طباعة البيانات
  print(
    " ${"C101".padRight(codeWidth - 1)}| ${"introduction to Programming 1".padRight(nameWidth - 1)}| ${"95".padRight(markWidth - 1)}|",
  );
  print(
    " ${"C102".padRight(codeWidth - 1)}| ${"Computer Hardware".padRight(nameWidth - 1)}| ${"88".padRight(markWidth - 1)}|",
  );
  print(
    " ${"C1035243".padRight(codeWidth - 1)}| ${"Network".padRight(nameWidth - 1)}| ${"75".padRight(markWidth - 1)}|",
  );

  print(line);
}

void mainFormateString() {
  String name = "Ibrahem Qruea";
  String schoolName = "Programming Advices";

  // 1. طباعة النصوص (String Interpolation)
  // بدلاً من %s، نستخدم الرمز $ مباشرة قبل اسم المتغير
  print("Dear $name, How are you?\n");
  print("Welcome to $schoolName School!\n");

  String c = 'S';

  // 2. ضبط عرض الحرف (Setting the width)
  // في C++ استخدمت %*c، في Dart نستخدم padLeft لعمل الفراغات
  print("Setting the width of c :${c.padLeft(1)}");
  print("Setting the width of c :${c.padLeft(2)}");
  print("Setting the width of c :${c.padLeft(3)}");
  print("Setting the width of c :${c.padLeft(4)}");
  print("Setting the width of c :${c.padLeft(5)}");
}

void mainFormateDouble() {
  double pi = 3.14159265;

  // 1. تحديد عدد الأرقام بعد الفاصلة (Precision specification)
  // في C++ نستخدم %.*f، في Dart نستخدم toStringAsFixed
  print("Precision specification of ${pi.toStringAsFixed(1)}");
  print("Precision specification of ${pi.toStringAsFixed(2)}");
  print("Precision specification of ${pi.toStringAsFixed(3)}");
  print("Precision specification of ${pi.toStringAsFixed(4)}");

  double x = 7.0;
  double y = 9.0;

  // 2. القسمة وتنسيق الناتج
  double result = x / y;
  print(
    "\nThe float division is : ${x.toStringAsFixed(3)} / ${y.toStringAsFixed(3)} = ${result.toStringAsFixed(3)}",
  );

  double d = 12.45;

  // 3. التحكم في طول الـ Double
  print("The double value is : ${d.toStringAsFixed(3)}");
  print("The double value is : ${d.toStringAsFixed(4)}");
}

void mainFormateInt() {
  int page = 1;
  int totalPages = 10;

  // 1. طباعة النصوص والمتغيرات (String Interpolation)
  // نستخدم علامة $ قبل اسم المتغير داخل النص
  print("The page number = $page");
  print("You are in Page $page of $totalPages");

  // 2. تحديد العرض (Width specification) مثل %0*d
  // في دارت نستخدم ميثود .padLeft(العرض, 'الحرف')
  // ملاحظة: padLeft تعمل مع النصوص لذا نحول الرقم لنص أولاً
  print("The page number = ${page.toString().padLeft(2, '0')}");
  print("The page number = ${page.toString().padLeft(3, '0')}");
  print("The page number = ${page.toString().padLeft(4, '0')}");
  print("The page number = ${page.toString().padLeft(5, '0')}");

  int number1 = 20;
  int number2 = 30;

  // 3. العمليات الحسابية داخل النص
  // نستخدم ${ } إذا كنا سنقوم بعملية حسابية أو استدعاء ميثود
  print("The Result of $number1 + $number2 = ${number1 + number2}");
}

void main2DList() {
  // 1. تعريف مصفوفة متداخلة (List of Lists)
  // في دارت لا نحتاج لتحديد الحجم مسبقاً [3][4]، هي مرنة جداً
  List<List<int>> two2DList = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
  ];

  // 2. الطباعة باستخدام الـ Loops التقليدية (كما في C++)
  for (int i = 0; i < two2DList.length; i++) {
    String row = ""; // نجهز نصاً لكل صف
    for (int j = 0; j < two2DList[i].length; j++) {
      row += "${two2DList[i][j]} ";
    }
    print(row);
  }

  print("----------------------");

  // 3. الطريقة "الاحترافية" في Dart (Functional Style)
  // مبرمجو فلاتر يفضلون هذه الطريقة المختصرة جداً
  for (var row in two2DList) {
    print(row.join(" "));
  }
}

void mainVectorDeclaration() {
  // 1. تعريف القائمة (List)
  // في Dart نستخدم [] مباشرة، وهي تعمل عمل الـ Vector (ديناميكية الحجم)
  List<int> vNumbers = [10, 20, 30, 40, 50];

  // 2. الطباعة باستخدام الـ for-in loop (المقابل لـ Ranged Loop)
  print("Numbers Vector = ");
  for (int number in vNumbers) {
    // نستخدم stdout.write للطباعة بجانب بعضها بدون سطر جديد
    // أو نستخدم join كما تعلمنا سابقاً
    print(number);
  }

  // 3. الطريقة الأسرع والأكثر استخداماً في Flutter
  print("Numbers Vector (using join) = ${vNumbers.join(" ")}");
}

void mainVectorAddElements() {
  // 1. تعريف القائمة (List)
  // في C++: vector<int> vNumbers;
  // في Dart:
  List<int> vNumbers = [];

  // 2. إضافة العناصر (Add elements)
  // في C++ نستخدم push_back، في Dart نستخدم add
  vNumbers.add(10);
  vNumbers.add(20);
  vNumbers.add(30);
  vNumbers.add(40);
  vNumbers.add(50);

  print("Numbers List: \n");

  // 3. طباعة العناصر باستخدام for-in loop
  for (int number in vNumbers) {
    print(number);
  }
}

/// remove Element vector

// 1. استخدام Class بدلاً من struct
class Employee {
  String firstName;
  String lastName;
  double salary;

  // Constructor (المنشئ) لتسهيل تعبئة البيانات في سطر واحد
  Employee({
    required this.firstName,
    required this.lastName,
    required this.salary,
  });
}

void mainVectorRemoveElements() {
  // 2. تعريف القائمة (List of Objects)
  List<Employee> vEmployees = [];

  // 3. إضافة العناصر (بشكل مباشر وأكثر نظافة من C++)
  vEmployees.add(
    Employee(firstName: "Ibrahem", lastName: "Qruea", salary: 5000),
  );

  vEmployees.add(Employee(firstName: "Ali", lastName: "Maher", salary: 300));

  vEmployees.add(Employee(firstName: "Aya", lastName: "Omran", salary: 1000));

  print("Employees List: \n");

  // 4. الطباعة باستخدام for-in
  for (var employee in vEmployees) {
    print("FirstName: ${employee.firstName}");
    print("LastName : ${employee.lastName}");
    print("Salary   : ${employee.salary}");
    print("-" * 20); // خط فاصل جميل
  }
}

void mainVectorRemoveLastElement() {
  // 1. تعريف القائمة وإضافة العناصر
  List<int> vNumbers = [10, 20, 30, 40, 50];

  // 2. حذف العناصر من النهاية (pop_back)
  // في Dart نستخدم removeLast()
  vNumbers.removeLast();
  vNumbers.removeLast();
  vNumbers.removeLast();
  vNumbers.removeLast();
  vNumbers.removeLast();

  print("Numbers List: \n");

  // 3. التحقق من حالة القائمة قبل الطباعة
  if (vNumbers.isEmpty) {
    print("The list is empty!");
  } else {
    for (int number in vNumbers) {
      print(number);
    }
  }
}

void mainVectorFirstLastElement() {
  // 1. تعريف القائمة وإضافة العناصر
  List<int> vNumbers = [10, 20, 30, 40, 50];

  // 2. الوصول للعنصر الأول والأخير
  // في C++: front() و back()
  // في Dart: خصائص جاهزة تسمى first و last
  print("First Element: ${vNumbers.first}");
  print("Last Element: ${vNumbers.last}");

  // 3. معرفة عدد العناصر (Size)
  // في C++: size()
  // في Dart: length
  print("Size: ${vNumbers.length}");

  // 4. السعة (Capacity)
  // دارت تدير الذاكرة آلياً، لذا لا نستخدم capacity بشكل يدوي
  // ولكن يمكننا معرفة الحجم المحجوز في الذاكرة عبر مكتبات متقدمة
  // في الاستخدام العادي لـ Flutter، نحن نهتم فقط بـ length.

  // 5. التحقق هل القائمة فارغة (Empty)
  // في C++: empty()
  // في Dart: خصائص قوية جداً: isEmpty و isNotEmpty
  print("Empty: ${vNumbers.isEmpty}");
  print("Is Not Empty: ${vNumbers.isNotEmpty}"); // مريحة جداً في Flutter
}

void mainVectorAccessElements() {
  List<int> num = [1, 2, 3, 4, 5];

  print("\nUsing [] index operator:");
  // الوصول للعناصر في دارت يتم عبر الأقواس المربعة []
  print("Element at Index 0: ${num[0]}");
  print("Element at Index 2: ${num[2]}");
  print("Element at Index 4: ${num[4]}");

  // ملاحظة حول الأمان:
  // في C++ كود num[5] قد يطبع قيمة عشوائية أو ينهار البرنامج (Runtime Error)
  // في Dart إذا حاولت الوصول لـ num[5] سيظهر لك خطأ واضح:
  // RangeError (index): Index out of range

  // طريقة بديلة وآمنة في Dart (بسيطة جداً)
  // استخدام ميثود elementAt
  print("\nUsing .elementAt():");
  print("Element at Index 0: ${num.elementAt(0)}");
}

void mainVectorChangeElements() {
  List<int> num = [10, 20, 30, 40, 50];

  // التعديل التقليدي (كما في C++)
  num[2] = 100; // سيتحول الرقم 30 إلى 100
  print("After simple change: $num");

  // التعديل باستخدام ميثود fillRange (ميزة قوية في دارت)
  // لتغيير مجموعة عناصر دفعة واحدة (من الـ index 0 إلى 2 "غير شامل")
  num.fillRange(0, 2, 0); // سيحول أول عنصرين إلى صفر
  print("After fillRange: $num");

  // استبدال عناصر محددة بقائمة أخرى
  num.replaceRange(2, 4, [77, 88, 99]);
  print("After replaceRange: $num");
}

void mainVectorIterator() {
  ///11111111111111111
  List<int> num = [1, 2, 3, 4, 5];

  // الحصول على الـ iterator
  var iter = num.iterator;

  // في Dart الـ iterator يبدأ قبل أول عنصر، لذا نستخدم moveNext()
  // moveNext تعيد true إذا وجد عنصراً تالياً، وتنتقل إليه
  while (iter.moveNext()) {
    print(iter.current); // iter.current تعادل *iter في C++
  }

  ///22222222222222222 الطريقة المباشرة (for-in)
  // لا حاجة لتعريف Iterator يدوياً
  for (int value in num) {
    print("$value ");
  }

  ///33333333333333333 طريقة الـ Functional (forEach)
  num.forEach((value) => print("$value "));
}

void mainExceptionHandling() {
  List<int> num = [1, 2, 3, 4, 5];

  try {
    // محاولة الوصول لعنصر غير موجود (Index 5)
    print(num[5]);
  }
  // في Dart نستخدم 'on' لتحديد نوع الخطأ المتوقع
  on RangeError {
    print("Out of bound: Index does not exist.");
  }
  // و 'catch' للإمساك بأي خطأ عام آخر
  catch (e) {
    print("An unexpected error occurred: $e");
  }
  // 'finally' اختيارية وتنفذ في كل الأحوال (سواء حدث خطأ أم لا)
  finally {
    print("Execution completed.");
  }
}

void mainStringObjectCommenMethod() {
  String s1 = "My Name is Mohammed Abu-Hadhoud, I Love Programming.";

  // 1. طول النص (Length)
  // في C++: .length() | في Dart: خاصية .length بدون أقواس
  print(s1.length);

  // 2. الوصول لحرف بمكانه
  // في C++: .at(3) | في Dart: نستخدم الأقواس المربعة مباشرة
  print(s1[3]);

  // 3. إضافة نص للنهاية (Append)
  // في Dart نستخدم += أو دالة التجميع
  s1 += " @ProgrammingAdvices";
  print(s1);

  // 4. إدراج نص في مكان محدد (Insert)
  // دارت لا تملك دالة insert مباشرة للنصوص لأن النصوص "غير قابلة للتغيير" (Immutable)
  // لذا نقوم بقص النص ودمجه:
  s1 = s1.substring(0, 7) + " Ali " + s1.substring(7);
  print(s1);

  // 5. جزء من النص (Substring)
  // في C++: substr(البداية, الطول) | في Dart: substring(البداية, النهاية)
  print(s1.substring(16, 24)); // 16+8 = 24

  // 6. إضافة وحذف من النهاية
  s1 = s1 + 'X'; // إضافة
  print(s1);
  s1 = s1.substring(0, s1.length - 1); // حذف آخر حرف
  print(s1);

  // 7. البحث عن نص (Find)
  // في Dart نستخدم contains للبحث المنطقي، أو indexOf لمعرفة المكان
  print(s1.indexOf("Ali")); // سيعيد مكان أول حرف

  // البحث مع تجاهل حالة الأحرف (ali صغيرة)
  if (!s1.contains("ali")) {
    print("ali is not found");
  }

  // 8. مسح النص (Clear)
  s1 = "";
  print("Cleared: '$s1'");
}

void mainStringSomeFunction() {
  String a = 'a';
  String A = 'A';

  // 1. تحويل حالة الأحرف (To Upper/Lower)
  // في Dart نستخدم methods مباشرة على النص
  print("converting a to A: ${a.toUpperCase()}");
  print("converting A to a: ${A.toLowerCase()}");

  // 2. التحقق من حالة الأحرف (isUpper / isLower)
  // دارت لا تملك دالة isupper، لذا نقارن الحرف بنسخته الكبيرة
  print("isupper('A'): ${A == A.toUpperCase()}");
  print("islower('A'): ${A == A.toLowerCase()}");

  // 3. التحقق هل النص رقم (isdigit)
  String digit = '5';
  // الطريقة الأشهر في دارت هي محاولة تحويل النص لرقم
  print("isdigit('5'): ${int.tryParse(digit) != null}");
  print("isdigit('A'): ${int.tryParse(A) != null}");

  // 4. التحقق من الرموز (ispunct)
  // نستخدم الـ Regular Expressions (RegExp) وهي قوية جداً في دارت
  String punct = '!';
  final isPunct = RegExp(
    r'[!\"#$%&'
    r"'()*+,-./:;<=>?@[\]^_`{|}~]",
  );
  print("ispunct('!'): ${isPunct.hasMatch(punct)}");
  print("ispunct('A'): ${isPunct.hasMatch(A)}");
}

void mainWriteDataToFileWritemode() async {
  // 1. إنشاء كائن يمثل الملف
  File myFile = File('MyFile.txt');

  // 2. الكتابة في الملف (Write Mode)
  // في Dart، دالة writeAsString تقوم بفتح الملف، كتابة النص، وإغلاقه تلقائياً
  // استخدام '\n' ينشئ سطراً جديداً تماماً كما في C++
  String content =
      "Hi, this is the first line\n"
      "Hi, this is the second line\n"
      "Hi, this is the third line\n";

  try {
    // نستخدم await لأن التعامل مع الملفات قد يستغرق وقتاً (Asynchronous)
    await myFile.writeAsString(content);
    print("File was written successfully.");
  } catch (e) {
    print("Error occurred: $e");
  }
}

/// Write DataTo File Append Mode
void mainWriteDataToFileAppendMode() async {
  // 1. إنشاء كائن يمثل الملف
  File myFile = File('MyFile.txt');

  // 2. الكتابة في وضع الإضافة (Append Mode)
  // نستخدم mode: FileMode.append للإضافة دون مسح المحتوى القديم
  String newLines =
      "Hi, this is a new line\n"
      "Hi, this is another new line\n";

  try {
    // التحقق من وجود الملف (اختياري لكن احترافي)
    if (await myFile.exists()) {
      await myFile.writeAsString(
        newLines,
        mode: FileMode.append, // هذا هو البديل لـ ios::app
      );
      print("Data appended successfully.");
    } else {
      // إذا لم يكن الملف موجوداً، سيقوم بإنشائه وكتابة النص
      await myFile.writeAsString(newLines);
      print("File created and data written.");
    }
  } catch (e) {
    print("An error occurred: $e");
  }
}

/// Read Data From File

void printFileContentAllLines(String fileName) async {
  File myFile = File(fileName);

  try {
    if (await myFile.exists()) {
      // قراءة كل النص الموجود في الملف مرة واحدة
      String content = await myFile.readAsString();
      print(content);
    } else {
      print("File not found!");
    }
  } catch (e) {
    print("Error: $e");
  }
}

/// Read Data From File Line by Line

// نستخدم async لأن قراءة الملف عملية تستغرق وقتاً
Future<void> printFileContentLineByLine(String fileName) async {
  File myFile = File(fileName);

  try {
    // readAsLines تعيد قائمة (List<String>) حيث كل عنصر هو سطر
    List<String> lines = await myFile.readAsLines();

    // عمل Loop لطباعة كل سطر (مثل while getline)
    for (var line in lines) {
      print(line);
    }
  } catch (e) {
    print("Error reading file: $e");
  }
}

void mainReadFileContent() async {
  printFileContentAllLines("MyFile.txt");
  await printFileContentLineByLine("MyFile.txt");
}

void mainLoadFileContentToVector() async {
  // 1. تحديد اسم الملف
  String fileName = "MyFile.txt";

  // 2. تحميل البيانات من ملف إلى List (المقابل لـ Vector)
  // دالة readAsLines تفتح الملف، تقرأ السطور، تضعها في القائمة، وتغلقه تلقائياً.
  try {
    List<String> vFileContent = await File(fileName).readAsLines();

    // 3. طباعة القائمة باستخدام for-in
    print("File Content in List:");
    for (String line in vFileContent) {
      print(line);
    }
  } catch (e) {
    print("An error occurred: $e");
  }
}

/// Save List to File

Future<void> saveListToFile(String fileName, List<String> fileContent) async {
  try {
    // 1. تصفية القائمة من السطور الفارغة (مثل شرط if Line != "" في كودك)
    // 2. دمج العناصر بفاصل سطر جديد \n ليصبحوا نصاً واحداً
    String content = fileContent.where((line) => line.isNotEmpty).join('\n');

    // 3. كتابة النص بالكامل في الملف
    // إذا أردت إضافة سطر جديد في نهاية الملف تماماً كـ endl
    await File(fileName).writeAsString(content + '\n');

    print("File saved successfully.");
  } catch (e) {
    print("Error saving file: $e");
  }
}

void mainSaveFileContentToVector() async {
  List<String> vFileContent = ["Ali", "Shadi", "Maher", "Fadi", "Lama"];

  await saveListToFile("MyFile.txt", vFileContent);
}

/// Delete File

// 1. دالة القراءة (تحميل البيانات للقائمة)
Future<List<String>> loadDataToListDelet(String fileName) async {
  File file = File(fileName);
  if (await file.exists()) {
    return await file.readAsLines();
  }
  return [];
}

// 2. دالة الحفظ (كتابة القائمة للملف)
Future<void> saveListToFileDelete(String fileName, List<String> content) async {
  // ندمج العناصر بأسطر جديدة ونكتبها مرة واحدة
  await File(
    fileName,
  ).writeAsString(content.join('\n') + (content.isEmpty ? '' : '\n'));
}

// 3. دالة الحذف (المنطق الرئيسي)
Future<void> deleteRecordFromFile(String fileName, String record) async {
  // أ. تحميل البيانات
  List<String> vFileContent = await loadDataToListDelet(fileName);

  // ب. الحذف (في Dart نستخدم removeWhere أو remove مباشرة)
  // هذا السطر يحل محل الـ for loop والـ if (Line == Record) بالكامل
  vFileContent.removeWhere((item) => item == record);

  // ج. حفظ القائمة المحدثة
  await saveListToFileDelete(fileName, vFileContent);
}

// 4. دالة الطباعة
Future<void> printFileContentDelete(String fileName) async {
  File file = File(fileName);
  if (await file.exists()) {
    print(await file.readAsString());
  } else {
    print("File is empty or does not exist.");
  }
}

void mainDeleteFileContent() async {
  String fileName = "MyFile.txt";

  print("File Content Before Delete:");
  await printFileContentDelete(fileName);

  await deleteRecordFromFile(fileName, "Ali");

  print("\nFile Content After Delete:");
  await printFileContentDelete(fileName);
}

/// Update File Conten

// 1. دالة التحميل (نفس الدرس السابق)
Future<List<String>> loadDataToListUpdate(String fileName) async {
  final file = File(fileName);
  return (await file.exists()) ? await file.readAsLines() : [];
}

// 2. دالة الحفظ
Future<void> saveListToFileUpdate(String fileName, List<String> content) async {
  final file = File(fileName);
  // ندمج العناصر بأسطر جديدة
  await file.writeAsString(content.join('\n') + (content.isEmpty ? '' : '\n'));
}

// 3. دالة التحديث (Update Logic)
Future<void> updateRecordInFile(
  String fileName,
  String oldRecord,
  String newRecord,
) async {
  // أ. تحميل البيانات
  List<String> vFileContent = await loadDataToListUpdate(fileName);

  // ب. التحديث باستخدام الخرائط (Map)
  // نقوم بالمرور على كل عنصر، إذا وجدنا القديم نستبدله بالجديد، وإلا نتركه كما هو
  vFileContent = vFileContent.map((line) {
    return (line == oldRecord) ? newRecord : line;
  }).toList();

  // ج. حفظ الملف
  await saveListToFileUpdate(fileName, vFileContent);
}

// 4. دالة الطباعة
Future<void> printFileContentUpdate(String fileName) async {
  final file = File(fileName);
  if (await file.exists()) {
    print(await file.readAsString());
  }
}

void mainUpdateFileContent() async {
  String fileName = "MyFile.txt";

  print("--- Before Update ---");
  await printFileContentUpdate(fileName);

  // تحديث "Ali" إلى "Ali Maher"
  await updateRecordInFile(fileName, "Ali", "Ali Maher");

  print("\n--- After Update ---");
  await printFileContentUpdate(fileName);
}

void mainDateTimeLocalUTCTime() {
  // 1. الحصول على الوقت الحالي (Local Time)
  // في C++: time(0)
  DateTime now = DateTime.now();
  print("Local date and time is: $now");

  // 2. تحويل الوقت إلى التوقيت العالمي (UTC)
  // في C++: gmtime(&t)
  DateTime utc = now.toUtc();
  print("UTC date and time is: $utc");

  // 3. طباعة أجزاء معينة من الوقت (ميزة إضافية)
  print("Year: ${now.year}");
  print("Month: ${now.month}");
  print("Day: ${now.day}");
}

void mainDateTimeStructure() {
  // الحصول على الوقت المحلي الحالي
  DateTime now = DateTime.now();

  print("Year: ${now.year}"); // يعطيك السنة مباشرة (مثلاً 2026)
  print("Month: ${now.month}"); // من 1 إلى 12 (لا حاجة لإضافة 1)
  print("Day: ${now.day}"); // يوم الشهر
  print("Hour: ${now.hour}"); // نظام 24 ساعة
  print("Min: ${now.minute}");
  print("Second: ${now.second}");

  // اليوم في الأسبوع (من 1 "الاثنين" إلى 7 "الأحد")
  // ملاحظة: Dart تتبع معيار ISO 8601 حيث يبدأ الأسبوع بالاثنين
  print("Week Day: ${now.weekday}");

  // لكي تحصل على رقم اليوم في السنة (Year Day)
  // نحسب الفرق بين اليوم الحالي وأول يوم في السنة
  int yearDay = now.difference(DateTime(now.year, 1, 1)).inDays + 1;
  print("Year Day: $yearDay");

  // المنطقة الزمنية والإزاحة (بديل daylight savings)
  print("Time Zone Name: ${now.timeZoneName}");
  print("Time Zone Offset: ${now.timeZoneOffset}");
}

void main() {
  // mainFormateInt();
  // mainFormateDouble();
  //mainFormateString();
  // mainSetwManipulator();
  // main2DList();
  // mainVectorDeclaration();
  // mainVectorAddElements();
  // mainVectorRemoveElements();
  //mainVectorRemoveLastElement();
  // mainVectorFirstLastElement();
  // mainVectorAccessElements();
  // mainVectorChangeElements();
  // mainVectorIterator();
  // mainExceptionHandling();
  // mainStringObjectCommenMethod();
  //mainStringSomeFunction();
  //mainWriteDataToFileWritemode();
  //mainWriteDataToFileAppendMode();
  //mainReadFileContent();
  //mainLoadFileContentToVector();
  //mainSaveFileContentToVector();
  //mainDeleteFileContent();
  // mainUpdateFileContent();
  // mainDateTimeLocalUTCTime();
  //mainDateTimeStructure();
}
