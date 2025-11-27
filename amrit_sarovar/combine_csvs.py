import os
import csv
from pathlib import Path

# Directory containing the CSV files
csv_dir = Path('data/csvs')
output_file = 'combined_timeseries.csv'

# Get all CSV files
csv_files = sorted(csv_dir.glob('*.csv'))

print(f"Found {len(csv_files)} CSV files")

# Open output file
with open(output_file, 'w', newline='') as outfile:
    writer = None
    header_written = False
    
    for csv_file in csv_files:
        # Extract sarovar_id from filename (without .csv extension)
        sarovar_id = csv_file.stem
        
        with open(csv_file, 'r') as infile:
            reader = csv.reader(infile)
            header = next(reader)
            
            # Write header on first file
            if not header_written:
                writer = csv.writer(outfile)
                writer.writerow(['Sarovar_Id'] + header)
                header_written = True
            
            # Write data rows with sarovar_id
            for row in reader:
                writer.writerow([sarovar_id] + row)

print(f"Combined CSV created: {output_file}")
print(f"Total files processed: {len(csv_files)}")
