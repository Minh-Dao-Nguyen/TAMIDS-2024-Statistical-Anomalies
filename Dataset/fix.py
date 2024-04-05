import csv

# Open the input CSV file
with open('coastalEconomy_CoastalStates.csv', 'r') as infile:
    with open('modified_file.csv', 'w', newline='') as outfile:
        reader = csv.reader(infile)
        writer = csv.writer(outfile)

        for row in reader:
            if len(row) <= 8:
                writer.writerow(row)

