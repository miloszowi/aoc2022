import 'dart:io';

void main()
{
	List<Map<String, String>> plays = readPlaysFromInput();
	Map<String, int> scoring = {
		'X': 1,
		'Y': 2,
		'Z': 3
	};

	int totalResult = 0;

	for (final play in plays) {
		totalResult += getChallengeScoreResult(play['yourPlay'], play['enemyPlay']) + scoring[play['yourPlay']];
	}

	print(totalResult);
}

List<Map<String, String>> readPlaysFromInput()
{
	List<Map<String, String>> plays = [];
    Map<String, Map<String, String>> yourPlayModifiedMap = {
        'X': {
            'A': 'Z',
            'B': 'X',
            'C': 'Y'
        },
        'Y': {
            'A': 'X',
            'B': 'Y',
            'C': 'Z'
        },
        'Z': {
            'A': 'Y',
            'B': 'Z',
            'C': 'X'
        }
    };

	while (true)
	{
		var currentLine = stdin.readLineSync();
		if (null == currentLine) break;
		var splitedLine = currentLine.split(' ');

		plays.add(<String, String>{
			'yourPlay': yourPlayModifiedMap[splitedLine[1]][splitedLine[0]],
			'enemyPlay': splitedLine[0]
		});
	}

	return plays;
}

int getChallengeScoreResult(String yourPlay, String enemyPlay)
{
	Map<String, String> counterPlays = {
		'Y': 'A',
		'Z': 'B',
		'X': 'C'
	};

	Map<String, String> drawList = {
		'X': 'A',
		'Y': 'B',
		'Z': 'C'
	};

	if (drawList[yourPlay] == enemyPlay) {
		return 3;
	}

	if (counterPlays[yourPlay] == enemyPlay) {
		return 6;
	}

	return 0;
}