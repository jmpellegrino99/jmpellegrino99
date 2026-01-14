#!/opt/homebrew/bin/python3
import os
import json
from datetime import datetime

DIARY_FILE = "diary_entries.json"

def load_diary():
    if os.path.exists(DIARY_FILE):
        with open(DIARY_FILE, 'r') as file:
            return json.load(file)
    else:
        return []

def save_diary(diary_entries):
    with open(DIARY_FILE, 'w') as file:
        json.dump(diary_entries, file, indent=2)

def add_entry():
    date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    title = input("Enter the title for the entry: ")
    content = input("Enter the content of the entry: ")

    entry = {"date": date, "title": title, "content": content}
    return entry

def view_entries(diary_entries):
    for entry in diary_entries:
        print(f"\nDate: {entry['date']}\nTitle: {entry['title']}\nContent: {entry['content']}\n")

def main():
    print("Personal Diary System")

    diary_entries = load_diary()

    while True:
        print("\n1. Add Entry\n2. View Entries\n3. Quit")
        choice = input("Enter your choice (1/2/3): ")

        if choice == '1':
            entry = add_entry()
            diary_entries.append(entry)
            save_diary(diary_entries)
            print("Entry added successfully!")

        elif choice == '2':
            view_entries(diary_entries)

        elif choice == '3':
            print("Exiting the Personal Diary System. Goodbye!")
            break

        else:
            print("Invalid choice. Please enter 1, 2, or 3.")

if __name__ == "__main__":
    main()

