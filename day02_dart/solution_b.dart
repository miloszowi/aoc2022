import 'dart:io';

void main()
{
    Map<String, int> translate = {'X': 1, 'Y': 2, 'Z': 3, 'A': 1, 'B': 2, 'C': 3};
    int result = 0;

	while (true)
	{
	    var line = stdin.readLineSync();
	    if (null == line) break;
	    var splitted = line.split(' ');
	    result += getPlayResult(translate[splitted[0]], translate[splitted[1]]);
	}

	print(result);
}

int getPlayResult(int enemyPlay, int yourPlay)
{
    Map<int, int> beatMap = {1: 2, 2: 3, 3: 1};
    Map<int, int> resultMap = {1: 0, 2: 3, 3: 6};
    int playResult = resultMap[yourPlay];

    if (playResult == 0) {
        yourPlay = beatMap.keys.firstWhere((k) => beatMap[k] == enemyPlay, orElse: () => null);;
    } else if (playResult == 3) {
        yourPlay = enemyPlay;
    } else {
        yourPlay = beatMap[enemyPlay];
    }

    return playResult + yourPlay;
}
