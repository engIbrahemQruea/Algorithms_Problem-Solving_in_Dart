import 'dart:io';

import 'package:level2/level2.dart';

enum EnGameChoice { stone, paper, scissor }

enum EnWinner { person, computer, draw }

class ClsRoundInfo {
  int roundNumber = 0;
  EnGameChoice? playerChoice;
  EnGameChoice? computerChoice;
  EnWinner? winner;
  String? winnerName;
}

class ClsGameResults {
  int gameRounds = 0;
  int playerWinTimes = 0;
  int computerWinTimes = 0;
  int drawTimes = 0;
  EnWinner? gameWinner;
  String winnerName = '';
}

EnGameChoice getComputerChoice() {
  return EnGameChoice.values[randomNumber(0, 2)];
}

EnWinner whoWonTheRound(ClsRoundInfo roundInfo) {
  if (roundInfo.playerChoice == roundInfo.computerChoice) {
    return EnWinner.draw;
  }
  switch (roundInfo.playerChoice) {
    case EnGameChoice.stone:
      if (roundInfo.computerChoice == EnGameChoice.paper) {
        return EnWinner.computer;
      }
      break;
    case EnGameChoice.paper:
      if (roundInfo.computerChoice == EnGameChoice.scissor) {
        return EnWinner.computer;
      }
      break;
    case EnGameChoice.scissor:
      if (roundInfo.computerChoice == EnGameChoice.stone) {
        return EnWinner.computer;
      }
      break;
    default:
  }
  return EnWinner.person;
}

EnWinner whoWonTheGame(int playerWinTimes, int computerWinTimes) {
  return (playerWinTimes > computerWinTimes)
      ? EnWinner.person
      : (computerWinTimes > playerWinTimes)
      ? EnWinner.computer
      : EnWinner.draw;
}

String getChoiceName(EnGameChoice choice) {
  List<String> lsChoice = ['Stone', 'Paper', 'Scissor'];
  return lsChoice[choice.index];
}

String getWinnerName(EnWinner winner) {
  List<String> lsWinner = ['Person', 'Computer', 'No Winner'];
  return lsWinner[winner.index];
}

EnGameChoice readPlayerChoice() {
  int choice;
  do {
    choice = readPositiveNumber(
      "\nYour Choice: [1]:Stone, [2]:Paper, [3]:Scissors? ",
    );
  } while (choice < 1 || choice > 3);
  return EnGameChoice.values[choice - 1];
}

void printRoundResult(ClsRoundInfo roundInfo) {
  final round = roundInfo.roundNumber;

  print('\n═══════════════ Round [$round] ═══════════════');

  print('Player Choice   : ${getChoiceName(roundInfo.playerChoice!)}');
  print('Computer Choice : ${getChoiceName(roundInfo.computerChoice!)}');
  print('Round Winner    : [ ${roundInfo.winnerName} ]');
  print('══════════════════════════════════════════════');
  setWinnerScreenColor(roundInfo.winner!);
}

void  setWinnerScreenColor(EnWinner winner) {
  switch (winner) {
    case EnWinner.person:
      print('\x1B[42m');
      break;
    case EnWinner.computer:
      print('\a');
      print('\x1B[41m');
      break;
    case EnWinner.draw:
      print('\x1B[46m');
  }
}

ClsGameResults fillGameResults(
  int gameRounds,
  int playerWinTimes,
  int computerWinTimes,
  int drawTimes,
  EnWinner gameWinner,
) {
  ClsGameResults gameResults = ClsGameResults();
  gameResults.gameRounds = gameRounds;
  gameResults.playerWinTimes = playerWinTimes;
  gameResults.computerWinTimes = computerWinTimes;
  gameResults.drawTimes = drawTimes;
  gameResults.gameWinner = gameWinner;
  gameResults.winnerName = getWinnerName(gameWinner);
  return gameResults;
}

ClsGameResults playGame(int gameRounds) {
  ClsRoundInfo roundInfo = ClsRoundInfo();
  int playerWinTimes = 0, computerWinTimes = 0, drawTimes = 0;
  for (int gameRound = 1; gameRound <= gameRounds; gameRound++) {
    roundInfo.roundNumber = gameRound;
    roundInfo.playerChoice = readPlayerChoice();
    roundInfo.computerChoice = getComputerChoice();
    roundInfo.winner = whoWonTheRound(roundInfo);
    roundInfo.winnerName = getWinnerName(roundInfo.winner!);

    if (roundInfo.winner == EnWinner.person) {
      playerWinTimes++;
    } else if (roundInfo.winner == EnWinner.computer) {
      computerWinTimes++;
    } else {
      drawTimes++;
    }
    printRoundResult(roundInfo);
  }
  return fillGameResults(
    gameRounds,
    playerWinTimes,
    computerWinTimes,
    drawTimes,
    whoWonTheGame(playerWinTimes, computerWinTimes),
  );
}

String tabs(int numberOfTabs) {
  return '\t' * numberOfTabs;
}

void showGameOverScreen() {
  final t = tabs(2);

  stdout.write('$t------------------------------------------\n\n');
  stdout.write('$t+  +  +  G  A  M  E  O  V  E  R  +  +  +\n');
  stdout.write('$t------------------------------------------\n\n');
}

void showFinalGameResult(ClsGameResults gameResults) {
  final t = tabs(2);

  stdout.write('$t--------------[ Game Results ]--------------\n');
  stdout.write('$t Game Rounds        : ${gameResults.gameRounds}\n');
  stdout.write('$t Player 1 Win Times : ${gameResults.playerWinTimes}\n');
  stdout.write('$t Computer Win Times : ${gameResults.computerWinTimes}\n');
  stdout.write('$t Draw Times         : ${gameResults.drawTimes}\n');
  stdout.write('$t Final Winner       : ${gameResults.winnerName}\n');
  stdout.write('$t---------------------------------------------\n');

  setWinnerScreenColor(gameResults.gameWinner!);
}

void restScreen() {
  print('\x1B[0m');
}

void startGame() {
  String playAgain = 'Y';
  do {
    restScreen();
    ClsGameResults gameResults = playGame(
      readPositiveNumber('How many rounds do you want to play from 1 to 10?'),
    );
    showGameOverScreen();
    showFinalGameResult(gameResults);
    playAgain = readAnyThing('\nDo you want to play again? (Y/N):  ');
  } while (playAgain == "Y" || playAgain == 'y');
}

void main() {
  startGame();
}
