## **_SpaCy UI Component_**

This component primarily utilizes Decipher's [SpaCy NLP Service](https://github.com/DecipherNow/spacy-service) to process text inputs and make the analysis available for use within React projects.

This project will be abstracted to allow for implementing additional NLP services in the future.

[Spacy API documentation](https://github.com/DecipherNow/spacy-service/blob/master/docs/main.md)

### Basic Usage

```
import analyze from 'spacy-ui-component';

const DisplayComponent = ({ data }) => {
  return <pre>{JSON.stringify(data, null, 2)}</pre>;
};

export default analyze(
  'http://localhost:9000/analyses/full',
  'At 3:00 pm on August 5th, Justin Ely bought Google Corporation for 100 billion dollars at a 28% discount while on vacation in Minnesota. He made a lot of money',
  DisplayComponent
);
```

#### Output:

```
{
  "document": {
    "Coreference": {
      "clusters": [
        [
          "Justin Ely",
          "He"
        ]
      ],
      "mentions": [
        {
          "end": 36,
          "resolved": "Justin Ely",
          "start": 26,
          "text": "Justin Ely"
        },
        {
          "end": 139,
          "resolved": "Justin Ely",
          "start": 137,
          "text": "He"
        }
      ],
      "resolved": "At 3:00 pm on August 5th, Justin Ely bought Google Corporation for 100 billion dollars at a 28% discount while on vacation in Minnesota. Justin Ely made a lot of money"
    },
    "Entities": {
      "DATE": [
        {
          "name": "August 5th",
          "offset": {
            "end": 24,
            "start": 14
          }
        }
      ],
      "GPE": [
        {
          "name": "Minnesota",
          "offset": {
            "end": 135,
            "start": 126
          }
        }
      ],
      "MONEY": [
        {
          "name": "100 billion dollars",
          "offset": {
            "end": 86,
            "start": 67
          }
        }
      ],
      "ORG": [
        {
          "name": "Google Corporation",
          "offset": {
            "end": 62,
            "start": 44
          }
        }
      ],
      "PERCENT": [
        {
          "name": "28%",
          "offset": {
            "end": 95,
            "start": 92
          }
        }
      ],
      "PERSON": [
        {
          "name": "Justin Ely",
          "offset": {
            "end": 36,
            "start": 26
          }
        }
      ],
      "TIME": [
        {
          "name": "3:00 pm",
          "offset": {
            "end": 10,
            "start": 3
          }
        }
      ]
    },
    "Lemma": [
      {
        "lemma": "at",
        "name": "At"
      },
      {
        "lemma": "august",
        "name": "August"
      },
      {
        "lemma": "justin",
        "name": "Justin"
      },
      {
        "lemma": "ely",
        "name": "Ely"
      },
      {
        "lemma": "buy",
        "name": "bought"
      },
      {
        "lemma": "google",
        "name": "Google"
      },
      {
        "lemma": "corporation",
        "name": "Corporation"
      },
      {
        "lemma": "dollar",
        "name": "dollars"
      },
      {
        "lemma": "minnesota",
        "name": "Minnesota"
      },
      {
        "lemma": "-PRON-",
        "name": "He"
      },
      {
        "lemma": "make",
        "name": "made"
      }
    ],
    "POS": {
      "ADP": [
        {
          "name": "At",
          "offset": {
            "end": 2,
            "start": 0
          }
        },
        {
          "name": "on",
          "offset": {
            "end": 13,
            "start": 11
          }
        },
        {
          "name": "for",
          "offset": {
            "end": 66,
            "start": 63
          }
        },
        {
          "name": "at",
          "offset": {
            "end": 89,
            "start": 87
          }
        },
        {
          "name": "on",
          "offset": {
            "end": 113,
            "start": 111
          }
        },
        {
          "name": "in",
          "offset": {
            "end": 125,
            "start": 123
          }
        },
        {
          "name": "of",
          "offset": {
            "end": 153,
            "start": 151
          }
        }
      ],
      "DET": [
        {
          "name": "a",
          "offset": {
            "end": 91,
            "start": 90
          }
        },
        {
          "name": "a",
          "offset": {
            "end": 146,
            "start": 145
          }
        }
      ],
      "NOUN": [
        {
          "name": "pm",
          "offset": {
            "end": 10,
            "start": 8
          }
        },
        {
          "name": "5th",
          "offset": {
            "end": 24,
            "start": 21
          }
        },
        {
          "name": "dollars",
          "offset": {
            "end": 86,
            "start": 79
          }
        },
        {
          "name": "%",
          "offset": {
            "end": 95,
            "start": 94
          }
        },
        {
          "name": "discount",
          "offset": {
            "end": 104,
            "start": 96
          }
        },
        {
          "name": "while",
          "offset": {
            "end": 110,
            "start": 105
          }
        },
        {
          "name": "vacation",
          "offset": {
            "end": 122,
            "start": 114
          }
        },
        {
          "name": "lot",
          "offset": {
            "end": 150,
            "start": 147
          }
        },
        {
          "name": "money",
          "offset": {
            "end": 159,
            "start": 154
          }
        }
      ],
      "NUM": [
        {
          "name": "3:00",
          "offset": {
            "end": 7,
            "start": 3
          }
        },
        {
          "name": "100",
          "offset": {
            "end": 70,
            "start": 67
          }
        },
        {
          "name": "billion",
          "offset": {
            "end": 78,
            "start": 71
          }
        },
        {
          "name": "28",
          "offset": {
            "end": 94,
            "start": 92
          }
        }
      ],
      "PRON": [
        {
          "name": "He",
          "offset": {
            "end": 139,
            "start": 137
          }
        }
      ],
      "PROPN": [
        {
          "name": "August",
          "offset": {
            "end": 20,
            "start": 14
          }
        },
        {
          "name": "Justin",
          "offset": {
            "end": 32,
            "start": 26
          }
        },
        {
          "name": "Ely",
          "offset": {
            "end": 36,
            "start": 33
          }
        },
        {
          "name": "Google",
          "offset": {
            "end": 50,
            "start": 44
          }
        },
        {
          "name": "Corporation",
          "offset": {
            "end": 62,
            "start": 51
          }
        },
        {
          "name": "Minnesota",
          "offset": {
            "end": 135,
            "start": 126
          }
        }
      ],
      "PUNCT": [
        {
          "name": ",",
          "offset": {
            "end": 25,
            "start": 24
          }
        },
        {
          "name": ".",
          "offset": {
            "end": 136,
            "start": 135
          }
        }
      ],
      "VERB": [
        {
          "name": "bought",
          "offset": {
            "end": 43,
            "start": 37
          }
        },
        {
          "name": "made",
          "offset": {
            "end": 144,
            "start": 140
          }
        }
      ]
    },
    "Sentiment": {
      "negative": 0,
      "neutral": 1,
      "positive": 0,
      "sentiment": 0
    }
  }
}
```
