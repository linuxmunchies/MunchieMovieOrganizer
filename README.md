# Movie File Organizer

A simple bash script to organize loose movie files into properly structured folders.

## Problem

When you have movie files (`.mkv` and `.nfo`) sitting directly in your movies folder without subfolders, they can be difficult to manage and may not be detected by media management applications. This script automatically creates the proper folder structure for organized movie libraries.

## Features

- Automatically detects loose `.mkv` files in your movies directory
- Extracts movie names from filenames using `{tmdb-` tags
- Creates organized folders named after each movie
- Moves both `.mkv` and `.nfo` files into their respective folders
- Preserves existing folder structure (only processes loose files)
- Safe handling of special characters and spaces in filenames

## Requirements

- Bash shell (Linux, macOS, WSL, or any Unix-like environment)
- Read/write permissions in your movies directory

## Installation

1. Download the script:
```
wget https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/organize_movies.sh
```

Or clone this repository:
```
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
```

2. Make it executable:
```
chmod +x organize_movies.sh
```

## Usage

1. **Edit the script** to set your movies directory path:
```
MOVIES_DIR="/path/to/your/movies"
```

2. **Run the script**:
```
./organize_movies.sh
```

Or run directly with bash:
```
bash organize_movies.sh
```

## How It Works

The script processes movie files following this logic:

1. Scans for all `.mkv` files in the root of your movies directory
2. Extracts the movie name by parsing everything before the `{tmdb-` tag
3. Creates a folder with that movie name (if it doesn't exist)
4. Moves the `.mkv` file into the new folder
5. Moves the matching `.nfo` file (if it exists) into the same folder

## After Running the Script

Once your files are organized, your movie library will have a clean, structured format with each movie in its own folder. This organization makes it easier to:

- Browse your collection
- Import into media management applications
- Backup and manage your media files
- Keep related files together (movie file, metadata, subtitles, etc.)

## Supported Filename Format

The script expects filenames in the format:
```
Movie Name (Year) {tmdb-ID} [additional-info].mkv
```

The `{tmdb-` tag is essential for the script to identify where the movie name ends.

## Safety Features

- Only processes files in the root directory (ignores existing subfolders)
- Creates folders only when needed (won't overwrite existing folders)
- Provides detailed output showing all actions taken
- Skips files without the `{tmdb-` tag pattern

## Troubleshooting

**Script doesn't find any files:**
- Ensure your `.mkv` files contain the `{tmdb-` tag in the filename
- Verify the `MOVIES_DIR` path is correct
- Check that you're running the script from the correct directory

**Permission denied errors:**
- Make sure the script is executable: `chmod +x organize_movies.sh`
- Verify you have write permissions in the movies directory

**Files aren't being moved:**
- Check that the corresponding `.nfo` file has the exact same base name as the `.mkv` file

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Designed for UNRAID and Docker-based media server setups
- Works with various media management applications

---

**Note:** Always backup your media files before running file organization scripts!
```
