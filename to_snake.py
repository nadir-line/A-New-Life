import os
import re

def to_snake_case(name):
    root, ext = os.path.splitext(name)
    s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', root)
    s2 = re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1)
    s3 = re.sub(r'[^a-zA-Z0-9]', '_', s2)
    s4 = re.sub(r'_+', '_', s3)
    return s4.strip('_').lower() + ext.lower()

def is_hidden_or_excluded(path_segment):
    if path_segment.startswith('.'):
        return True
    return False

def process_directory_recursive(directory):
    for dirpath, dirnames, filenames in os.walk(directory, topdown=False):
        
        # Skip processing if any parent directory is hidden/excluded (like .git)
        path_parts = os.path.normpath(dirpath).split(os.sep)
        if any(is_hidden_or_excluded(part) for part in path_parts):
            continue

        # 1. Process files (Delete .uid files / Rename others)
        for filename in filenames:
            file_path = os.path.join(dirpath, filename)
            
            # Delete .uid files immediately
            if filename.lower().endswith('.uid'):
                try:
                    os.remove(file_path)
                    print(f"Deleted File:   '{file_path}'")
                except Exception as e:
                    print(f"Error deleting '{filename}': {e}")
                continue
            
            # Skip hidden files
            if is_hidden_or_excluded(filename):
                continue
                
            # Rename remaining files to snake_case
            new_filename = to_snake_case(filename)
            new_path = os.path.join(dirpath, new_filename)
            
            if file_path != new_path:
                counter = 1
                while os.path.exists(new_path):
                    name, ext = os.path.splitext(new_filename)
                    new_filename = f"{name}_{counter}{ext}"
                    new_path = os.path.join(dirpath, new_filename)
                    counter += 1
                
                os.rename(file_path, new_path)
                print(f"Renamed File:   '{filename}' -> '{new_filename}'")
        
        # 2. Rename directories
        for dirname in dirnames:
            if is_hidden_or_excluded(dirname):
                continue
                
            old_path = os.path.join(dirpath, dirname)
            new_dirname = to_snake_case(dirname)
            new_path = os.path.join(dirpath, new_dirname)
            
            if old_path != new_path:
                counter = 1
                while os.path.exists(new_path):
                    new_dirname = f"{to_snake_case(dirname)}_{counter}"
                    new_path = os.path.join(dirpath, new_dirname)
                    counter += 1
                
                os.rename(old_path, new_path)
                print(f"Renamed Folder: '{dirname}' -> '{new_dirname}'")

if __name__ == "__main__":
    target_directory = '.' 
    
    # Optional safety prompt
    confirm = input(f"Are you sure you want to delete all .uid files and snake_case rename contents in '{os.path.abspath(target_directory)}'? (y/n): ")
    if confirm.lower() == 'y':
        process_directory_recursive(target_directory)
        print("Processing complete!")
    else:
        print("Operation cancelled.")
