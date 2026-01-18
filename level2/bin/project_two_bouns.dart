import 'dart:io';

import 'package:level2/level2.dart';

enum EnQuestionsLevel { easyLevel, medLevel, hardLevel, mix }

enum EnOperationsType { add, sub, mul, div, mixOp }

class ClsQuestion {
  int number1 = 0;
  int number2 = 0;
  EnQuestionsLevel? questionsLevel;
  EnOperationsType? operationsType;
  int correctAnswer = 0;
  int playerAnswer = 0;
  bool answerResult = false;
}

class ClsQuiz {
  List<ClsQuestion>? questionList;
  int? numberOfQuestions;
  EnQuestionsLevel? questionsLevel;
  EnOperationsType? opType;
  int numberOfWrongAnswers = 0;
  int numberOfRightAnswers = 0;
  bool isPass = false;
}

EnQuestionsLevel readQuestionLevel() {
  int choiceLevelQuestion;
  do {
    choiceLevelQuestion = readPositiveNumber(
      '\n Your Level: [1]:Easy, [2]:Mid, [3]:Hard, [4]:Mix ?',
    );
  } while (choiceLevelQuestion > 4 || choiceLevelQuestion < 1);
  return EnQuestionsLevel.values[choiceLevelQuestion - 1];
}

EnOperationsType readQuestionType() {
  int choiceTypeQuestion;
  do {
    choiceTypeQuestion = readPositiveNumber(
      '\n Your Type: [1]:Add, [2]:Sub, [3]:Mul, [4]:Div, [5]:Mix ?',
    );
  } while (choiceTypeQuestion < 1 || choiceTypeQuestion > 5);
  return EnOperationsType.values[choiceTypeQuestion - 1];
}

int simpleCalculator(int number1, int number2, EnOperationsType questionType) {
  switch (questionType) {
    case EnOperationsType.add:
      return number1 + number2;
    case EnOperationsType.sub:
      return number1 - number2;
    case EnOperationsType.mul:
      return number1 * number2;
    case EnOperationsType.div:
      return number2 != 0 ? number1 ~/ number2 : 0;
    default:
      return number1 + number2;
  }
}

EnOperationsType getRandomOperationType() {
  int op = randomNumber(0, 3);

  return EnOperationsType.values[op];
}

String getOperationSymbol(EnOperationsType operation) {
  List<String> lsOperation = ['+', '-', 'x', '÷', 'Mix'];
  return lsOperation[operation.index];
}

String getQuestionsLevelText(EnQuestionsLevel questionsLevel) {
  List<String> listQuestionLevel = ["Easy", "Medium", "Hard", "Mixed"];
  return listQuestionLevel[questionsLevel.index];
}

void printTheQuestion(ClsQuiz clsQuiz, int questionNumber) {
  print("\n");
  print('Question [ ${questionNumber + 1} / ${clsQuiz.numberOfQuestions} ]');
  print('${clsQuiz.questionList![questionNumber].number1}');
  print(
    '${clsQuiz.questionList![questionNumber].number2}\t${getOperationSymbol(clsQuiz.questionList![questionNumber].operationsType!)}',
  );
  print('----------------');
}

void correctTheQuestionAnswer(ClsQuiz clsQuiz, int questionNumber) {
  if (clsQuiz.questionList![questionNumber].playerAnswer !=
      clsQuiz.questionList![questionNumber].correctAnswer) {
    clsQuiz.questionList![questionNumber].answerResult = false;
    clsQuiz.numberOfWrongAnswers++;

    print('Wrong Answer :-(');
    print(
      'The correct answer is: ${clsQuiz.questionList![questionNumber].correctAnswer}',
    );
  } else {
    clsQuiz.questionList![questionNumber].answerResult = true;
    clsQuiz.numberOfRightAnswers++;

    print('Right Answer :-)');
  }

  //setScreenColor(clsQuiz.QuestionList![questionNumber].answerResult);
}

void askAndCorrectQuestionListAnswer(ClsQuiz clsQuiz) {
  for (
    int questionNumber = 0;
    questionNumber < clsQuiz.numberOfQuestions!;
    questionNumber++
  ) {
    printTheQuestion(clsQuiz, questionNumber);
    clsQuiz.questionList![questionNumber].playerAnswer = readPositiveNumber('');
    correctTheQuestionAnswer(clsQuiz, questionNumber);
  }
  clsQuiz.isPass = clsQuiz.numberOfRightAnswers >= clsQuiz.numberOfWrongAnswers;
}

ClsQuestion generateQuestion(
  EnQuestionsLevel questionLevel,
  EnOperationsType opType,
) {
  ClsQuestion clsQuestion = ClsQuestion();

  if (questionLevel == EnQuestionsLevel.mix) {
    questionLevel = EnQuestionsLevel.values[randomNumber(0, 2)];
  }
  if (opType == EnOperationsType.mixOp) {
    opType = getRandomOperationType();
  }

  clsQuestion.operationsType = opType;
  clsQuestion.questionsLevel = questionLevel;

  int min = 1, max = 10;
  switch (questionLevel) {
    case EnQuestionsLevel.easyLevel:
      min = 1;
      max = 10;
      break;
    case EnQuestionsLevel.medLevel:
      min = 10;
      max = 50;
      break;
    case EnQuestionsLevel.hardLevel:
      min = 50;
      max = 100;
      break;
    default:
      break;
  }

  clsQuestion.number1 = randomNumber(min, max);
  clsQuestion.number2 = randomNumber(min, max);

  clsQuestion.correctAnswer = simpleCalculator(
    clsQuestion.number1,
    clsQuestion.number2,
    clsQuestion.operationsType!,
  );

  return clsQuestion;
}

void generateQuizQuestion(ClsQuiz clsQuiz) {
  for (int question = 0; question < clsQuiz.numberOfQuestions!; question++) {
    clsQuiz.questionList![question] = generateQuestion(
      clsQuiz.questionsLevel!,
      clsQuiz.opType!,
    );
  }
}

void playMathGame() {
  ClsQuiz clsQuiz = ClsQuiz();
  clsQuiz.numberOfQuestions = readPositiveNumber(
    'How many rounds do you want to play from 1 to 10?',
  );
  clsQuiz.questionList = List.generate(
    clsQuiz.numberOfQuestions!,
    (_) => ClsQuestion(),
  );
  clsQuiz.questionsLevel = readQuestionLevel();
  clsQuiz.opType = readQuestionType();
  generateQuizQuestion(clsQuiz);
  askAndCorrectQuestionListAnswer(clsQuiz);
  printQuizResults(clsQuiz);
}

// void  setWinnerScreenColor(EnWinner winner) {
//   switch (winner) {
//     case EnWinner.person:
//       print('\x1B[42m');
//       break;
//     case EnWinner.computer:
//       print('\a');
//       print('\x1B[41m');
//       break;
//     case EnWinner.draw:
//       print('\x1B[46m');
//   }
// }
String tabs(int numberOfTabs) {
  return '\t' * numberOfTabs;
}

void showGameOverScreen() {
  final t = tabs(2);

  stdout.write('$t------------------------------------------\n\n');
  stdout.write('$t+  +  +  G  A  M  E  O  V  E  R  +  +  +\n');
  stdout.write('$t------------------------------------------\n\n');
}

void printQuizResults(ClsQuiz clsQuiz) {
  final t = tabs(2);

  stdout.write('$t--------------[ Game Results ]--------------\n');
  stdout.write('$t Game Rounds        : ${clsQuiz.numberOfQuestions}\n');
  stdout.write(
    '$t Question Level     : ${getQuestionsLevelText(clsQuiz.questionsLevel!)}\n',
  );
  stdout.write(
    '$t Question Type      : ${getOperationSymbol(clsQuiz.opType!)}\n',
  );
  stdout.write('$t Correct Answer     : ${clsQuiz.numberOfRightAnswers}\n');
  stdout.write('$t Wrong Answer       : ${clsQuiz.numberOfWrongAnswers}\n');
  stdout.write(
    '$t ${(clsQuiz.isPass ? "You Passed the Quiz!\n" : "You Failed the Quiz!\n")}',
  );
  stdout.write('$t---------------------------------------------\n');

  //  setWinnerScreenColor(gameResults.gameWinner!);
}

void startGame() {
  String playAgain = 'Y';
  do {
    playMathGame();

    playAgain = readOnlyString(
      message: '\nDo you want to play again? (Y/N):  ',
    );
  } while (playAgain == 'y' || playAgain == "Y");
}

void main() {
  startGame();
}
