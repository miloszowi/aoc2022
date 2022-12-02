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
    if (enemyPlay == yourPlay) return 3 + yourPlay;
    if (beatMap[yourPlay] == enemyPlay) return 0 + yourPlay;

    return 6 + yourPlay;
}
