grammar AFTN;

message:
	SOM heading CRLF destination CRLF origin CRLF* text CRLF+ EOM;

heading: SP transmission (SP additionalService)?;

transmission: LETTER LETTER LETTER DIGIT DIGIT DIGIT;
additionalService: DIGIT+;

destination: priority SP address;

priority: LETTER LETTER;

address: location organization department;
location: LETTER LETTER LETTER LETTER;
organization: LETTER LETTER LETTER;
department: LETTER;

origin: filingTime SP address;

filingTime: day hour minute;
day: DIGIT DIGIT;
hour: DIGIT DIGIT;
minute: DIGIT DIGIT;

text: (CRLF? (LETTER | DIGIT | PUNCTUATION | SP)+)+;

LETTER: [A-Z];
DIGIT: [0-9];
PUNCTUATION: [-'!&£()+/:=?,.];
CRLF: ('\r\n' | '\n');
SP: ' ';

SOM: 'ZCZC';
EOM: 'NNNN' EOF;
