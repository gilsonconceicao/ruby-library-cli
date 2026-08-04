# Ruby Book Manager

A simple command-line CRUD application built in Ruby that stores books in a JSON file.

This project was created to practice Ruby fundamentals, including:

- Classes and objects
- Instance variables
- Methods
- Arrays and Hashes
- JSON persistence
- File handling
- Loops and conditionals
- UUID generation
- Date and time

## Features

- ✅ Add a new book
- ✅ List all books
- ✅ Search a book by ID
- ✅ Delete a book
- ✅ Persist data in a JSON file

## Project Structure

```
.
├── main.rb
├── data.json
└── README.md
```

## Requirements

- Ruby 3.x

Check your Ruby version:

```bash
ruby -v
```

## Installation

Clone the repository:

```bash
git clone https://github.com/your-username/ruby-book-manager.git
```

Go to the project folder:

```bash
cd ruby-book-manager
```

## Running the project

Run:

```bash
ruby main.rb
```

You'll see:

```
========== MENU ==========
1 - List all books
2 - Search by ID
3 - Add new book
4 - Delete book
E - Exit
```

## Example

Adding a book:

```
Title: Clean Code
Author: Robert C. Martin
Year: 2008
```

Listing books:

```
--------------------------------------------------
ID:      8c84...
Title:   Clean Code
Author:  Robert C. Martin
Year:    2008
Created: 03/08/2026 22:30
```

## Technologies

- Ruby
- JSON
- SecureRandom

## What I learned

This project helped me practice:

- Object-Oriented Programming in Ruby
- Reading and writing JSON files
- Working with Arrays and Hashes
- Organizing code into classes
- Building a CRUD application