"""
.SYNOPSIS
    Automated File Organiser
.DESCRIPTION
    This script scans the user's Downloads folder, categorizes files based on their 
    extensions, and automatically moves them into designated subfolders. 
    Useful for maintaining a clean workspace and understanding file system manipulation.
.AUTHOR
    Hartmut Kirsch
"""

import os
import shutil

# Automatically locate the current user's Downloads folder
DOWNLOADS_PATH = os.path.expanduser('~/Downloads')

# Define categories and their corresponding file extensions
CATEGORIES = {
    'Documents': ['.pdf', '.docx', '.txt', '.xlsx', '.pptx', '.csv'],
    'Images': ['.jpg', '.jpeg', '.png', '.gif', '.webp'],
    'Installers': ['.exe', '.msi', '.pkg', '.dmg'],
    'Archives': ['.zip', '.tar', '.gz', '.rar'],
    'Scripts': ['.ps1', '.py', '.bat', '.sh']
}

def organize_downloads():
    print(f"Scanning {DOWNLOADS_PATH} for files...\n")
    moved_count = 0

    # Ensure category folders exist before attempting to move files
    for category in CATEGORIES.keys():
        category_path = os.path.join(DOWNLOADS_PATH, category)
        if not os.path.exists(category_path):
            os.makedirs(category_path)

    # Scan through items in the Downloads folder
    for filename in os.listdir(DOWNLOADS_PATH):
        file_path = os.path.join(DOWNLOADS_PATH, filename)

        # Skip if it's a folder, we only want to move loose files
        if os.path.isdir(file_path):
            continue

        # Extract the file extension (e.g., '.pdf')
        file_ext = os.path.splitext(filename)[1].lower()

        # Check which category the file belongs to and move it
        for category, extensions in CATEGORIES.items():
            if file_ext in extensions:
                dest_path = os.path.join(DOWNLOADS_PATH, category, filename)
                shutil.move(file_path, dest_path)
                print(f"Moved: {filename} -> {category}/")
                moved_count += 1
                break # Stop checking categories once a match is found

    print(f"\nCleanup complete! Successfully organized {moved_count} files.")

if __name__ == '__main__':
    organize_downloads()
