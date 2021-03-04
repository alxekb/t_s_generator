### The T&C generator is software which given:

- A template

- A dataset

Transforms the template into a Document expanding the template tags into their representation using the dataset. Below you can find more details.

### Template

Is a text made of:

- Plain text

- Tags


### TAGS

The tags supported are:

- Clauses: <b>[CLAUSE-#{ID}]</b>

- Sections: A group of clauses, represented with <b>[SECTION-#{ID}]</b>

### Example

Given the following template:

    A T&C Document

    This document is made of plaintext.
    Is made of [CLAUSE-3].
    Is made of [CLAUSE-4].
    Is made of [SECTION-1].
    Your legals.


And the following dataset:

clauses:


     [
      { "id": 1, "text": 'The quick brown fox' },
      { "id": 2, "text": 'jumps over the lazy dog' },
      { "id": 3, "text": 'And dies' },
      { "id": 4, "text": 'The white horse is white' }
     ]


sections:

    [
      { "id": 1, "clauses_ids": [1, 2] }
    ]


Creates the following T&C document:

    A T&C Document

    This document is made of plaintext.
    Is made of And dies.
    Is made of The white horse is white.
    Is made of The quick brown fox;jumps over the lazy dog.
    Your legals.

## Non fuctional requirements

As well as the functional requirements we also want your solution to:

- Be written in ruby

- Have tests

- Include a Readme.md (think of it like the description you write on a github PR) which outlines:

- how to setup and run the application/automated tests

- design decisions

- how much time you took and what you would have done given more time.

The bulk of our score comes from how you completed these functional and non-functional requirements. We also evaluate:

- How idiomatic your ruby code is

- Good quality tests

- Good names of classes and methods

- Not over-engineering

- The OO design of your classes and methods - Meaningful commits

- Not spending way too long on it

## local setup

1. `cd` to the source code.

2. Run `bundle` to install gems from Gemfile.

3. Read the docs `yard server -r -d && open -a "Google Chrome" http://0.0.0.0:8808`

4. Run specs with `rake` command.

5. Use it well!
