import os
import shutil

def rename_aax_files(directory):
    for filename in os.listdir(directory):
        if filename.endswith(".aax"):
            print("Working on: " + filename)
            book_number = filename.split('Book')[1].split('_')[0]
            book_name = filename.split('DiscworldBook')[0]
            
            # We must construct additional filenames
            new_filename = "Book-" + book_number + "_" + book_name + ".aax"
            print(new_filename)
            
            # Move the AAX into a subdir, this is for tidyness later
            new_directory = os.path.join(directory, new_filename.split('.')[0])
            os.makedirs(new_directory, exist_ok=True)
            
            # Wang the file in the new dir
            shutil.move(os.path.join(directory, filename), os.path.join(new_directory, new_filename))

if __name__ == "__main__":
    # If called direct, just go brrrrrrr wherever we are
    directory = "./"
    rename_aax_files(directory)
