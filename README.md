# Restaurant Manager (Bash)

A small terminal application for managing a list of restaurants, written in Bash for my Operating Systems / Linux course. The data is stored in a plain text file, and the program lets you list, add, delete, modify, and search entries from an interactive menu.

## Features

* **Listeaza** - shows all restaurants in an aligned table.
* **Adauga** - adds a new restaurant, asks for confirmation, and keeps the file sorted without duplicates.
* **Sterge** - deletes a restaurant by name, after confirmation.
* **Modifica** - changes the address, specialty, or phone number of an existing restaurant.
* **Cauta** - searches for a restaurant by name (case-insensitive).
* **Iesire** - exits the program.

The menu and messages are in Romanian.

## Project Files

| File | Purpose |
|------|---------|
| `proiect.sh` | Main script: checks the data file exists and runs the menu loop. |
| `functions` | The functions for adding, deleting, modifying, and searching (loaded by `proiect.sh`). |
| `restaurant` | The data file, one restaurant per line. |

## Data Format

Each line has five fields separated by `:`

```text
name:address:specialty:phone:year_opened
```

Example:

```text
Taverna Dorului:Brancoveanu:Sarmale cu mamaliga:0712123234:2015
```

## Concepts and Commands Used

* Bash: `select`, `case`, `while`, functions, `read`, sourcing another file with `.`
* Text processing: `grep` (search), `sed -i` (delete and replace in place), `sort -u` (sorting and removing duplicates), `column -t` (table output)
* Checking files with `[ -f ... ]` and printing errors to stderr

## How to Run

Keep the three files in the same folder, then:

```bash
bash proiect.sh
```

Or make it executable first:

```bash
chmod +x proiect.sh
./proiect.sh
```

The `column` command must be installed. On Ubuntu/Debian it is usually included, otherwise:

```bash
sudo apt install bsdmainutils
```

## Example

Choosing option 1 (Listeaza) prints:

```text
NUME RESTAURANT       ADRESA                          SPECIALITATE            TELEFON     AN DESCHIDERE
Trattoria Bella Vita  Militari Residence              Pizza Quattro Formaggi  0723345456  2024
Taverna Dorului       Brancoveanu                     Sarmale cu mamaliga     0712123234  2015
Bistro Salcamul       Crangasi                        Paste carbonara         0712234234  2022
Hanul Boieresc        Bucuresti sector 6 si sector 4  Ciorba de burta         0723345123  2023
```

## Known Limitations

* Names are matched from the start of the line, so the full name has to be typed when deleting or modifying (search ignores case, delete does not).
* When modifying a field, the program replaces the old text with `sed`, so characters like `/` or `&` in the new value can break the replacement.
* The `:` character can't be used inside a field, because it separates the fields.
