
***Spacy Service***
This component primarily utilizes decipher's Spacy-service (https://github.com/DecipherNow/spacy-service) to process input.

The project will be abstracted to allow for implementation of other NLP services.

when you've `dc up` you can test spacy service with:
```curl -X POST -d '{"document":"Do we have to go to the party in the car?"}' http://127.0.0.1:9000/analyses/pos```

Spacy API documentation: `https://github.com/DecipherNow/spacy-service/blob/master/docs/main.md`