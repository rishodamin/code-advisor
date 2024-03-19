import 'package:highlight/languages/python.dart';
import 'package:highlight/languages/javascript.dart';
import 'package:highlight/languages/java.dart';

class EditorLanguage {
  static final languageMode = {
    'Python': python,
    'Javascript': javascript,
    'Java': java,
  };
  static final initialCode = {
    'Python': '#Write your code here..',
    'Javascript': '//Write your code here..',
    'Java':
        'public class Main\n{\n\tpublic static void main(String[] args) {\n\t\tSystem.out.println("Hello World");\n\t}\n}\n'
  };
}
